DROP TABLE Account;
COMMIT;
DROP TABLE Customer;
COMMIT;

CREATE TABLE Customer
(	Customer_ID INT GENERATED ALWAYS AS IDENTITY,
	Last_Name	VARCHAR2(50) NOT NULL,
	First_Name	VARCHAR2(50) NOT NULL,
	Gender	CHAR(1),
	Email	VARCHAR2(40),
	Credit_Rating INT  DEFAULT 0,
	CONSTRAINT Customer_PK1 PRIMARY KEY (Customer_ID),
	CONSTRAINT Customer_Gender CHECK (Gender IN ('M', 'F')),
	CONSTRAINT Customer_Credit_Rating 
          CHECK (Credit_Rating BETWEEN 0 AND 10)
);

COMMIT;

CREATE TABLE ACCOUNT
(	Account_ID INT GENERATED ALWAYS AS IDENTITY,
	Account_TYPE CHAR(1),
	Balance NUMBER(9,2),
   Customer_ID INT NOT NULL,
	CONSTRAINT ACCOUNT_PK PRIMARY KEY (Account_ID),
	CONSTRAINT Account_Type CHECK (Account_Type IN ('S', 'C')),
	CONSTRAINT ACCOUNT_CUSTOMER_FK FOREIGN KEY (Customer_ID)
		REFERENCES Customer(Customer_ID)
 );

COMMIT;

INSERT INTO CUSTOMER (Last_Name, First_Name, Gender, Email)
VALUES ('Hyslop', 'Will', 'M', 'hyslop@unb.ca');

INSERT INTO ACCOUNT (Account_Type, Balance, Customer_ID)
VALUES ('S', 1234.56, 1);