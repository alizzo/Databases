
SELECT Employee_ID, Employee_First_Name, Employee_Last_Name, Clinical_Hours
FROM Physician p
WHERE  Employee_ID = (SELECT Employee_ID
        FROM GME_Physician
        WHERE Employee_ID = p. Employee_ID AND p.Clinical_Hours > 2040  ) 
ORDER BY 
    Employee_First_Name