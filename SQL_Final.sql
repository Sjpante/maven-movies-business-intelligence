/* =============================================================================
1. STAFF & OPERATIONS OVERVIEW
Objective: Map organizational structure and physical store locations.
=============================================================================
*/ 

-- 1.1 Management Directory & Store Locations
-- Skills: Multi-table Joins (4 tables)
SELECT 
    s.first_name, 
    s.last_name, 
    a.address, 
    a.district, 
    c.city, 
    co.country 
FROM staff s
INNER JOIN address a ON s.address_id = a.address_id 
INNER JOIN city c ON c.city_id = a.city_id 
INNER JOIN country co ON co.country_id = c.city_id;


/* =============================================================================
2. INVENTORY & CONTENT ANALYSIS
Objective: Analyze library diversity, replacement costs, and catalog depth.
=============================================================================
*/ 

-- 2.1 Unique Content Volume & Category Diversity
-- Skills: Distinct Counts, Aggregations
SELECT 'Unique Titles' AS Metric, COUNT(DISTINCT film_id) AS Value FROM inventory
UNION
SELECT 'Unique Categories', COUNT(DISTINCT category_id) FROM film_category;

-- 2.2 Inventory Valuation by Category and Store
-- Skills: Group By, Multi-table Joins, Sum/Avg Aggregations
SELECT 
    i.store_id,
    c.name AS category,
    COUNT(i.inventory_id) AS inventory_count,
    AVG(f.replacement_cost) AS avg_replacement_cost,
    SUM(f.replacement_cost) AS total_replacement_cost
FROM film f
INNER JOIN inventory i ON i.film_id = f.film_id
INNER JOIN film_category fc ON fc.film_id = f.film_id
INNER JOIN category c ON fc.category_id = c.category_id 
GROUP BY i.store_id, c.name
ORDER BY total_replacement_cost DESC;


/* =============================================================================
3. CUSTOMER SEGMENTATION & ENGAGEMENT
Objective: Identify high-value customers and geographic distribution.
=============================================================================
*/ 

-- 3.1 Customer Lifetime Value (LTV) Analysis
-- Skills: Left Joins, Sorting, Financial Aggregations
SELECT 
    c.first_name, 
    c.last_name, 
    COUNT(p.payment_id) AS total_rentals, 
    SUM(p.amount) AS total_lifetime_value
FROM customer c
LEFT JOIN payment p ON p.customer_id = c.customer_id 
GROUP BY c.first_name, c.last_name
ORDER BY total_lifetime_value DESC;

-- 3.2 Customer Geographic & Activity Status
-- Skills: Conditional Logic (CASE WHEN), Left Joins
SELECT 
    c.first_name, 
    c.last_name, 
    c.store_id, 
    a.address, 
    ci.city, 
    co.country,
    CASE WHEN c.active = 1 THEN 'Active' ELSE 'Inactive' END AS account_status		
FROM customer c
LEFT JOIN address a ON c.address_id = a.address_id
LEFT JOIN city ci ON ci.city_id = a.city_id 
LEFT JOIN country co ON co.country_id = ci.country_id;


/* =============================================================================
4. INVESTMENT & STRATEGIC MARKET COVERAGE
Objective: Analyze stakeholder relations and market penetration of awarded content.
=============================================================================
*/ 

-- 4.1 Stakeholder Registry (Investors & Advisors)
-- Skills: Set Operators (UNION), Column Normalization
SELECT 'investor' AS stakeholder_type, i.first_name, i.last_name, i.company_name 
FROM investor i 
UNION 
SELECT 'advisor', a.first_name, a.last_name, 'N/A'
FROM advisor a;

-- 4.2 Actor Award Penetration Analysis
-- Skills: Advanced CASE logic, Percentage Calculations
SELECT 
    CASE 
        WHEN aa.awards = 'Emmy, Oscar, Tony' THEN '3 Awards (Triple Crown)'
        WHEN aa.awards IN ('Emmy, Oscar','Emmy, Tony','Oscar, Tony') THEN '2 Awards'
        ELSE '1 Award'
    END AS award_tier,
    AVG(CASE WHEN aa.actor_id IS NULL THEN 0 ELSE 1 END) AS coverage_pct
FROM actor_award aa
GROUP BY 1;