# 📽️ Maven Movies: Business Intelligence & Operations Analysis
**Comprehensive SQL Audit for Strategic Decision-Making**

---

## 📊 Project Overview
This repository contains a full-scale Business Intelligence audit of the **Maven Movies** rental ecosystem. This analysis provides actionable insights into inventory health, customer retention, and financial risk—essential for operational oversight or acquisition due diligence.

## 🛠️ Technical Skills Demonstrated
* **Multi-Table Relational Joins:** Bridging up to five tables to map global store footprints and management hierarchies.
* **Advanced Data Aggregation:** Utilizing `SUM`, `AVG`, and `COUNT DISTINCT` to calculate library valuation and content diversity.
* **Conditional Logic (CASE WHEN):** Building robust customer segmentation models and analyzing content "award-tier" penetration.
* **Set Operators (UNION):** Normalizing disparate stakeholder data into a unified reporting structure.

## 📁 Quick Access
* 📄 **[Final Business Audit (SQL Final.sql)](./SQL%20Final.sql)** — View the complete analysis and reporting suite.
* 🗄️ **[Database Schema Setup (003 create-mavenmovies.sql)](./create-mavenmovies.sql)** — Run this first to build the database environment.

## 📉 Executive Summary of Analysis
* **Staff & Operations:** Mapped the organizational structure and physical store locations across international regions.
* **Inventory Valuation:** Conducted a deep dive into replacement costs and catalog depth, sliced by film category and store ID.
* **Customer Intelligence:** Identified high-value customers through LTV modeling and geographic segmentation to improve marketing targeting.
* **Market Coverage:** Evaluated the library’s coverage of highly-awarded actors to ensure the catalog remains competitive.

## ⚙️ Environment & Usage
1. **Prerequisite:** Ensure you have a **MySQL** or **MariaDB** server instance active.
2. **Step 1:** Run `create-mavenmovies.sql` to generate the schema and populate the tables.
3. **Step 2:** Execute `SQL Final.sql` to generate the report suite.

> **Note:** This project was developed and tested using **DBeaver** and **MySQL Server**. Depending on your specific SQL flavor or client version, slight variations in result formatting or performance may occur.
