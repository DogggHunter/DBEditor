from flask import Flask, request, render_template, redirect, flash, url_for
from flaskext.mysql import MySQL
import json
from flask import jsonify
import datetime
import pymysql

app = Flask(__name__)
mysql = MySQL()

# MySQL configurations
app.config['MYSQL_DATABASE_USER'] = 'root'
app.config['MYSQL_DATABASE_PASSWORD'] = '123456'
app.config['MYSQL_DATABASE_DB'] = 'test'
app.config['MYSQL_DATABASE_HOST'] = 'localhost'

app.secret_key = 'A0Zr98j/4yX R~XHH!jkN]LWXFDGR/,,,$%?RT'

mysql.init_app(app)
conn = mysql.connect()
cursor = conn.cursor()


@app.route('/', methods=('GET',))
def index():
    cursor.execute('SHOW TABLES')
    t_names = cursor.fetchall()
    t_names = [x for x in t_names if x[0] != 'protocol']
    return render_template('index.html', t_names=t_names)


@app.route('/error', methods=('GET',))
def error_page(err=None):
    return render_template('error.html', error=err)


@app.route('/insert/<string:table_name>', methods=('GET', 'POST'))
def insert_record(table_name):
    try:
        cursor.execute(f'DESCRIBE {table_name}')
        struct = cursor.fetchall()[1:]

        select_col = ()
        if table_name == 'employee':
            cursor.execute("SELECT id, name FROM department")
            select_col = cursor.fetchall()
        elif table_name == 'vacations':
            cursor.execute("SELECT id, name FROM employee")
            select_col = cursor.fetchall()

        if request.method == 'POST':
            query = f"INSERT INTO {table_name}("
            for col in struct:
                if col[0] == struct[len(struct)-1][0]:
                    query += f"{col[0]})"
                else:
                    query += f"{col[0]}, "

            query += " VALUE("

            for num, col in enumerate(request.form):
                if col == struct[num][0]:
                    if col == struct[len(struct)-1][0]:
                        query += f"'{request.form[struct[num][0]]}')"
                        break
                    if col == 'employee_id' or col == 'department_id':
                        entry = [id for id, name in select_col if name == request.form[struct[num][0]]][0]
                        query += f"'{entry}', "
                    else:
                        query += f"'{request.form[struct[num][0]]}', "

            print(query)
            cursor.execute(query)
            conn.commit()
    except pymysql.Error as err:
        flash(err.args[1])
        return redirect(url_for('error_page'))

    return render_template('insert.html', struct=struct, select_col=select_col)


@app.route('/delete/<string:table_name>/<int:id>', methods=('POST',))
def delete_record(table_name, id):
    try:
        cursor.execute(f"DELETE FROM {table_name} WHERE id = {id}")
        conn.commit()
    except pymysql.Error as err:
        flash(err.args[1])
        return redirect(url_for('error_page'))

    return redirect(url_for('show_table', table_name=table_name))


@app.route('/edit/<string:table_name>/<int:id>', methods=('GET', 'POST'))
def edit_record(table_name, id):
    try:
        cursor.execute(f'DESCRIBE {table_name}')
        struct = cursor.fetchall()
        select_col = ()
        if table_name == 'employee':
            query = f"SELECT e.id, d.name, e.name, e.fired FROM department d INNER JOIN employee e ON d.id=e.department_id WHERE e.id = {id}"
            cursor.execute("SELECT id, name FROM department")
            select_col = cursor.fetchall()
        elif table_name == 'vacations':
            query = f"SELECT v.id, e.name, v.d_start, v.d_end FROM employee e INNER JOIN vacations v ON e.id=v.employee_id WHERE v.id = {id}"
            cursor.execute("SELECT id, name FROM employee")
            select_col = cursor.fetchall()
        else:
            query = f'SELECT * FROM {table_name} WHERE id = {id}'
        cursor.execute(query)
        row = cursor.fetchone()

        if not row:
            flash("Id not found")
            return redirect(url_for('error_page'))

        row = list(row)
        for col in row:
            if type(col) == datetime.date:
                row[row.index(col)] = col.strftime("%Y-%m-%d")

        if request.method == 'POST':
            first = True
            query = f"UPDATE {table_name} SET "
            stat = ""
            for num, col in enumerate(request.form):
                if col == struct[num][0]:
                    if col == 'id':
                        continue
                    if request.form[struct[num][0]] != row[num]:
                        if col == 'employee_id' or col == 'department_id':
                            entry = [id for id, name in select_col if name == request.form[struct[num][0]]][0]
                            if first:
                                first = False
                                stat += f"{col} = '{entry}'"
                            else:
                                stat += f", {col} = '{entry}'"
                        else:
                            if first:
                                first = False
                                stat += f"{col} = '{request.form[struct[num][0]]}'"
                            else:
                                stat += f", {col} = '{request.form[struct[num][0]]}'"

            if not stat:
                flash("Data has not changed")
            query += stat
            query += f" WHERE id = '{row[0]}'"
            cursor.execute(query)
            conn.commit()
            print(query)
            return redirect(url_for('edit_record', table_name=table_name, id=id))

    except pymysql.Error as err:
        flash(err.args[1])
        return redirect(url_for('error_page'))

    return render_template('edit.html', struct=struct, select_col=select_col, row=row, table_name=table_name)


@app.route('/show/<string:table_name>', methods=('GET', 'POST'))
def show_table(table_name):
    try:
        cursor.execute(f'DESCRIBE {table_name}')
        struct = cursor.fetchall()
        if table_name == 'employee':
            query = "SELECT e.id, d.name, e.name, e.fired FROM department d INNER JOIN employee e ON d.id=e.department_id "
        elif table_name == 'vacations':
            query = "SELECT v.id, e.name, v.d_start, v.d_end FROM employee e INNER JOIN vacations v ON e.id=v.employee_id "
        else:
            query = f'SELECT * FROM {table_name} '

        cursor.execute(query)
        data = cursor.fetchall()

        if request.method == 'POST':
            methods = json.loads(request.form['sort_methods'])
            directions = json.loads(request.form['sort_directions'])

            cond_methods = json.loads(request.form['condition_methods'])
            cond_conditions = json.loads(request.form['condition_conditions'])
            cond_input_data = json.loads(request.form['condition_data'])

            cond_stat = ""
            first_cond = True
            data = list(zip(cond_methods, cond_conditions, cond_input_data))
            data = list(map(lambda x: list(x), data))
            for elem in data:
                if elem[0] and elem[1] and elem[2]:
                    if elem[0] == 'department_id':
                        data[data.index(elem)][0] = 'd.name'
                    if elem[0] == 'employee_id':
                        data[data.index(elem)][0] = 'e.name'
                    if elem[0] == 'id' and table_name == 'employee':
                        data[data.index(elem)][0] = 'e.id'
                    if elem[0] == 'id' and table_name == 'vacations':
                        data[data.index(elem)][0] = 'v.id'
                    if elem[0] == 'name' and table_name == 'employee':
                        data[data.index(elem)][0] = 'e.name'
                    if elem[1] == 'Равняется':
                        data[data.index(elem)][1] = '='
                    if elem[1] == 'Не равняется':
                        data[data.index(elem)][1] = '!='
                    if elem[1] == 'Больше':
                        data[data.index(elem)][1] = '>'
                    if elem[1] == 'Меньше':
                        data[data.index(elem)][1] = '<'
                    if elem[1] == 'Больше равно':
                        data[data.index(elem)][1] = '>='
                    if elem[1] == 'Меньше равно':
                        data[data.index(elem)][1] = '<='
                    if elem[1] == 'Содержит':
                        data[data.index(elem)][1] = 'LIKE'
                    if first_cond:
                        first_cond = False
                        if elem[1] == 'LIKE':
                            cond_stat += f"WHERE {elem[0]} {elem[1]} '%{elem[2]}%'"
                        else:
                            cond_stat += f"WHERE {elem[0]} {elem[1]} '{elem[2]}'"
                    else:
                        if elem[1] == 'LIKE':
                            cond_stat += f" AND {elem[0]} {elem[1]} '%{elem[2]}%'"
                        else:
                            cond_stat += f" AND {elem[0]} {elem[1]} '{elem[2]}'"

            query += cond_stat
            sort_stat = ""
            if cond_stat:
                sort_stat = " "
            first = True
            data = list(zip(methods, directions))
            data = list(map(lambda x: list(x), data))
            for elem in data:
                if elem[0] and elem[1]:
                    direction = ""
                    if elem[0] == 'name' and table_name == 'employee':
                        data[data.index(elem)][0] = 'e.name'
                    if elem[0] == 'department_id':
                        data[data.index(elem)][0] = 'd.name'
                    if elem[0] == 'employee_id':
                        data[data.index(elem)][0] = 'e.name'
                    if elem[1] == 'По убыванию':
                        direction = ' DESC'
                    if first:
                        first = False
                        sort_stat += f"ORDER BY {elem[0]}{direction}"
                    else:
                        sort_stat += f", {elem[0]}{direction}"
            query += sort_stat
            cursor.execute(query)
            data = cursor.fetchall()

            d_data = list(map(lambda x: list(x), data))
            for row in d_data:
                for col in row:
                    if type(col) == datetime.date:
                        row[row.index(col)] = col.strftime("%Y-%m-%d")

            return jsonify({'res': d_data, 'table_name': table_name})

    except pymysql.Error as err:
        flash(err.args[1])
        return redirect(url_for('error_page'))

    return render_template('show.html', struct=struct, data=data, table_name=table_name)


if __name__ == '__main__':
    app.run()
