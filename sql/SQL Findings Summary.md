# SQL Findings Summary
## NexaTel Customer Churn Prediction & Retention Intelligence System

### 1. Overall Churn

The dataset contains **7,043 customers**, of which **1,869 customers have churned**.

The overall customer churn rate is **26.54%**.

This indicates that approximately one out of every four customers has left NexaTel, making customer retention an important business problem.

---

### 2. Churn by Contract Type

Contract type shows a strong relationship with customer churn.

| Contract Type | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Month-to-month | 3,875 | 1,655 | **42.71%** |
| One year | 1,473 | 166 | **11.27%** |
| Two year | 1,695 | 48 | **2.83%** |

Customers with **month-to-month contracts have the highest churn rate at 42.71%**, while customers with two-year contracts have the lowest churn rate at only 2.83%.

This suggests that long-term contracts are strongly associated with customer retention.

---

### 3. Churn by Internet Service

Internet service type also shows substantial differences in churn.

| Internet Service | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Fiber optic | 3,096 | 1,297 | **41.89%** |
| DSL | 2,421 | 459 | **18.96%** |
| No internet service | 1,526 | 113 | **7.40%** |

**Fiber optic customers have the highest churn rate at 41.89%**, compared with 18.96% for DSL customers.

This segment should receive further investigation during EDA to understand why fiber customers are more likely to leave.

---

### 4. Average Tenure

There is a substantial difference in customer tenure between churned and retained customers.

| Customer Status | Average Tenure |
|---|---:|
| Retained | 37.57 months |
| Churned | **17.98 months** |

Churned customers have an average tenure of only **17.98 months**, compared with **37.57 months** for retained customers.

This suggests that newer customers are considerably more vulnerable to churn.

---

### 5. Average Monthly Charges

Churned customers also have higher average monthly charges.

| Customer Status | Average Monthly Charges |
|---|---:|
| Retained | 61.27 |
| Churned | **74.44** |

Customers who churned paid an average of **74.44 per month**, compared with 61.27 for retained customers.

This indicates that higher monthly charges may be associated with increased churn risk.

---

### 6. Churn by Payment Method

Payment method shows a significant difference in churn.

| Payment Method | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| Electronic check | 2,365 | 1,071 | **45.29%** |
| Mailed check | 1,612 | 308 | 19.11% |
| Bank transfer (automatic) | 1,544 | 258 | 16.71% |
| Credit card (automatic) | 1,522 | 232 | 15.24% |

Customers using **electronic checks have the highest churn rate at 45.29%**.

Customers using automatic payment methods have considerably lower churn rates.

This makes payment method an important variable to investigate further during EDA and machine learning.

---

### 7. Churn by Technical Support

Technical support is strongly associated with churn.

| Technical Support | Customers | Churned | Churn Rate |
|---|---:|---:|---:|
| No | 3,473 | 1,446 | **41.64%** |
| Yes | 2,044 | 310 | **15.17%** |
| No internet service | 1,526 | 113 | 7.40% |

Customers without technical support have a churn rate of **41.64%**, compared with only **15.17%** among customers who have technical support.

This suggests that technical support may play an important role in customer retention.

---

### 8. Monthly Revenue at Risk

The total monthly charges associated with customers who have already churned are:

**139,130.85 per month**

This provides an estimate of the recurring monthly revenue associated with churned customers and highlights the financial importance of the retention problem.

---

## Key Business Findings

The SQL analysis identifies several important patterns:

1. Overall churn is **26.54%**.
2. **Month-to-month customers** have substantially higher churn than customers with longer contracts.
3. **Fiber optic customers** have a high churn rate of **41.89%**.
4. Churned customers have much lower average tenure (**17.98 months**) than retained customers (**37.57 months**).
5. Churned customers have higher average monthly charges (**74.44**).
6. **Electronic check users** have the highest churn rate (**45.29%**).
7. Customers without technical support have a much higher churn rate (**41.64%**) than customers with technical support (**15.17%**).
8. The monthly charges associated with churned customers total approximately **139,130.85**.

## Business Implication

The strongest early risk signals identified by the SQL analysis are **month-to-month contracts, short customer tenure, fiber optic service, electronic-check payment, lack of technical support, and higher monthly charges**.

These factors should be investigated further during EDA and feature engineering before being used in the machine learning model.