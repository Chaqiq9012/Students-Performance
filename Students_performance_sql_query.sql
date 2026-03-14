 SELECT * FROM student_performance;
 RENAME TABLE student_performance TO students_performance;
 TRUNCATE TABLE students_performance;
 LOAD DATA LOCAL INFILE "C:\\Users\\Karma\\Downloads\\Students performance\\student_academic_performance.csv"
 INTO TABLE students_performance
 FIELDS TERMINATED BY ","
 IGNORE 1 ROWS;
 
 # ================================================================================================================
 
 SELECT COUNT(*)     # Dataset Contains 3M Student Records.
 FROM students_performance;

SELECT *
FROM students_performance;

SELECT 
AVG(final_gpa) Avg_Gpa,                 # 2.5
AVG(study_hours_daily) Avg_Study_Hours, # 2.51
AVG(sleep_hours) Avg_Sleep_Hours        # 6.5
FROM students_performance;

SELECT                           # Students Perform Best in Computer 
AVG(math_score) Math_Avg,        # 65
AVG(science_score) Science_Avg,  # 68
AVG(english_score) English_Avg,  # 70
AVG(history_score) History_Avg,  # 66
AVG(computer_score) Computer_Avg # 72
FROM students_performance;

SELECT                                 # Students Perform Better When They Study More Hourse
ROUND(study_hours_daily,1) Study_Hours,  
AVG(final_gpa)                         # 0h =>  1.9 AVG GPA
                                       # 2h =>  2.4 AVG GPA
                                       # 4h =>  2.7 AVG GPA
                                       # 6h =>  3.1 ACG GPA
                                       # 8h =>  3.7 AVG GPA
FROM students_performance
GROUP BY study_hours
ORDER BY study_hours;

SELECT                                 # Sleep Hourse Didn't Effect on The Avg GPA
ROUND(sleep_hours,1) Sleep,
AVG(final_gpa)                         # 3h =>  2.50 AVG GPA
                                       # 6h =>  2.49 AVG GPA
                                       # 9h =>  2.49 AVG GPA
                                       # 10h => 2.50 ACG GPA
FROM students_performance
GROUP BY Sleep
Order BY Sleep;

SELECT                                 # Students Who Has Less Stress Perform Best
ROUND(stress_index,1) Stress,
AVG(final_gpa)                         # 0  =>  2.8 AVG GPA
                                       # 4  =>  2.5 AVG GPA
                                       # 8  =>  2.3 AVG GPA
                                       # 10 =>  2.12 ACG GPA
FROM students_performance
GROUP BY Stress
Order BY Stress;

SELECT
pass_fail,
COUNT(*) Students                     # 2.4M Student Have Passed
									  # 577k Student Have Failed
FROM students_performance
GROUP BY pass_fail;

SELECT
COUNT(*)                             # 146k Student At Risk
FROM students_performance
WHERE at_risk_flag = 1;

SELECT 
CASE 
	WHEN study_hours_daily < 2 THEN "Low Study"                 # 2.2 Avg GPA
    WHEN study_hours_daily BETWEEN 2 AND 4 THEN "Medium Study"  # 2.5 Avg GPA
    ELSE "High Study"                                           # 2.9 Avg GPA
END AS study_category, 
AVG (final_gpa) AS Avg_GPA
FROM students_performance
GROUP BY study_category;