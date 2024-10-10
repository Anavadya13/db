Write a PL/SQL program to display Employee name, Salary, and department number using a cursor.
In this case, we'll write a simple PL/SQL procedure that uses a cursor to retrieve and display the employee's name, salary, and department number.

PL/SQL Program:
sql
Copy code
DECLARE
    -- Cursor to fetch employee details
    CURSOR emp_cursor IS
        SELECT Name, Salary, DNo
        FROM EMPLOYEE;

    -- Variables to hold fetched data
    v_Name EMPLOYEE.Name%TYPE;
    v_Salary EMPLOYEE.Salary%TYPE;
    v_DNo EMPLOYEE.DNo%TYPE;

BEGIN
    -- Open the cursor
    OPEN emp_cursor;

    -- Fetch each row and display the details
    LOOP
        FETCH emp_cursor INTO v_Name, v_Salary, v_DNo;
        EXIT WHEN emp_cursor%NOTFOUND;

        -- Display the employee details
        DBMS_OUTPUT.PUT_LINE('Name: ' || v_Name || ', Salary: ' || v_Salary || ', Dept No: ' || v_DNo);
    END LOOP;

    -- Close the cursor
    CLOSE emp_cursor;
END;
/


Write a procedure to store Customer name , City and Grade. In plsql
ChatGPT said:
ChatGPT
To create a procedure in PL/SQL that stores a customer's name, city, and grade into a CUSTOMER table, we will follow the steps below. I'll assume the CUSTOMER table has the following structure:

sql
Copy code
CUSTOMER (Customer_id, Cust_Name, City, Grade, Salesman_id)
Here, we will insert values for the columns Cust_Name, City, and Grade. We will also assume Customer_id is auto-generated and Salesman_id is either provided or set to NULL.

PL/SQL Procedure to Store Customer Name, City, and Grade:
sql
Copy code
CREATE OR REPLACE PROCEDURE Add_Customer(
    p_Cust_Name IN CUSTOMER.Cust_Name%TYPE,
    p_City IN CUSTOMER.City%TYPE,
    p_Grade IN CUSTOMER.Grade%TYPE
)
IS
BEGIN
    -- Insert the customer details into the CUSTOMER table
    INSERT INTO CUSTOMER (Cust_Name, City, Grade)
    VALUES (p_Cust_Name, p_City, p_Grade);

    -- Optional: A confirmation message
    DBMS_OUTPUT.PUT_LINE('Customer ' || p_Cust_Name || ' from ' || p_City || ' with Grade ' || p_Grade || ' has been added.');
EXCEPTION
    -- Handle any exceptions (errors) during the insertion
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/


.....
CREATE OR REPLACE PROCEDURE Add_Customer(
    p_Cust_Name IN CUSTOMER.Cust_Name%TYPE,
    p_City IN CUSTOMER.City%TYPE,
    p_Grade IN CUSTOMER.Grade%TYPE
)
IS
BEGIN
    -- Insert the customer details into the CUSTOMER table
    INSERT INTO CUSTOMER (Cust_Name, City, Grade)
    VALUES (p_Cust_Name, p_City, p_Grade);

    -- Confirmation message
    DBMS_OUTPUT.PUT_LINE('Customer ' || p_Cust_Name || ' from ' || p_City || ' with Grade ' || p_Grade || ' has been added.');
END;
/
....
BEGIN
    Add_Customer('John Doe', 'New York', 3);
END;
/
.....



CREATE TABLE CUSTOMER (
    Customer_id INT PRIMARY KEY,
    Cust_Name VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Grade INT,
    Salesman_id INT,
    FOREIGN KEY (Salesman_id) REFERENCES SALESMAN(Salesman_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);


....

