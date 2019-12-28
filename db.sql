CREATE TABLE Department(
	id int NOT NULL AUTO_INCREMENT,
	name varchar(100) NOT NULL
	CHARACTER SET utf8,
	PRIMARY KEY(id)
);

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'Подразделение 1');
INSERT INTO `department` VALUES ('2', 'Подразделение 2');
INSERT INTO `department` VALUES ('3', 'Подразделение 3');
INSERT INTO `department` VALUES ('4', 'Подразделение 4');
INSERT INTO `department` VALUES ('5', 'Подразделение 5');

CREATE TABLE Employee(
	id int NOT NULL AUTO_INCREMENT,
	department_id int NOT NULL,
	name varchar(128) NOT NULL
	CHARACTER SET utf8,
	fired date,
	PRIMARY KEY(id),
	FOREIGN KEY(department_id) REFERENCES Department(id)
);

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', 'Сафонов Лев Петрович', '2018-03-03');
INSERT INTO `employee` VALUES ('2', '1', 'Овчинников Ростислав Александрович', null);
INSERT INTO `employee` VALUES ('3', '1', 'Устинов Яков Васильевич', null);
INSERT INTO `employee` VALUES ('4', '1', 'Костин Эрик Анатолиевич', null);
INSERT INTO `employee` VALUES ('5', '1', 'Яловой Оскар Иванович', null);
INSERT INTO `employee` VALUES ('6', '2', 'Каськив Андрей Алексеевич', null);
INSERT INTO `employee` VALUES ('7', '2', 'Острожский Валерий Эдуардович', null);
INSERT INTO `employee` VALUES ('8', '2', 'Пархоменко Сергей Эдуардович', null);
INSERT INTO `employee` VALUES ('9', '2', 'Быков Алексей Сергеевич', null);
INSERT INTO `employee` VALUES ('10', '2', 'Сазонов Борис Артёмович', null);
INSERT INTO `employee` VALUES ('11', '3', 'Петров Богдан Генадьевич', '2018-01-15');
INSERT INTO `employee` VALUES ('12', '3', 'Дзюба Антон Сергеевич', null);
INSERT INTO `employee` VALUES ('13', '3', 'Миронов Захар Петрович', null);
INSERT INTO `employee` VALUES ('14', '3', 'Сысоев Дмитрий Дмитриевич', null);
INSERT INTO `employee` VALUES ('15', '3', 'Кравчук Михаил Антонович', null);
INSERT INTO `employee` VALUES ('16', '4', 'Гордеев Борис Борисович', null);
INSERT INTO `employee` VALUES ('17', '4', 'Плаксий Станислав Петрович', null);
INSERT INTO `employee` VALUES ('18', '4', 'Брюханов Олег Артёмович', null);
INSERT INTO `employee` VALUES ('19', '4', 'Фокин Антон Анатолиевич', null);
INSERT INTO `employee` VALUES ('20', '4', 'Блинов Игорь Данилович', null);
INSERT INTO `employee` VALUES ('21', '5', 'Исаев Илья Евгеньевич', null);
INSERT INTO `employee` VALUES ('22', '5', 'Селиверстов Андрей Дмитриевич', null);
INSERT INTO `employee` VALUES ('23', '5', 'Наумов Станислав Борисович', null);
INSERT INTO `employee` VALUES ('24', '5', 'Баранов Станислав Романович', null);
INSERT INTO `employee` VALUES ('25', '5', 'Щукин Владимир Андреевич', null);
INSERT INTO `employee` VALUES ('26', '1', 'Пахомова Маргарита Евгеньевна', null);
INSERT INTO `employee` VALUES ('27', '1', 'Права Лада Петровна', null);
INSERT INTO `employee` VALUES ('28', '1', 'Данилова Светлана Валерьевна', null);
INSERT INTO `employee` VALUES ('29', '1', 'Саксаганска Жанна Богдановна', '2019-12-04');
INSERT INTO `employee` VALUES ('30', '1', 'Степанова Оксана Борисовна', null);
INSERT INTO `employee` VALUES ('31', '2', 'Ерёменко Инга Романовна', null);
INSERT INTO `employee` VALUES ('32', '2', 'Сасько Анна Фёдоровна', null);
INSERT INTO `employee` VALUES ('33', '2', 'Несвитайло Мария Сергеевна', null);
INSERT INTO `employee` VALUES ('34', '2', 'Сидорова Мария Фёдоровна', null);
INSERT INTO `employee` VALUES ('35', '2', 'Колобова Прасковья Станиславовна', null);
INSERT INTO `employee` VALUES ('36', '3', 'Стрелкова Ульяна Алексеевна', null);
INSERT INTO `employee` VALUES ('37', '3', 'Барановска Ирина Богдановна', null);
INSERT INTO `employee` VALUES ('38', '3', 'Гуляева Марина Григорьевна', null);
INSERT INTO `employee` VALUES ('39', '3', 'Воронова Антонина Ярославовна', null);
INSERT INTO `employee` VALUES ('40', '3', 'Бачей Злата Сергеевна', null);
INSERT INTO `employee` VALUES ('41', '4', 'Яковлева Татьяна Львовна', null);
INSERT INTO `employee` VALUES ('42', '4', 'Белякова Олеся Романовна', null);
INSERT INTO `employee` VALUES ('43', '4', 'Рогова Ольга Богдановна', null);
INSERT INTO `employee` VALUES ('44', '4', 'Моисеева Виктория Платоновна', null);
INSERT INTO `employee` VALUES ('45', '4', 'Аксенова Маргарита Артёмовна', null);
INSERT INTO `employee` VALUES ('46', '5', 'Кулибаба Валерия Максимовна', null);
INSERT INTO `employee` VALUES ('47', '5', 'Ефремова Анна Алексеевна', null);
INSERT INTO `employee` VALUES ('48', '5', 'Одинцова Екатерина Михайловна', null);
INSERT INTO `employee` VALUES ('49', '5', 'Федорченко Елизавета Эдуардовна', null);
INSERT INTO `employee` VALUES ('50', '5', 'Меркушева Инна Фёдоровна', '2015-02-15');

CREATE TABLE Vacations(
	id int NOT NULL AUTO_INCREMENT,
	employee_id int NOT NULL,
	d_start date NOT NULL,
	d_end date NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(employee_id) REFERENCES Employee(id)
);

-- ----------------------------
-- Records of vacations
-- ----------------------------
INSERT INTO `vacations` VALUES ('1', '1', '2020-01-16', '2020-01-31');
INSERT INTO `vacations` VALUES ('2', '1', '2020-03-03', '2020-03-17');
INSERT INTO `vacations` VALUES ('3', '2', '2020-03-01', '2020-03-15');
INSERT INTO `vacations` VALUES ('4', '2', '2020-06-15', '2020-06-29');
INSERT INTO `vacations` VALUES ('5', '3', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('6', '3', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('7', '4', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('8', '4', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('9', '5', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('10', '5', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('11', '6', '2020-02-22', '2020-03-07');
INSERT INTO `vacations` VALUES ('12', '6', '2020-11-15', '2020-11-29');
INSERT INTO `vacations` VALUES ('13', '7', '2020-03-15', '2020-03-29');
INSERT INTO `vacations` VALUES ('14', '7', '2020-08-11', '2020-08-25');
INSERT INTO `vacations` VALUES ('15', '8', '2020-01-04', '2020-01-18');
INSERT INTO `vacations` VALUES ('16', '8', '2020-04-04', '2020-04-18');
INSERT INTO `vacations` VALUES ('17', '9', '2020-03-11', '2020-03-25');
INSERT INTO `vacations` VALUES ('18', '9', '2020-07-05', '2020-07-19');
INSERT INTO `vacations` VALUES ('19', '10', '2020-05-05', '2020-05-19');
INSERT INTO `vacations` VALUES ('20', '10', '2020-10-05', '2020-10-10');
INSERT INTO `vacations` VALUES ('21', '11', '2020-04-18', '2020-05-02');
INSERT INTO `vacations` VALUES ('22', '11', '2020-11-22', '2020-12-06');
INSERT INTO `vacations` VALUES ('23', '12', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('24', '12', '2020-12-01', '2020-12-15');
INSERT INTO `vacations` VALUES ('25', '13', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('26', '13', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('27', '14', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('28', '14', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('29', '15', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('30', '15', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('31', '16', '2020-01-15', '2020-01-30');
INSERT INTO `vacations` VALUES ('32', '16', '2020-03-03', '2020-03-17');
INSERT INTO `vacations` VALUES ('33', '17', '2020-03-01', '2020-03-15');
INSERT INTO `vacations` VALUES ('34', '17', '2020-06-15', '2020-06-29');
INSERT INTO `vacations` VALUES ('35', '18', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('36', '18', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('37', '19', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('38', '19', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('39', '20', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('40', '20', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('41', '21', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('42', '21', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('43', '22', '2020-01-15', '2020-01-30');
INSERT INTO `vacations` VALUES ('44', '22', '2020-03-03', '2020-03-17');
INSERT INTO `vacations` VALUES ('45', '23', '2020-03-01', '2020-03-15');
INSERT INTO `vacations` VALUES ('46', '23', '2020-06-15', '2020-06-29');
INSERT INTO `vacations` VALUES ('47', '24', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('48', '24', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('49', '25', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('50', '25', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('51', '26', '2020-02-22', '2020-03-07');
INSERT INTO `vacations` VALUES ('52', '26', '2020-11-15', '2020-11-29');
INSERT INTO `vacations` VALUES ('53', '27', '2020-03-15', '2020-03-29');
INSERT INTO `vacations` VALUES ('54', '27', '2020-08-11', '2020-08-25');
INSERT INTO `vacations` VALUES ('55', '28', '2020-01-04', '2020-01-18');
INSERT INTO `vacations` VALUES ('56', '28', '2020-04-04', '2020-04-18');
INSERT INTO `vacations` VALUES ('57', '29', '2020-03-11', '2020-03-25');
INSERT INTO `vacations` VALUES ('58', '29', '2020-07-05', '2020-07-19');
INSERT INTO `vacations` VALUES ('59', '30', '2020-05-05', '2020-05-19');
INSERT INTO `vacations` VALUES ('60', '30', '2020-10-05', '2020-10-10');
INSERT INTO `vacations` VALUES ('61', '31', '2020-04-18', '2020-05-02');
INSERT INTO `vacations` VALUES ('62', '31', '2020-11-22', '2020-12-06');
INSERT INTO `vacations` VALUES ('63', '32', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('64', '32', '2020-12-01', '2020-12-15');
INSERT INTO `vacations` VALUES ('65', '33', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('66', '33', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('67', '34', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('68', '34', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('69', '35', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('70', '35', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('71', '36', '2020-01-15', '2020-01-30');
INSERT INTO `vacations` VALUES ('72', '36', '2020-03-03', '2020-03-17');
INSERT INTO `vacations` VALUES ('73', '37', '2020-03-01', '2020-03-15');
INSERT INTO `vacations` VALUES ('74', '37', '2020-06-15', '2020-06-29');
INSERT INTO `vacations` VALUES ('75', '38', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('76', '38', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('77', '39', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('78', '39', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('79', '40', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('80', '40', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('81', '41', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('82', '41', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('83', '42', '2020-04-13', '2020-04-27');
INSERT INTO `vacations` VALUES ('84', '42', '2020-08-01', '2020-08-15');
INSERT INTO `vacations` VALUES ('85', '43', '2020-02-03', '2020-02-17');
INSERT INTO `vacations` VALUES ('86', '43', '2020-05-06', '2020-05-20');
INSERT INTO `vacations` VALUES ('87', '44', '2020-01-16', '2020-01-24');
INSERT INTO `vacations` VALUES ('88', '44', '2020-06-11', '2020-06-25');
INSERT INTO `vacations` VALUES ('89', '45', '2020-02-22', '2020-03-07');
INSERT INTO `vacations` VALUES ('90', '45', '2020-11-15', '2020-11-29');
INSERT INTO `vacations` VALUES ('91', '46', '2020-03-15', '2020-03-29');
INSERT INTO `vacations` VALUES ('92', '46', '2020-08-11', '2020-08-25');
INSERT INTO `vacations` VALUES ('93', '47', '2020-01-04', '2020-01-18');
INSERT INTO `vacations` VALUES ('94', '47', '2020-04-04', '2020-04-18');
INSERT INTO `vacations` VALUES ('95', '48', '2020-03-11', '2020-03-25');
INSERT INTO `vacations` VALUES ('96', '48', '2020-07-05', '2020-07-19');
INSERT INTO `vacations` VALUES ('97', '49', '2020-05-05', '2020-05-19');
INSERT INTO `vacations` VALUES ('98', '49', '2020-10-05', '2020-10-10');
INSERT INTO `vacations` VALUES ('99', '50', '2020-04-18', '2020-05-02');
INSERT INTO `vacations` VALUES ('100', '50', '2020-11-22', '2020-12-06');

CREATE TABLE Protocol(
	id int NOT NULL AUTO_INCREMENT,
	d_action date,
	t_action time,
	action enum ('INSERT', 'UPDATE', 'DELETE'),
	table_name varchar(255),
	obj_id int,
	update_comment TEXT
	CHARACTER SET utf8,
	PRIMARY KEY(id)
);


CREATE PROCEDURE SelectNotFiredEmplAndIntersectVac (IN dep_id int)
BEGIN
SELECT d.name as department_name, e1.name as employee1_name, e2.name as employee2_name, 
GREATEST(LEAST(v1.d_end, v2.d_start), v1.d_start) as min_intersect_date
FROM Department d
INNER JOIN employee e1 ON d.id = e1.department_id
INNER JOIN employee e2 ON d.id = e2.department_id
INNER JOIN vacations v1 ON e1.id = v1.employee_id
INNER JOIN vacations v2 ON e2.id = v2.employee_id
WHERE e1.name > e2.name AND e1.department_id=dep_id AND e2.department_id=dep_id AND e1.fired IS NULL
AND e2.fired IS NULL AND (v1.d_end >= v2.d_start AND v1.d_start <= v2.d_end);
END;

CREATE TRIGGER dep_insert AFTER insert
ON Department FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id) VALUE (CURRENT_DATE(), CURRENT_TIME(),'INSERT', 'Department', NEW.id);

CREATE TRIGGER dep_delete AFTER delete
ON Department FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id) VALUE (CURRENT_DATE(), CURRENT_TIME(),'DELETE', 'Department', OLD.id);

CREATE TRIGGER dep_update AFTER update
ON Department FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id, update_comment) VALUE (CURRENT_DATE(), CURRENT_TIME(),'UPDATE', 'Department', OLD.id, CONCAT('old name: ', OLD.name,'  new name: ', NEW.name))

CREATE TRIGGER emp_insert AFTER insert
ON Employee FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id) VALUE (CURRENT_DATE(), CURRENT_TIME(),'INSERT', 'Employee', NEW.id);

CREATE TRIGGER emp_delete AFTER delete
ON Employee FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id) VALUE (CURRENT_DATE(), CURRENT_TIME(),'DELETE', 'Employee', OLD.id);

CREATE TRIGGER emp_update AFTER update
ON Employee FOR EACH ROW
BEGIN
	DECLARE s BLOB DEFAULT '';
	
	IF NEW.department_id != OLD.department_id
	THEN
		SET s = CONCAT(s, 'old department_id: ', OLD.department_id, ', ', 'new department_id: ', NEW.department_id, '; ');
	END IF;
	
	IF NEW.name != OLD.name
	THEN
		SET s = CONCAT(s, 'old name: ', OLD.name, ', ', 'new name: ', NEW.name, '; ');
	END IF;
	
	IF NEW.fired != OLD.fired
	THEN
		SET s = CONCAT(s, 'old fired: ', OLD.fired, ', ', 'new fired: ', NEW.fired, ';');
	END IF;	
	
	IF NEW.fired IS NOT NULL AND OLD.fired IS NULL
	THEN
		SET s = CONCAT(s, 'old fired: null; ', 'new fired: ', NEW.fired, ';');
	END IF;	

	IF OLD.fired IS NOT NULL AND NEW.fired IS NULL
	THEN
		SET s = CONCAT(s, 'old fired: ', OLD.fired, ', ', 'new fired: null', ';');
	END IF;
	
	INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id, update_comment) VALUE (CURRENT_DATE(), CURRENT_TIME(),'UPDATE', 'Employee', OLD.id, s);
END;

CREATE TRIGGER vac_insert AFTER insert
ON Vacations FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id) VALUE (CURRENT_DATE(), CURRENT_TIME(),'INSERT', 'Vacations', NEW.id);

CREATE TRIGGER vac_delete AFTER delete
ON Vacations FOR EACH ROW 
INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id) VALUE (CURRENT_DATE(), CURRENT_TIME(),'DELETE', 'Vacations', OLD.id);

CREATE TRIGGER vac_update AFTER update
ON Vacations FOR EACH ROW
BEGIN
	DECLARE s BLOB DEFAULT '';
	
	IF NEW.employee_id != OLD.employee_id
	THEN
		SET s = CONCAT(s, 'old employee_id: ', OLD.employee_id, ', ', 'new employee_id: ', NEW.employee_id, '; ');
	END IF;
	
	IF NEW.d_start != OLD.d_start
	THEN
		SET s = CONCAT(s, 'old d_start: ', OLD.d_start, ', ', 'new d_start: ', NEW.d_start, '; ');
	END IF;
	
	IF NEW.d_end != OLD.d_end
	THEN
		SET s = CONCAT(s, 'old d_end: ', OLD.d_end, ', ', 'new d_end: ', NEW.d_end, ';');
	END IF;	
	
	INSERT INTO Protocol (d_action, t_action, action, table_name, obj_id, update_comment) VALUE (CURRENT_DATE(), CURRENT_TIME(),'UPDATE', 'Vacations', OLD.id, s);
END;