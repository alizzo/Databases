
SELECT Patient.Medical_Record_Number, Department.Medical_Record_Number, Patient_First_Name, Patient_Last_Name
FROM Patient INNER JOIN Department ON Patient.Medical_Record_Number = Department.Medical_Record_Number
ORDER BY Patient_Last_Name