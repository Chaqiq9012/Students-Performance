# 🎓 Student Academic Performance Analysis
An end-to-end data analytics portfolio project analyzing 3,000,000 student records to uncover the hidden drivers of academic success, drop-out risks, and lifestyle impacts.

# 📌 Project Overview
This project analyzes a massive dataset of 3 million student records to uncover the primary factors influencing academic performance. By examining study habits, stress levels, sleep patterns, and physical activity, this analysis identifies actionable insights to improve student success rates.

Objective: To execute a complete, industry-standard data analytics workflow—from raw data ingestion to interactive executive dashboarding—demonstrating proficiency in large-scale data handling.

🧭 Project Workflow & Tech Stack
[x] Phase 1: Database Management & Exploration (MySQL)

[x] Phase 2: Data Transformation & Feature Engineering (Power Query / Excel)

[x] Phase 3: Data Modeling & Interactive Visualization (Power BI / DAX)

1️⃣ Phase 1: Database Management & SQL Exploration
Objective: Load the massive 3-million-row CSV into a relational database to verify integrity and establish baseline metrics.

Key Operations Performed:

Data Ingestion: Handled large-scale data loading using LOAD DATA LOCAL INFILE.

Data Validation: Verified record counts and ran exploratory aggregations to establish global baselines.

Dynamic Binning: Utilized complex CASE statements to categorize continuous variables (e.g., family income and sleep brackets).

SQL
-- Initial Data Load & Verification
LOAD DATA LOCAL INFILE "C:\\Users\\Karma\\Downloads\\Students performance\\student_academic_performance_1M.csv"
INTO TABLE students_performance
FIELDS TERMINATED BY ","
IGNORE 1 ROWS;

-- Verifying the 3 Million Record Count
SELECT COUNT(*) 
FROM students_performance;

-- Grouping Sleep Hours into Analytical Categories
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
Initial Data Load & Row Count Verification:

Creating Categorical Bins via SQL CASE Statements:

2️⃣ Phase 2: Data Transformation & Feature Engineering
Objective: Transition from raw database values to actionable insights by engineering analytical categories.

Engineered Features Included:

Physical Activity Categories: Segmented raw scores into Endurance, High Volume, Hypertrophy Zone, Active Maintenance, and Rest using Power Query conditional logic.

Study Hour Brackets: Grouped daily study hours into functional tiers for easier dashboard filtering.

Power Query Conditional Formatting Workflow:

3️⃣ Phase 3: Advanced Analytics & Power BI Modeling
Objective: Connect the cleaned dataset to Power BI to build an interactive dashboard powered by custom DAX metrics.

Key DAX Measures Created:

Top Performers: Dynamically filters and counts students flagged as high-achievers.

At-Risk Students: Tracks students falling below critical academic and lifestyle thresholds.

Code snippet
// Calculating Total Top Performers
Top Performers = CALCULATE(
    COUNTROWS('student_academic_performance (3)'), 
    'student_academic_performance (3)'[top_performer_flag] = TRUE()
)
DAX Measure Creation (Top Performers KPI):

💡 Executive Insights & Reporting
Based on the SQL aggregations and dataset analysis, several definitive trends emerged regarding the 3 million students tracked:

📈 The Direct Impact of Study Hours: There is a direct, quantifiable correlation between study volume and final grades. Students studying 0 hours averaged a 1.9 GPA, while those studying 8 hours daily achieved a 3.7 GPA.

⚠️ The Cost of Stress: High stress is a massive detractor from academic success. Students reporting a 0 stress index maintained an average 2.8 GPA, whereas those maxing out the stress index (10) saw their average GPA plummet to 2.12.

🎯 Overall Success & Risk Rates: Out of the total student body, 2.4 million students successfully passed, while roughly 577,000 failed. Crucially, the analysis flagged 146,000 students as "at-risk," providing a clear target demographic for intervention.

💤 Sleep Deficits Drive Stress: While the average GPA remained relatively flat across sleep categories, students in the Critical Deficit (3-5 hours) sleep range reported massively higher average stress levels (6.07) compared to those in the Surplus Recovery range (3.44).students in the Critical Deficit (3-5 hours) sleep range reported massively higher average stress levels (6.07) compared to those in the Surplus Recovery range (3.44).
