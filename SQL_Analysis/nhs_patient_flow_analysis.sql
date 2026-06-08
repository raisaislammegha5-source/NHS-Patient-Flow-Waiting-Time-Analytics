-- NHS Patient Flow & Waiting Time Analytics
-- Author: Raisa Islam Megha
-- Database: PostgreSQL

--------------------------------------------------
-- 1. Total Patients
--------------------------------------------------

SELECT COUNT(patient_id) AS total_patients
FROM patient_flow;

--------------------------------------------------
-- 2. Admissions vs Non-Admissions
--------------------------------------------------

SELECT admission_flag,
       COUNT(patient_id) AS patient_count
FROM patient_flow
GROUP BY admission_flag
ORDER BY patient_count DESC;

--------------------------------------------------
-- 3. Average Waiting Time
--------------------------------------------------

SELECT ROUND(AVG(wait_time),2) AS avg_waiting_time
FROM patient_flow;

--------------------------------------------------
-- 4. Average Satisfaction Score
--------------------------------------------------

SELECT ROUND(AVG(satisfaction_score),2) AS avg_satisfaction_score
FROM patient_flow;

--------------------------------------------------
-- 5. Patient Volume by Department
--------------------------------------------------

SELECT department_referral,
       COUNT(patient_id) AS patient_count
FROM patient_flow
GROUP BY department_referral
ORDER BY patient_count DESC;

--------------------------------------------------
-- 6. Average Waiting Time by Department
--------------------------------------------------

SELECT department_referral,
       ROUND(AVG(wait_time),2) AS avg_waiting_time
FROM patient_flow
GROUP BY department_referral
ORDER BY avg_waiting_time DESC;

--------------------------------------------------
-- 7. Satisfaction Score by Department
--------------------------------------------------

SELECT department_referral,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction_score
FROM patient_flow
GROUP BY department_referral
ORDER BY avg_satisfaction_score DESC;

--------------------------------------------------
-- 8. Waiting Time by Gender
--------------------------------------------------

SELECT patient_gender,
       ROUND(AVG(wait_time),2) AS avg_waiting_time
FROM patient_flow
GROUP BY patient_gender;

--------------------------------------------------
-- 9. Satisfaction Score by Gender
--------------------------------------------------

SELECT patient_gender,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction_score
FROM patient_flow
GROUP BY patient_gender;

--------------------------------------------------
-- 10. Patient Count by Gender
--------------------------------------------------

SELECT patient_gender,
       COUNT(patient_id) AS patient_count
FROM patient_flow
GROUP BY patient_gender;

--------------------------------------------------
-- 11. Waiting Time by Ethnicity
--------------------------------------------------

SELECT patient_race,
       ROUND(AVG(wait_time),2) AS avg_waiting_time
FROM patient_flow
GROUP BY patient_race
ORDER BY avg_waiting_time DESC;

--------------------------------------------------
-- 12. Satisfaction Score by Ethnicity
--------------------------------------------------

SELECT patient_race,
       ROUND(AVG(satisfaction_score),2) AS avg_satisfaction_score
FROM patient_flow
GROUP BY patient_race
ORDER BY avg_satisfaction_score DESC;

--------------------------------------------------
-- 13. Admission Outcomes by Gender
--------------------------------------------------

SELECT patient_gender,
       admission_flag,
       COUNT(*) AS patient_count
FROM patient_flow
GROUP BY patient_gender, admission_flag
ORDER BY patient_gender;

--------------------------------------------------
-- 14. Admission Outcomes by Ethnicity
--------------------------------------------------

SELECT patient_race,
       admission_flag,
       COUNT(*) AS patient_count
FROM patient_flow
GROUP BY patient_race, admission_flag
ORDER BY patient_race;

--------------------------------------------------
-- 15. Age Distribution
--------------------------------------------------

SELECT patient_age,
       COUNT(*) AS patient_count
FROM patient_flow
GROUP BY patient_age
ORDER BY patient_age;

--------------------------------------------------
-- 16. Average Waiting Time by Age
--------------------------------------------------

SELECT patient_age,
       ROUND(AVG(wait_time),2) AS avg_waiting_time
FROM patient_flow
GROUP BY patient_age
ORDER BY patient_age;
