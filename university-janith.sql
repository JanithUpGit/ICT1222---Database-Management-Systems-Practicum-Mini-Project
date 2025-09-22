mysql> CREATE DATABASE university;

 CREATE TABLE Student (  
    RegNo VARCHAR(15) 
    PRIMARY KEY,   
    Name VARCHAR(100),   
    Gender CHAR(1),  
    Batch VARCHAR(10),   
    Status ENUM('Proper','Repeat','Suspended'),  
    Contact VARCHAR(15),   
    Email VARCHAR(100) 
);