Установка
----------

- Скачать и установить [Python](https://www.python.org/downloads/) и [MySql](https://dev.mysql.com/downloads/mysql/5.5.html)
- Создать virtualenv:

	for Windows
	```text
	python -m venv env
	env\Scripts\activate.bat
	```
	For Linux
	```text
	python3 -m venv env
	source env/bin/activate for Linux
	```
- Установить requirements
	```text
	pip install -r requirements.txt
	```
- Импортировать db.sql
- Настроить подключение к бд в app.py
	
	```python
	# MySQL configurations
	app.config['MYSQL_DATABASE_USER'] = 'root'
	app.config['MYSQL_DATABASE_PASSWORD'] = '123456'
	app.config['MYSQL_DATABASE_DB'] = 'test'
	app.config['MYSQL_DATABASE_HOST'] = 'localhost'
	```
	
- Запуск:
	
	for Windows
	```text
	set FLASK_APP=app.py
	flask run
	```
	For Linux
	```text
	export FLASK_APP=app.py
	flask run
	```
	

