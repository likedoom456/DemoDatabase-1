SHOW DATABASES;
DROP DATABASE IF EXISTS db_test;
CREATE DATABASE db_test;
USE db_test;
SHOW TABLES;

-- table employee
DROP TABLE IF EXISTS db_test.employee;
CREATE TABLE db_test.employee (
  id           INT UNSIGNED
  COMMENT 'PK',
  ename        VARCHAR(255) COMMENT '姓名',
  gender       CHAR(1)      DEFAULT 'M'
  COMMENT '性别',
  age          INT,
  departmentId INT UNSIGNED COMMENT '部门编号 FK' -- ,
  #   FOREIGN KEY (departmentId) REFERENCES db_test.department (id)
)
  COMMENT '员工表';

INSERT INTO db_test.employee VALUES (NULL, 'e1', 'M', 18, 1);
INSERT INTO db_test.employee VALUES (NULL, 'e2', 'F', 17, 2);
INSERT INTO db_test.employee VALUES (NULL, 'e3', 'M', 61, NULL);

INSERT INTO db_test.employee (id, ename, departmentId) VALUES (NULL, 'e4', 1);
INSERT INTO db_test.employee (ename, departmentId) VALUES ('e5', 1);

ALTER TABLE db_test.employee
  AUTO_INCREMENT = 10000000;

DELETE FROM db_test.employee
WHERE id = 12;

SELECT *
FROM db_test.employee;

-- table department
DROP TABLE IF EXISTS db_test.department;
CREATE TABLE db_test.department (
  id    INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  dname VARCHAR(255) COMMENT '部门名'
)
  COMMENT '部门表';

INSERT IGNORE db_test.department VALUES (NULL, 'd1');
INSERT IGNORE db_test.department VALUES (NULL, 'd2');

SELECT *
FROM db_test.department;

DELETE FROM db_test.department
WHERE id = 1;

-- FK
ALTER TABLE db_test.employee
  ADD CONSTRAINT
/*  fk_employee_departmentId*/
FOREIGN KEY (departmentId)
REFERENCES db_test.department (id)
  ON DELETE CASCADE; -- cascading style sheet CSS

SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE db_test.new_employee RENAME db_test.employee;

SHOW TABLES ;

ALTER TABLE db_test.department
    ADD tel VARCHAR(20);

ALTER TABLE db_test.department
    DROP COLUMN tel;

ALTER TABLE db_test.department
  MODIFY COLUMN dname VARCHAR(20);

ALTER TABLE db_test.employee
  ADD CONSTRAINT
  pk_employee_id
PRIMARY KEY (id);

ALTER TABLE db_test.employee
  MODIFY COLUMN id INT UNSIGNED AUTO_INCREMENT;

ALTER TABLE db_test.employee
  CHANGE gender sex CHAR(1);

DESC db_test.employee;
DESC db_test.department; -- DESCribe




