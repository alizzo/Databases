SELECT Patient.Financial_Identification_Number, Department.Financial_Identification_Number, Patient_First_Name, Nursing_Unit
FROM Patient
 LEFT OUTER JOIN Department
      ON Patient.Financial_Identification_Number =  Department.Financial_Identification_Number