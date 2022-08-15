SELECT Patient.Financial_Identification_Number, Department.Financial_Identification_Number, Hospital_ID, Patient_First_Name, Patient_Last_Name
FROM Patient 
NATURAL JOIN  Department
ORDER BY Patient_Last_Name