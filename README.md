Customer Churn Prediction System

A machine learning web application that predicts whether a customer is likely to churn and provides a churn probability.

🔗 Live Demo

Live Application: https://famtimah.pythonanywhere.com/

GitHub Repository: https://github.com/fatimahrao70-dev/customer-churn-prediction

📌 Project Overview

Customer churn is an important business problem because losing existing customers can negatively affect revenue and growth.

This project develops an end-to-end Customer Churn Prediction System that uses customer data and machine learning to identify customers who are likely to churn.

The trained machine learning model is integrated into a Flask web application and deployed publicly using PythonAnywhere.

🎯 Objectives

The main objectives of this project are to:

Analyze customer data using SQL and exploratory data analysis.
Identify patterns related to customer churn.
Perform data preprocessing and feature engineering.
Train and evaluate machine learning models.
Select a suitable final model for churn prediction.
Provide model explainability using SHAP.
Build a user-friendly web application.
Deploy the application so it can be accessed publicly.
🛠️ Technologies Used
Python
Pandas
NumPy
Scikit-learn
SQL
SHAP
Flask
HTML/CSS
Joblib
PythonAnywhere
GitHub
🔄 Project Workflow
Customer Data
      ↓
SQL Analysis
      ↓
Data Cleaning
      ↓
Exploratory Data Analysis
      ↓
Feature Engineering
      ↓
Data Preprocessing
      ↓
Machine Learning Models
      ↓
Model Evaluation
      ↓
SHAP Explainability
      ↓
Final Model
      ↓
Flask Web Application
      ↓
PythonAnywhere Deployment
📊 Exploratory Data Analysis

Exploratory Data Analysis was performed to understand the dataset and identify patterns related to customer churn.

The analysis included:

Missing-value analysis
Data distribution analysis
Churn distribution
Feature relationships
Correlation analysis
Outlier analysis
Comparison of churned and non-churned customers
EDA Screenshots

Screenshots from the analysis are available in the screenshots/ directory.

🤖 Machine Learning

Multiple machine learning approaches were evaluated as part of the project.

The workflow included:

Preparing the input features.
Splitting the data into training and testing sets.
Applying preprocessing.
Training machine learning models.
Evaluating model performance.
Selecting the final model.
Saving the model and preprocessing pipeline using Joblib.
📈 Final Model Performance

The final model achieved the following results on the test dataset:

Metric	Score
Accuracy	80.27%
Precision	66.55%
Recall	51.60%
F1 Score	58.13%

The model achieved the project's target of at least 80% accuracy.

🔢 Confusion Matrix

The final confusion matrix was:

[[938   97]
 [181  193]]

	Predicted No Churn	Predicted Churn
Actual No Churn	938	97
Actual Churn	181	193
Interpretation
True Negatives: 938
False Positives: 97
False Negatives: 181
True Positives: 193

The model correctly identified 51.6% of actual churners.

🔍 Model Explainability

SHAP was used to help understand how the model's features contributed to its predictions.

This makes the prediction system more interpretable and helps identify which customer characteristics have the greatest influence on churn predictions.

🌐 Web Application

The machine learning model was integrated into a Flask web application.

Users can enter customer information and receive:

Churn prediction
Churn probability
Prediction result through a simple web interface
Example
Customer is likely to churn

Churn Probability: 67.42%
🚀 Deployment

The application was deployed using PythonAnywhere.

Live Application

https://famtimah.pythonanywhere.com/

The application is publicly accessible through a web browser.

📁 Project Structure
customer-churn-prediction/
│
├── app.py
├── churn_model.pkl
├── preprocessor.pkl
├── requirements.txt
├── Procfile
├── README.md
│
├── templates/
│   └── index.html
│
├── static/
│
└── screenshots/
💻 Run the Project Locally
1. Clone the repository
git clone https://github.com/fatimahrao70-dev/customer-churn-prediction.git
2. Open the project directory
cd customer-churn-prediction
3. Create a virtual environment
python -m venv venv
4. Activate the environment

Windows:

venv\Scripts\activate
5. Install dependencies
pip install -r requirements.txt
6. Run the Flask application
python app.py
7. Open the application
http://127.0.0.1:5000
📌 Business Impact

The system can act as an early-warning tool for identifying customers who may be at risk of churn.

A business could use these predictions to prioritize customers for retention campaigns or further investigation.

No specific financial savings are claimed because validated revenue-retention data was not available in this project.

👩‍💻 Author

Fatimah Rao

Machine Learning / Data Science Project

Project Links
GitHub: https://github.com/fatimahrao70-dev/customer-churn-prediction
Live Demo: https://famtimah.pythonanywhere.com/
