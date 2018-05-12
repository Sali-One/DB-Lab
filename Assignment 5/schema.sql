﻿CREATE TABLE Department1 (
	DEP_ID SERIAL PRIMARY KEY,
	DEP_Name VARCHAR(30),
	DEP_Date INTEGER DEFAULT 2000
);

CREATE TABLE Course (
	C_ID SERIAL PRIMARY KEY ,
	C_NAME VARCHAR(30),
	C_DEP SERIAL NOT NULL REFERENCES Department1(DEP_ID) ON DELETE CASCADE ON UPDATE CASCADE 
);

CREATE TABLE Student1 (
	S_ID SERIAL PRIMARY KEY,
	S_Name VARCHAR (30),
	S_FName VARCHAR (50),
	S_Tele VARCHAR (12),
	S_Addr VARCHAR (200),
	S_DEP SERIAL NOT NULL REFERENCES Department1(DEP_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Register (
	Grade FLOAT DEFAULT 9.9,
	S_ID SERIAL NOT NULL REFERENCES Student1(S_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	C_ID SERIAL NOT NULL REFERENCES Course(C_ID) ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Project (
	C_ID SERIAL NOT NULL REFERENCES Course(C_ID) ON UPDATE CASCADE ON DELETE RESTRICT ,
	PROJ_ID SERIAL NOT NULL,
	PROJ_DEF VARCHAR (200) ,
	PROJ_MaxMem INTEGER DEFAULT 2 ,
	PROJ_DEADLINE TIMESTAMP,
	PRIMARY KEY (C_ID ,PROJ_ID)
);

CREATE TABLE Project_Reg (
	S_ID SERIAL NOT NULL REFERENCES Student1(S_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	C_ID SERIAL NOT NULL REFERENCES Course(C_ID) ON UPDATE CASCADE ON DELETE RESTRICT ,
	PROJ_ID SERIAL NOT NULL ,
	FOREIGN KEY (C_ID ,PROJ_ID) REFERENCES Project(C_ID ,Proj_ID)
);

CREATE TABLE Teacher (
	T_ID SERIAL PRIMARY KEY,
	T_Name VARCHAR (30),
	T_FName VARCHAR (50),
	T_Tele VARCHAR (12),
	T_Addr VARCHAR(200)
);

CREATE TABLE Present (
	T_ID SERIAL NOT NULL REFERENCES Teacher(T_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	C_ID SERIAL NOT NULL REFERENCES Course(C_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	ClassGroup INTEGER NOT NULL,
	ClassTime TIMESTAMP,
	PRIMARY KEY(T_ID ,C_ID ,ClassGroup)
);

CREATE TABLE Member (
	DEP_ID SERIAL NOT NULL REFERENCES Department1(DEP_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	T_ID SERIAL NOT NULL REFERENCES Teacher(T_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	Salary FLOAT DEFAULT 1000 ,
	Password VARCHAR(20) NOT NULL
);

CREATE TABLE Publication (
	T_ID SERIAL NOT NULL REFERENCES Teacher(T_ID) ON DELETE CASCADE ON UPDATE CASCADE ,
	BookName VARCHAR(50) NOT NULL PRIMARY KEY ,
	Publish_date DATE
);