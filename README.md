# Customer Retention & Revenue Optimization Project

## 📌 Project Overview
Designed a full-stack analytics solution to identify at-risk customers and optimize revenue. This project utilizes a Star Schema database, SQL-based RFM segmentation, and Machine Learning (NLP + PCA) to predict churn with 88% accuracy.

## 🛠️ Tech Stack
* **Python:** Pandas, Scikit-learn, NLTK (TF-IDF), PCA
* **SQL (MySQL):** Database normalization, Complex Aggregations
* **Power BI:** Data Visualization & Reporting
* **Statistics:** RFM Analysis (Recency, Frequency, Monetary)

## 🔍 Key Steps
1.  **Database Architecture:** Designed a relational **Star Schema** (`dim_Customers`, `fact_Transactions`) to normalize raw retail data.
2.  **Customer Segmentation:** Engineered SQL queries to calculate **RFM scores** for every customer.
3.  **Predictive Modeling:** Built a Decision Tree Classifier achieving **88% accuracy**. Utilized **TF-IDF** to extract features from product descriptions and **PCA** for dimensionality reduction.
4.  **Reporting:** Deployed a Power BI dashboard to visualize "At-Risk" vs. "Champion" cohorts.

## 📊 Results
* Successfully identified high-value customer segments.
* Created a transparent pipeline from raw data to actionable dashboard insights.
