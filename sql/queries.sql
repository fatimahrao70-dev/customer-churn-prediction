

-- 1. Overall customer churn rate
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM churn_status;


-- 2. Churn rate by contract type
SELECT
    a.Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM accounts a
JOIN churn_status c ON a.customerID = c.customerID
GROUP BY a.Contract
ORDER BY churn_rate DESC;


-- 3. Churn rate by Internet Service
SELECT
    s.InternetService,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM services s
JOIN churn_status c ON s.customerID = c.customerID
GROUP BY s.InternetService
ORDER BY churn_rate DESC;


-- 4. Average tenure: churned vs retained
SELECT
    c.Churn,
    ROUND(AVG(cu.tenure), 2) AS average_tenure
FROM customers cu
JOIN churn_status c ON cu.customerID = c.customerID
GROUP BY c.Churn;


-- 5. Average monthly charges: churned vs retained
SELECT
    c.Churn,
    ROUND(AVG(a.MonthlyCharges), 2) AS average_monthly_charges
FROM accounts a
JOIN churn_status c ON a.customerID = c.customerID
GROUP BY c.Churn;


-- 6. Churn rate by payment method
SELECT
    a.PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM accounts a
JOIN churn_status c ON a.customerID = c.customerID
GROUP BY a.PaymentMethod
ORDER BY churn_rate DESC;


-- 7. Churn rate by technical support
SELECT
    s.TechSupport,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM services s
JOIN churn_status c ON s.customerID = c.customerID
GROUP BY s.TechSupport
ORDER BY churn_rate DESC;


-- 8. Churn rate for customers with tenure under 6 months
-- and no technical support
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers cu
JOIN services s ON cu.customerID = s.customerID
JOIN churn_status c ON cu.customerID = c.customerID
WHERE cu.tenure < 6
AND s.TechSupport = 'No';


-- 9. Churn rate by senior citizen status
SELECT
    cu.SeniorCitizen,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers cu
JOIN churn_status c ON cu.customerID = c.customerID
GROUP BY cu.SeniorCitizen
ORDER BY churn_rate DESC;


-- 10. Churn rate by paperless billing
SELECT
    a.PaperlessBilling,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM accounts a
JOIN churn_status c ON a.customerID = c.customerID
GROUP BY a.PaperlessBilling
ORDER BY churn_rate DESC;


-- 11. Total monthly revenue at risk
SELECT
    ROUND(SUM(a.MonthlyCharges), 2) AS monthly_revenue_at_risk
FROM accounts a
JOIN churn_status c ON a.customerID = c.customerID
WHERE c.Churn = 'Yes';


-- 12. Top 5 customer segments by contract and payment method
SELECT
    a.Contract,
    a.PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM accounts a
JOIN churn_status c ON a.customerID = c.customerID
GROUP BY a.Contract, a.PaymentMethod
ORDER BY churn_rate DESC
LIMIT 5;


-- 13. Churn rate by tenure group
SELECT
    CASE
        WHEN cu.tenure <= 12 THEN '0-12 months'
        WHEN cu.tenure <= 24 THEN '13-24 months'
        WHEN cu.tenure <= 48 THEN '25-48 months'
        ELSE '49+ months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM customers cu
JOIN churn_status c ON cu.customerID = c.customerID
GROUP BY tenure_group
ORDER BY churn_rate DESC;


-- 14. Number of services and churn
SELECT
    (
        CASE WHEN s.PhoneService = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN s.InternetService != 'No' THEN 1 ELSE 0 END +
        CASE WHEN s.OnlineSecurity = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN s.OnlineBackup = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN s.DeviceProtection = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN s.TechSupport = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN s.StreamingTV = 'Yes' THEN 1 ELSE 0 END +
        CASE WHEN s.StreamingMovies = 'Yes' THEN 1 ELSE 0 END
    ) AS number_of_services,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        100.0 * SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS churn_rate
FROM services s
JOIN churn_status c ON s.customerID = c.customerID
GROUP BY number_of_services
ORDER BY number_of_services;


-- 15. Identify high-risk customers
SELECT
    cu.customerID,
    cu.tenure,
    a.Contract,
    a.MonthlyCharges,
    s.TechSupport,
    c.Churn
FROM customers cu
JOIN accounts a ON cu.customerID = a.customerID
JOIN services s ON cu.customerID = s.customerID
JOIN churn_status c ON cu.customerID = c.customerID
WHERE cu.tenure < 12
AND a.Contract = 'Month-to-month'
AND s.TechSupport = 'No'
ORDER BY a.MonthlyCharges DESC;

