-- Dataset summary
ALTER TABLE healthcare_dataset RENAME TO healthcare;

SELECT COUNT(*) AS total_rows
FROM healthcare;

SELECT
  COUNT(DISTINCT Hospital) AS hospitals,
  COUNT(DISTINCT "Insurance Provider") AS insurance_providers,
  COUNT(DISTINCT "Medical Condition") AS medical_conditions
FROM healthcare;

-- Overall billing summary
SELECT
  "Medical Condition" AS medical_condition,
  COUNT(*) AS patients,
  ROUND(SUM("Billing Amount"), 2) AS total_billing,
  ROUND(AVG("Billing Amount"), 2) AS avg_billing
FROM healthcare
GROUP BY "Medical Condition"
ORDER BY total_billing DESC;

-- Cost drivers by medical condition
SELECT
  "Medical Condition" AS medical_condition,
  COUNT(*) AS patients,
  ROUND(SUM("Billing Amount"), 2) AS total_billing,
  ROUND(AVG("Billing Amount"), 2) AS avg_billing
FROM healthcare
GROUP BY "Medical Condition"
ORDER BY total_billing DESC;

-- Admission type analysis
SELECT
  "Admission Type" AS admission_type,
  COUNT(*) AS patients,
  ROUND(SUM("Billing Amount"), 2) AS total_billing,
  ROUND(AVG("Billing Amount"), 2) AS avg_billing
FROM healthcare
GROUP BY "Admission Type"
ORDER BY total_billing DESC;

-- Length of stay
SELECT
  "Admission Type" AS admission_type,
  ROUND(
    AVG(
      julianday("Discharge Date") - julianday("Date of Admission")
    ), 2
  ) AS avg_length_of_stay_days
FROM healthcare
GROUP BY "Admission Type";

-- Length of stay by medical condition (min 1000 patients)
SELECT
  "Medical Condition" AS medical_condition,
  COUNT(*) AS patients,
  ROUND(
    AVG(julianday("Discharge Date") - julianday("Date of Admission")),
    2
  ) AS avg_length_of_stay_days
FROM healthcare
GROUP BY "Medical Condition"
HAVING COUNT(*) >= 1000
ORDER BY avg_length_of_stay_days DESC;

-- Insurance provider distribution
SELECT
  "Insurance Provider" AS insurance_provider,
  COUNT(*) AS patients,
  ROUND(SUM("Billing Amount"), 2) AS total_billing,
  ROUND(AVG("Billing Amount"), 2) AS avg_billing
FROM healthcare
GROUP BY "Insurance Provider"
ORDER BY patients DESC;
