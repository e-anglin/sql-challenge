-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "EMPLOYEES" (
    "Emp_no" int   NOT NULL,
    "Emp_title_id" VARCHAR(6)   NOT NULL,
    "First_name" VARCHAR(20)   NOT NULL,
    "Last_name" VARCHAR(30)   NOT NULL,
    "Sex" VARCHAR(1)   NOT NULL,
    "Birth_date" Date   NOT NULL,
    "Hire_date" Date   NOT NULL,
    CONSTRAINT "pk_EMPLOYEES" PRIMARY KEY (
        "Emp_no"
     )
);

CREATE TABLE "DEPARTMENT_EMPLOYED" (
    "Dept_no" VARCHAR(4)   NOT NULL,
    "Emp_no" int   NOT NULL,
    CONSTRAINT "pk_DEPARTMENT_EMPLOYED" PRIMARY KEY (
        "Dept_no","Emp_no"
     )
);

CREATE TABLE "DEPARTMENT_MANAGERS" (
    "Emp_no" int   NOT NULL,
    "Dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_DEPARTMENT_MANAGERS" PRIMARY KEY (
        "Emp_no","Dept_no"
     )
);

CREATE TABLE "DEPARTMENTS" (
    "Dept_name" VARCHAR(20)   NOT NULL,
    "Dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_DEPARTMENTS" PRIMARY KEY (
        "Dept_no"
     )
);

CREATE TABLE "TITLES" (
    "Title_id" VARCHAR(6)   NOT NULL,
    "Title" VARCHAR(20)   NOT NULL
);

CREATE TABLE "SALARIES" (
    "Salary" DECIMAL(8,2)   NOT NULL,
    "Emp_no" int   NOT NULL,
    CONSTRAINT "pk_SALARIES" PRIMARY KEY (
        "Emp_no"
     )
);

ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "fk_EMPLOYEES_Emp_title_id" FOREIGN KEY("Emp_title_id")
REFERENCES "TITLES" ("Title_id");

ALTER TABLE "DEPARTMENT_EMPLOYED" ADD CONSTRAINT "fk_DEPARTMENT_EMPLOYED_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "DEPARTMENTS" ("Dept_no");

ALTER TABLE "DEPARTMENT_EMPLOYED" ADD CONSTRAINT "fk_DEPARTMENT_EMPLOYED_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "EMPLOYEES" ("Emp_no");

ALTER TABLE "DEPARTMENT_MANAGERS" ADD CONSTRAINT "fk_DEPARTMENT_MANAGERS_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "EMPLOYEES" ("Emp_no");

ALTER TABLE "Department_Managers" ADD CONSTRAINT "fk_Department_Managers_Dept_no" FOREIGN KEY("Dept_no")
REFERENCES "Departments" ("Dept_no");

ALTER TABLE "SALARIES" ADD CONSTRAINT "fk_SALARIES_Emp_no" FOREIGN KEY("Emp_no")
REFERENCES "EMPLOYEES" ("Emp_no");

CREATE INDEX "idx_EMPLOYEES_Last_name"
ON "EMPLOYEES" ("Last_name");

CREATE INDEX "idx_EMPLOYEES_Hire_date"
ON "EMPLOYEES" ("Hire_date");

