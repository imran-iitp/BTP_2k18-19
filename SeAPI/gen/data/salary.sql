CREATE OR REPLACE PROCEDURE emp_salary_increase (emp_id IN emptbl.empID%type, salary_inc IN OUT emptbl.salary%type) 

 IS 
 
 declare
   tmp_sal number;
   salary_inout number; 

 BEGIN 

   SELECT salary INTO tmp_sal 
    FROM emp_tbl
    WHERE empID = emp_id; 

   IF tmp_sal between 10000 and 20000 THEN 

      salary_inout := tmp_sal * 1.2; 

   ELSIF tmp_sal between 20000 and 30000 THEN 

      salary_inout := tmp_sal * 1.3; 

   ELSIF tmp_sal > 30000 THEN 
        salary_inout := tmp_sal * 1.4; 
   

   END IF; 

 END;
