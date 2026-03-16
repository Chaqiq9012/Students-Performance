# 🎓 Student Academic Performance Analysis

> An end-to-end **Data Analytics Project** analyzing **3,000,000 student records** to uncover the hidden drivers of academic success, dropout risk, and lifestyle impact.

---

# 📌 **Project Overview**

This project analyzes a **large dataset of 3 million student records** to identify the key factors influencing academic performance.

The analysis focuses on exploring relationships between:

- Study habits  
- Stress levels  
- Sleep patterns  
- Physical activity  
- Academic results  

The goal of this project is to uncover **data-driven insights that can improve student success rates and help identify at-risk students early.**

---

# 🎯 **Project Objective**

The objective of this project was to simulate a **real-world data analytics workflow**, demonstrating the ability to:

- Handle **large-scale datasets**
- Perform **SQL data exploration**
- Apply **feature engineering**
- Build **interactive dashboards**
- Extract **actionable insights**

---

# 🧭 **Project Workflow & Tech Stack**

| Phase | Tools | Purpose |
|------|------|------|
| Phase 1 | MySQL | Data loading and exploration |
| Phase 2 | Excel / Power Query | Data transformation & feature engineering |
| Phase 3 | Power BI / DAX | Data modeling & interactive dashboards |

---

# 1️⃣ **Phase 1 — Database Management & SQL Exploration**

### **Objective**

Load the **3-million-row dataset** into a relational database and perform initial exploration to validate the dataset and establish baseline metrics.

---

### **Key Operations Performed**

**Data Ingestion**

Large CSV files were imported into MySQL using:

```sql
LOAD DATA LOCAL INFILE
```

This approach allows efficient loading of large datasets.

---

**Data Validation**

Initial checks included:

- Row count verification  
- Dataset integrity validation  
- Exploratory aggregations  

Example:

```sql
SELECT COUNT(*)
FROM students_performance;
```

---

**Dynamic Data Binning**

Continuous variables were transformed into analytical categories using **SQL CASE statements**.

Example:

```sql
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
```

---

# 2️⃣ **Phase 2 — Data Transformation & Feature Engineering**

### **Objective**

Transform raw dataset variables into **analytical features** that simplify analysis and improve dashboard usability.

---

### **Engineered Features**

Several analytical columns were created using **Power Query and Excel logic**.

---

### **Physical Activity Categories**

Physical activity scores were segmented into meaningful groups:

- Endurance  
- High Volume  
- Hypertrophy Zone  
- Active Maintenance  
- Rest  

---

### **Study Hour Brackets**

Daily study hours were grouped into tiers to make filtering and analysis easier.

---

### **Sleep Categories**

Sleep hours were categorized as follows:

| Category | Range |
|------|------|
| Critical Deficit | 3 – 5 hours |
| Sub-optimal | 5 – 7 hours |
| Optimal Range | 7 – 9 hours |
| Surplus Recovery | 9 – 10 hours |

---

# 3️⃣ **Phase 3 — Advanced Analytics & Power BI Modeling**

### **Objective**

Create an **interactive Power BI dashboard** to explore academic performance patterns and identify success drivers.

---

### **Key Metrics Created**

Several **DAX measures** were created to track important performance indicators.

Examples include:

- **Top Performers**
- **At-Risk Students**
- **Average GPA**
- **Pass Rate**
- **Academic Success Indicators**

Example DAX Measure:

```DAX
Top Performers =
CALCULATE(
COUNTROWS('student_academic_performance'),
'student_academic_performance'[top_performer_flag] = TRUE()
)
```

---

# 📊 **Interactive Dashboard**

The final Power BI dashboard enables users to explore relationships between **lifestyle factors and academic performance.**

Dashboard pages include:

- **Overview KPIs**
- **Academic Performance Analysis**
- **Lifestyle & Behavior Analysis**
- **Advanced Student Risk Insights**

---

# 💡 Executive Insights & Strategic Recommendations
The analysis of the 3 million student records revealed several critical patterns regarding academic success. Below is a deep dive into the findings, the methodology used to uncover them, and actionable recommendations for educational stakeholders.

# 📈 1. The Direct Impact of Study Volume on GPA
**The What (Observation):** 

There is a stark, quantifiable correlation between study volume and final grades. Students studying 0 hours per day averaged a baseline 1.9 GPA, while those dedicating 8 hours daily achieved a 3.7 GPA.

**The Method (How we found it):** 

Utilized SQL GROUP BY aggregations on engineered study-hour brackets, followed by a trend analysis visualization in Power BI mapping Average GPA against Study Hours.

**The Why (Interpretation):**

Consistent "time on task" remains the strongest predictor of academic mastery. The data shows a near-linear progression, suggesting that educational outcomes are highly dependent on structured, independent study habits rather than just classroom attendance.

**The Recommendation:** 

Academic institutions should implement mandatory time-management workshops for incoming freshmen and consider integrating guided study halls into the standard curriculum for underperforming cohorts.

# ⚠️ 2. High Stress Severely Degrades Academic Performance
**The What (Observation):** 

Stress is a massive detractor from academic success. Students reporting a maximum stress index (10) saw their average GPA plummet to 2.12, whereas students with a 0 stress index maintained a 2.8 GPA.

**The Method (How we found it):** 

Executed SQL queries grouping students by their self-reported stress_index to calculate the corresponding AVG(final_gpa), revealing a clear negative correlation.

**The Why (Interpretation):** 

High cognitive load and chronic stress impair executive function, memory retention, and testing focus. The data proves that student wellbeing is not just a personal issue, but a direct academic performance metric.

**The Recommendation:** 

Universities must proactively expand mental health resources, strategically space out major examination dates to prevent bottlenecking, and introduce stress-reduction initiatives during midterms and finals.

# 🎯 3. Macro-Level Success & The "At-Risk" Intervention Zone
**The What (Observation):** 

Out of the 3 million students tracked, 2.4 million successfully passed, while 577,000 failed. Most importantly, the analysis isolated a specific cohort of 146,000 students currently flagged as "at-risk."

**The Method (How we found it):** 

Authored custom DAX measures (using CALCULATE and COUNTROWS with boolean flags) in Power BI to create dynamic KPI scorecards representing the macro-health of the student body.

**The Why (Interpretation):** 

While the overall pass rate is strong, the 577k failure count represents a significant drop-out risk. The 146k "at-risk" students represent the most critical demographic—these are students on the borderline who can still be saved before failing.

**The Recommendation:** 

Deploy an automated, data-driven early warning system. When a student's metrics drop into the "at-risk" threshold, it should automatically trigger interventions such as mandatory academic advising or targeted tutoring outreach.

# 💤 4. Sleep Deficits Drive Systemic Stress
**The What (Observation):** 

Students trapped in a "Critical Sleep Deficit" (3–5 hours per night) reported massively higher average stress levels (6.07) compared to students achieving "Surplus Recovery" of 9–10 hours (3.44 average stress).

**The Method (How we found it):** 

Engineered a SQL CASE statement to categorize raw sleep hours into functional brackets (Deficit, Sub-optimal, Optimal, Surplus), then calculated the average stress index for each tier.

**The Why (Interpretation):** 

Lack of restorative sleep biologically increases cortisol levels, making standard academic challenges feel overwhelming. This creates a vicious cycle: sleep deprivation causes stress, which lowers GPA (as proven in Insight #2).

**The Recommendation:**

Launch campus-wide sleep hygiene awareness campaigns. Furthermore, academic scheduling committees should review the necessity of 7:00 AM or 8:00 AM classes for historically difficult, high-failure-rate subjects.

---

# 🚀 **Project Conclusion**

This project demonstrates a complete **Data Analytics lifecycle**, including:

- Large-scale **SQL data exploration**
- **Feature engineering**
- **Power BI dashboard development**
- **Insight generation from complex datasets**

The final dashboard transforms raw student records into **clear, actionable insights that can support better educational decision-making.**

---

# 📂 **Repository Structure**

```
/SQL
   exploration_queries.sql

/PowerBI
   student_dashboard.pbix

/Data
   cleaned_dataset.csv

README.md
```

---

⭐ If you found this project interesting, feel free to **star the repository**.
