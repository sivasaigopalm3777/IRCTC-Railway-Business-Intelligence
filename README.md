# 🚆 IRCTC Railway Business Intelligence Dashboard

<p align="center">

### Transforming Railway Booking Data into Actionable Business Insights using SQL & Power BI

End-to-End Data Analytics Project | SQL | Power BI | Excel | Python

</p>

---

# 📌 Project Overview

The **IRCTC Railway Business Intelligence Dashboard** is an end-to-end Data Analytics project developed to analyze railway booking and operational data.

The objective of this project is to transform raw booking data into meaningful business insights that help railway authorities understand passenger behavior, revenue performance, operational efficiency, and booking trends.

Using **SQL** for data analysis and **Power BI** for visualization, this project provides interactive dashboards that support data-driven decision-making.

---

# 🎯 Business Problem

Indian Railways generates millions of booking transactions every year.

Analyzing such a large volume of data manually is difficult.

Business stakeholders require answers to questions like:

- Which railway zone generates maximum revenue?
- Which train categories are most profitable?
- What are monthly booking trends?
- Which destinations generate maximum revenue?
- Which passenger segments travel most frequently?
- Which travel classes have higher occupancy?
- How efficient are railway operations?
- Which routes contribute significantly to revenue?

This project answers these questions through SQL analysis and interactive Power BI dashboards.

---

# 🎯 Project Objectives

- Analyze railway booking performance.
- Identify revenue-generating railway zones.
- Understand passenger demographics.
- Analyze travel behavior.
- Evaluate train operational performance.
- Monitor revenue trends.
- Measure seat occupancy.
- Discover business growth opportunities.

---

# 🛠 Tools & Technologies Used

| Tool | Purpose |
|-------|----------|
| SQL (MySQL) | Data Analysis |
| Power BI | Dashboard Development |
| Excel | Data Validation |
| Python | Dataset Generation |

---

# 📂 Dataset Information

The project uses a relational railway booking dataset containing:

### Fact Table

- Fact Bookings

### Dimension Tables

- Passenger Details
- Train Details

### Dataset Includes

- Passenger Information
- Train Information
- Booking Details
- Travel Class
- Ticket Type
- Booking Status
- Railway Zone
- Source Station
- Destination Station
- Revenue
- Travel Time
- Delay Minutes
- Payment Method
- Season
- Seat Occupancy
- Travel Frequency
- Passenger Occupation
- Passenger Age Group

---

# 🗄 Database Schema

Star Schema

```
                 Dim Passengers
                      |
                      |
Fact Bookings --------+-------- Dim Trains
```

---

# 📊 SQL Analysis

The project includes business-focused SQL analysis covering:

### Revenue Analysis

- Revenue by Railway Zone
- Revenue Contribution
- Revenue by Train Category
- Average Fare
- Weekend Revenue

### Booking Analysis

- Monthly Booking Trend
- Seasonal Booking Trend
- Ticket Type Analysis
- Travel Class Analysis

### Passenger Analysis

- Passenger Distribution
- Gender Analysis
- Occupation Analysis
- Travel Frequency
- State-wise Analysis

### Operational Analysis

- Delay Analysis
- Route Performance
- Travel Time Analysis
- Seat Occupancy
- Destination Performance

---

# 🚀 Advanced SQL Concepts Used

- Aggregate Functions
- GROUP BY
- ORDER BY
- INNER JOIN
- CASE Statements
- Common Table Expressions (CTE)
- Window Functions (RANK)
- Views
- Subqueries

---

# 📈 Power BI Dashboard

The Power BI report contains **3 Interactive Dashboard Pages**.

---

# 📊 Dashboard 1 — Booking Performance & Revenue Overview

### Dashboard Preview

![Dashboard Overview](Images/Dashboard%20Overview.png)

### KPIs

- Total Bookings
- Total Revenue
- Total Passengers
- Average Fare

### Visualizations

- Revenue by Train Category
- Payment Method Distribution
- Revenue by Railway Zone
- Monthly Revenue Trend
- Bookings by Travel Class

---

# 👥 Dashboard 2 — Passenger Analytics

### Dashboard Preview

![Passenger Analytics](Images/Passenger%20Analytics.png)

### KPIs

- Total Passengers
- Male Passengers
- Female Passengers
- High Frequency Travellers

### Visualizations

- Passenger Age Distribution
- Gender Distribution
- Occupation Analysis
- Travel Frequency
- Passenger State Distribution
- Travel Type Distribution

---

# 🚉 Dashboard 3 — Route & Operational Analytics

### Dashboard Preview

![Route & Operational Analytics](Images/Route%20%26%20Operational%20Analytics.png)

### KPIs

- Average Distance
- Average Travel Time
- Average Delay
- Average Seat Occupancy

### Visualizations

- Delay by Railway Zone
- Travel Time by Train Category
- Revenue Heatmap
- Seat Occupancy
- Top Revenue Destinations

---

# 💡 Key Business Insights

### Revenue Insights

- East Coast Zone generated the highest overall revenue.
- Duronto trains generated the highest revenue among all train categories.
- Delhi emerged as the highest revenue-generating destination.
- Average monthly revenue remained stable around ₹7M.

---

### Passenger Insights

- Passenger distribution remained nearly balanced between male and female travellers.
- High-frequency travellers contributed significantly to booking volume.
- IT Employees represented the largest occupation segment.
- Maharashtra recorded the highest passenger count.

---

### Operational Insights

- Southern Zone recorded the highest average delay.
- Average seat occupancy remained around 75%.
- Long-distance routes generated substantial revenue.
- Travel times varied across train categories, indicating opportunities for operational optimization.

---

# 📈 Business Recommendations

### Revenue Growth

- Expand premium train services on high-demand routes.
- Increase train frequency on profitable railway zones.
- Optimize pricing strategies during peak travel seasons.

---

### Customer Experience

- Introduce loyalty programs for frequent travellers.
- Improve digital payment adoption through promotional offers.
- Enhance premium travel experiences for high-value passengers.

---

### Operational Efficiency

- Reduce delays in high-traffic railway zones.
- Improve scheduling for long-distance trains.
- Optimize resource allocation using occupancy analysis.

---

### Strategic Planning

- Focus marketing campaigns on high-performing states.
- Expand premium travel classes where demand is consistently high.
- Monitor seasonal demand to improve train scheduling.

---

# 📁 Project Structure

```
IRCTC-Railway-Business-Intelligence
│
├── README.md
│
├── IRCTC Railway Business Intelligence SQL Analysis.sql
│
├── IRCTC Railway Business Intelligence.pbix
│
├── IRCTC Railway Business Intelligence Dataset
│     ├── fact_bookings.csv
│     ├── dim_passengers.csv
│     ├── dim_trains.csv
│     └── generate_irctc_data.py
│
└── Dashboard Screenshots
      ├── Dashboard Overview.png
      ├── Passenger Analytics.png
      └── Route & Operational Analytics.png
```

---

# ▶️ How to Run

### SQL

- Import the CSV files into MySQL.
- Execute the SQL analysis queries.

### Power BI

- Open the `.pbix` file.
- Refresh the dataset.
- Explore all three dashboard pages using slicers.

---

# 🎯 Skills Demonstrated

- SQL Query Writing
- Data Cleaning
- Data Modeling
- Star Schema Design
- Business Intelligence
- KPI Development
- Dashboard Design
- Data Visualization
- Business Analysis
- Analytical Thinking

---

# 🌟 Project Highlights

- End-to-End Data Analytics Project
- 3 Interactive Power BI Dashboards
- Business-Oriented SQL Analysis
- Advanced SQL Concepts
- Interactive KPI Reporting
- Executive-Level Business Insights
- Actionable Recommendations

---

# 🎯 Project Outcome

This project successfully demonstrates how raw railway booking data can be transformed into meaningful business insights using SQL and Power BI.

The analysis identifies revenue-driving railway zones, passenger travel behavior, booking patterns, operational performance, and business opportunities through interactive dashboards and KPI reporting.

The final solution enables stakeholders to:

- Monitor business performance using real-time KPIs.
- Identify high-performing railway zones and train categories.
- Understand passenger demographics and travel patterns.
- Improve operational efficiency using delay and occupancy analysis.
- Support strategic planning through data-driven decision making.

Overall, this project showcases the complete workflow of a Business Intelligence solution—from data preparation and SQL analysis to interactive dashboard development and business recommendations.

---

# 📌 Conclusion

The **IRCTC Railway Business Intelligence Dashboard** demonstrates how Business Intelligence tools can convert large-scale railway booking data into actionable insights.

By combining SQL for analytical querying with Power BI for visualization, the project provides an interactive reporting solution that simplifies decision-making for railway operations, revenue management, and customer analysis.

This project reflects practical skills in data analytics, dashboard development, and business problem-solving while emphasizing the importance of data-driven decision-making in the transportation industry.

It also highlights the ability to build an end-to-end analytics solution by integrating data modeling, SQL analysis, KPI reporting, visualization, and business storytelling into a single project.

---

# 👨‍💻 Author

## **Siva Sai Gopal Mandru**

**Data Analyst**

### Skills

- SQL
- Power BI
- Excel
- Python

---

### 📬 Connect with Me

- 📧 **Email:** mandrusivasaigopal@gmail.com
- 💼 **LinkedIn:** https://www.linkedin.com/in/siva-sai-gopal-mandru
- 💻 **GitHub:** https://github.com/sivasaigopalm3777

## 🔗 GitHub Repository

```


https://github.com/sivasaigopalm3777/IRCTC-Railway-Business-Intelligence

```

### ⭐ If you found this project useful, consider giving it a Star.
Feel free to share your feedback and suggestions!
### Thank you for visiting this repository!
