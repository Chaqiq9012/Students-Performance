# 🎓 Student Academic Performance Analysis

An end-to-end Data Analytics Portfolio Project analyzing 3,000,000 student records to uncover the hidden drivers of academic success, dropout risk, and lifestyle impact.

⸻

# 📌 Project Overview

This project analyzes a large dataset of 3 million student records to identify the key factors influencing academic performance.

The analysis focuses on exploring relationships between:
	•	Study habits
	•	Stress levels
	•	Sleep patterns
	•	Physical activity
	•	Academic results

The goal of this project is to uncover data-driven insights that can improve student success rates and help identify at-risk students early.

⸻

# 🎯 Project Objective

The objective of this project was to simulate a real-world data analytics workflow, demonstrating the ability to:
	•	Handle large-scale datasets
	•	Perform SQL data exploration
	•	Apply feature engineering
	•	Build interactive dashboards
	•	Extract actionable insights

⸻

# 🧭 Project Workflow & Tech Stack

Phase	Tools	Purpose
Phase 1	MySQL	Data loading and exploration
Phase 2	Excel / Power Query	Data transformation & feature engineering
Phase 3	Power BI / DAX	Data modeling & interactive dashboards


⸻

** 1️⃣ Phase 1 — Database Management & SQL Exploration **
Objective

Load the 3-million-row dataset into a relational database and perform initial exploration to validate the dataset and establish baseline metrics.

⸻

Key Operations Performed

Data Ingestion

Large CSV files were imported into MySQL using:

LOAD DATA LOCAL INFILE

This approach allows efficient loading of large datasets.

⸻

Data Validation

Initial checks included:
	•	Row count verification
	•	Dataset integrity validation
	•	Exploratory aggregations

Example:

SELECT COUNT(*)
FROM students_performance;


⸻

Dynamic Data Binning

Continuous variables were transformed into analytical categories using SQL CASE statements.

Example:

SELECT 
    CASE
        WHEN sleep_hours >= 9.1 THEN 'Surplus Recovery (9-10)'
        WHEN sleep_hours >= 7.1 THEN 'Optimal Range (7-9)'
        WHEN sleep_hours >= 5.1 THEN 'Sub-optimal (5-7)'
        ELSE 'Critical Deficit (3-5)'
    END AS sleep_hours_category,
    COUNT(*) AS num_students,
    AVG(final_gpa) AS avg_gpa,
    AVG(stress_index) AS avg_stress
FROM students_performance
GROUP BY sleep_hours_category
ORDER BY sleep_hours_category DESC;


⸻

2️⃣ Phase 2 — Data Transformation & Feature Engineering

Objective

Transform raw dataset variables into analytical features that simplify analysis and improve dashboard usability.

⸻

Engineered Features

Several analytical columns were created using Power Query and Excel logic.

⸻

Physical Activity Categories

Physical activity scores were segmented into meaningful groups:
	•	Endurance
	•	High Volume
	•	Hypertrophy Zone
	•	Active Maintenance
	•	Rest

⸻

Study Hour Brackets

Daily study hours were grouped into tiers to make filtering and analysis easier.

⸻

Sleep Categories

Sleep hours were categorized as follows:

Category	Range
Critical Deficit	3 – 5 hours
Sub-optimal	5 – 7 hours
Optimal Range	7 – 9 hours
Surplus Recovery	9 – 10 hours


⸻

3️⃣ Phase 3 — Advanced Analytics & Power BI Modeling

Objective

Create an interactive Power BI dashboard to explore academic performance patterns and identify success drivers.

⸻

Key Metrics Created

Several DAX measures were created to track important performance indicators.

Examples include:
	•	Top Performers
	•	At-Risk Students
	•	Average GPA
	•	Pass Rate
	•	Academic Success Indicators

Example DAX Measure:

Top Performers =
CALCULATE(
COUNTROWS('student_academic_performance'),
'student_academic_performance'[top_performer_flag] = TRUE()
)


⸻

📊 Interactive Dashboard

The final Power BI dashboard enables users to explore relationships between lifestyle factors and academic performance.

Dashboard pages include:
	•	Overview KPIs
	•	Academic Performance Analysis
	•	Lifestyle & Behavior Analysis
	•	Advanced Student Risk Insights

⸻

💡 Key Insights

The analysis of 3 million student records revealed several important patterns.

⸻

📈 Study Hours Strongly Influence GPA

Students studying 0 hours per day averaged a GPA of 1.9, while students studying 8 hours per day achieved an average GPA of 3.7.

This demonstrates a strong relationship between study time and academic success.

⸻

⚠️ Stress Significantly Reduces Academic Performance

Students with the highest stress index (10) had an average GPA of 2.12, compared to 2.8 GPA among low-stress students.

⸻

🎯 Student Success & Risk Distribution

Out of the 3 million students analyzed:
	•	2.4 million students passed
	•	577,000 students failed
	•	146,000 students were identified as at-risk

These students represent a key target group for academic intervention.

⸻

💤 Sleep Deficits Increase Stress Levels

Students sleeping 3–5 hours per night reported significantly higher stress levels (6.07 average stress) compared to students sleeping 9–10 hours (3.44 stress average).

⸻

🚀 Project Conclusion

This project demonstrates a complete Data Analytics lifecycle, including:
	•	Large-scale SQL data exploration
	•	Feature engineering
	•	Power BI dashboard development
	•	Insight generation from complex datasets

The final dashboard transforms raw student records into clear, actionable insights that can support better educational decision-making.

⸻

📂 Repository Structure

/SQL
   exploration_queries.sql

/PowerBI
   student_dashboard.pbix

/Data
   cleaned_dataset.csv

README.md


⸻