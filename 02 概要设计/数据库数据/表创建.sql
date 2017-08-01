--创建部门表
CREATE TABLE dept
(
   dept_id       NUMBER(6) PRIMARY KEY,
   dept_name     VARCHAR2(50),
   dept_loc      VARCHAR2(100)
);

--部门编号序列
CREATE SEQUENCE dept_seq START WITH 10 INCREMENT BY 10;

--创建职务表
CREATE TABLE job
(
   job_id    NUMBER(6) PRIMARY KEY,
   job_name  VARCHAR2(50),
   job_min_sal NUMBER(6),
   job_max_sal NUMBER(6)
);

--职务编号序列
CREATE SEQUENCE job_seq;

--创建员工表
CREATE TABLE emp
(
   emp_id    NUMBER(6) PRIMARY KEY,
   emp_name  VARCHAR2(50),
   emp_login_name VARCHAR2(50),
   emp_pwd   VARCHAR2(50),
   emp_email VARCHAR2(100),
   emp_phone VARCHAR2(50),
   emp_salary     NUMBER(8,2),
   emp_dept_id    NUMBER(6) REFERENCES dept (dept_id) ON DELETE SET NULL,
   emp_job_id     NUMBER(6) REFERENCES job (job_id) ON DELETE SET NULL,
   emp_pic        CLOB,
   emp_info       VARCHAR2(2000)
);

--员工编号序列
CREATE SEQUENCE emp_seq;

--创建公司图片库表
CREATE TABLE pic
(
   pic_id    NUMBER(6) PRIMARY KEY,
   pic_name  VARCHAR2(100),
   pic_info  VARCHAR2(500),
   pic_size  NUMBER(10),
   pic_author VARCHAR(100),
   pic_data   BLOB,
   pic_datetime DATE   
);

--图片序列
CREATE SEQUENCE pic_seq;