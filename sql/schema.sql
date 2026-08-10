
-- ==========================================
-- NexaTel Customer Churn Database Schema
-- ==========================================

CREATE TABLE customers (
    customerID TEXT PRIMARY KEY,
    gender TEXT,
    SeniorCitizen INTEGER,
    Partner TEXT,
    Dependents TEXT,
    tenure INTEGER
);

CREATE TABLE accounts (
    customerID TEXT PRIMARY KEY,
    Contract TEXT,
    PaperlessBilling TEXT,
    PaymentMethod TEXT,
    MonthlyCharges REAL,
    TotalCharges TEXT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE services (
    customerID TEXT PRIMARY KEY,
    PhoneService TEXT,
    MultipleLines TEXT,
    InternetService TEXT,
    OnlineSecurity TEXT,
    OnlineBackup TEXT,
    DeviceProtection TEXT,
    TechSupport TEXT,
    StreamingTV TEXT,
    StreamingMovies TEXT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

CREATE TABLE churn_status (
    customerID TEXT PRIMARY KEY,
    Churn TEXT,
    FOREIGN KEY (customerID) REFERENCES customers(customerID)
);
