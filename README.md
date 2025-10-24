# 🎓 LMS Analytics & Prediction System

### 📘 Project Overview
This project focuses on analyzing and predicting learner engagement and course completion in a **Learning Management System (LMS)**.  
It integrates **SQL, Excel, Python, and Tableau** to build a complete end-to-end data analytics and machine learning workflow.

---

## 🧠 Project Workflow

### 🧹 1. Data Cleaning, Preparation and Cleaned data visualization
- The raw LMS dataset was cleaned using Python.  
- Missing values, duplicates, and typos were corrected to ensure data accuracy.  
- Text and date columns were standardized, and a new **AccessMonth** column was derived for monthly analysis.  
- The cleaned dataset was then exported for SQL processing and machine learning.

---

### 🧮 2. SQL Analysis and View Creation
- The cleaned data was stored in a SQL database (`LMSAnalytics`).  
- Queries were used to calculate **user engagement, completion status, device usage, and time spent** statistics.  
- A summarized SQL **view (`LMS_Usage_Insights`)** was created that grouped insights by **Technology, Country, Device, and Month**.  
- This view provided the foundation for further visualization and reporting.

---

### 📊 3. Excel Insights Visualization
- The SQL views were imported into Excel to create meaningful visualizations.  
- Charts and dashboards were built to show:
  - Total and unique users per course   
  - Completion status distribution by Top 5 Country
  - Time spent on Device usage 
  - Monthly activity trends  
- These Excel visuals gave a clear understanding of learning patterns and engagement behavior.

---

### 🤖 4. Machine Learning – Random Forest Prediction
- Using the cleaned dataset, a **Random Forest model** was developed in Python to predict learners’ **Completion Status** (`Completed`, `In Progress`, `Not Started`).  
- Features such as **Technology**, **Device**, **Country**, **Time Spent**, and **Access Date** were used for prediction.  
- The model was evaluated for accuracy and feature importance, identifying **Time Spent** as the most influential factor.  
- The predictions were saved into a CSV file for visualization.

---

### 📈 5. Tableau Visualization of Predictions
- The prediction CSV generated from ML-Random Forest Algorithm was imported into **Tableau**.  
- Interactive dashboards were created to visualize:
  - Predicted course completion rates - Overall Status
  - Country-wise completion probability  
  - Device and technology-wise prediction comparisons   
- Tableau dashboards helped in understanding future learner behavior and identifying at-risk students.

---

## 📸 Project Visuals

## 📊 Excel Usage Insights

![usage_insights_output](https://github.com/Varshini15-official/LMS-Analytics-Project/blob/main/LMS_Analysis/excel/EXCEL%20INSIGHTS%20VISUALIZATION/usage_insights_output.png)


## 📈 Tableau LMS Usage Prediction

![tableau_prediction](https://github.com/Varshini15-official/LMS-Analytics-Project/blob/main/LMS_Analysis/tableau/TABLEAU%20PREDICTION%20VISUALIZATION/tableau_prediction.png)


---

## 📁 Workflow

Python (Raw data to cleaned)
↓  
SQL Views  
↓  
Excel Insights  
↓  
Machine Learning(Random Forest for predictions)   
↓  
Tableau (Prediction visualization)



---

## 🌟 Key Takeaways
- **Data Cleaning:** Ensured accuracy and consistency of the LMS dataset.  
- **SQL Insights:** Discovered user engagement trends and learning behavior patterns.  
- **Excel Visuals:** Provided descriptive analytics through charts and pivot dashboards.  
- **Machine Learning:** Predicted learner outcomes with Random Forest for actionable insights.  
- **Tableau Dashboards:** Delivered interactive visual reports for decision-making.

---

## 🧰 Tools & Technologies Used

| Category | Tools |
|-----------|--------|
| **Database** | Microsoft SQL Server |
| **Data Cleaning & ML** | Python (pandas, numpy, scikit-learn) |
| **Visualization** | Excel, Tableau |
| **Algorithm** | Random Forest Classifier |
| **Reporting** | Tableau dashboards |

---

## 🧑‍💻 Author
**Varshini15-official**



