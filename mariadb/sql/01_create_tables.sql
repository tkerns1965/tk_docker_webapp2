DROP DATABASE IF EXISTS timesheets;
CREATE DATABASE IF NOT EXISTS timesheets;
USE timesheets;

SELECT 'CREATING DATABASE STRUCTURE' as 'INFO';

DROP TABLE IF EXISTS company,
                     job,
                     timesheet,
                     phase, 
                     employee, 
                     class, 
                     hours;

CREATE TABLE company (
    company_no  TINYINT  NOT NULL,
    PRIMARY KEY (company_no)
);

CREATE TABLE job (
    company_no  TINYINT       NOT NULL,
    job_id      INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
    job_code    VARCHAR(10)   NOT NULL,
    PRIMARY KEY (job_id),
    UNIQUE KEY (company_no,job_code)
);

CREATE TABLE timesheet (
    job_id          INT           NOT NULL,
    timesheet_id    INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
    timesheet_date  DATE          NOT NULL,
    craft_code      VARCHAR(10)   NOT NULL,
    weather         VARCHAR(50),
    temperature     VARCHAR(20),
    PRIMARY KEY (timesheet_id),
    UNIQUE KEY (job_id,timesheet_date,craft_code)
);

CREATE TABLE phase (
    timesheet_id  INT           NOT NULL,
    phase_id      INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
    phase_code    VARCHAR(20)   NOT NULL,
    phase_note    VARCHAR(100),
    PRIMARY KEY (phase_id),
    UNIQUE KEY (timesheet_id,phase_code,phase_note)
);

CREATE TABLE employee (
    timesheet_id   INT           NOT NULL,
    employee_id    INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
    employee_code  VARCHAR(11)   NOT NULL,
    employee_note  VARCHAR(100),
    PRIMARY KEY (employee_id),
    UNIQUE KEY (timesheet_id,employee_code,employee_note)
);

CREATE TABLE class (
    employee_id     INT           NOT NULL,
    class_id        INT UNSIGNED  NOT NULL  AUTO_INCREMENT,
    class_code      VARCHAR(10)   NOT NULL,
    class_note      VARCHAR(100),
    equipment_code  VARCHAR(10),
    equipment_note  VARCHAR(100),
    PRIMARY KEY (class_id),
    UNIQUE KEY (employee_id,class_code,class_note,equipment_code,equipment_note)
);

CREATE TABLE hours (
    phase_id         INT           NOT NULL,
    class_id         INT           NOT NULL,
    labor_hours      DECIMAL(4,2)  NOT NULL,
    equipment_hours  DECIMAL(4,2),
    PRIMARY KEY (phase_id,class_id)
);
