# Customer Churn Prediction System

## 📌 Project Overview

This project develops a Machine Learning-based Customer Churn Prediction System for predicting whether a customer is likely to leave a service.

The system uses customer-related information, data preprocessing, machine learning models, evaluation metrics, explainability, and a Flask web application to provide churn predictions.

The final application is deployed online using PythonAnywhere.

## 🎯 Objectives

- Understand customer churn behavior.
- Perform data cleaning and exploratory data analysis.
- Perform feature engineering and preprocessing.
- Train and compare multiple machine learning models.
- Evaluate model performance using classification metrics.
- Predict whether a customer is likely to churn.
- Display churn probability through a web application.
- Deploy the final application online.

## 🛠️ Technologies Used

- Python
- Pandas
- NumPy
- Matplotlib
- Scikit-learn
- Joblib
- Flask
- HTML/CSS
- PythonAnywhere
- SQL

## 📂 Project Structure

```text
customer_churn_project/
│
├── app.py
├── churn_model.pkl
├── preprocessor.pkl
├── requirements.txt
├── README.md
│
├── screenshots/
│   ├── 01_web_app.png
│   ├── 02_prediction.png
│   └── 03_deployment.png
│
└── templates/
    └── index.html
```

## 🔄 Project Workflow

The project follows these major phases:

1. Business Understanding
2. SQL Database and Queries
3. Exploratory Data Analysis
4. Feature Engineering
5. Data Preprocessing
6. Machine Learning Model Training
7. Model Evaluation
8. SHAP Explainability
9. Web Application Development
10. Deployment
11. Documentation and Reporting

## 🤖 Machine Learning

The machine learning pipeline includes:

- Data preprocessing
- Feature transformation
- Model training
- Model evaluation
- Churn prediction

The final model achieved the following performance:

| Metric    |  Score |
| --------- | -----: |
| Accuracy  | 80.27% |
| Precision | 66.55% |
| Recall    | 51.60% |
| F1 Score  | 58.13% |

### Confusion Matrix

```text
[[938   97]
 [181  193]]
```

Where:

- True Negatives = 938
- False Positives = 97
- False Negatives = 181
- True Positives = 193

The model correctly identified approximately **51.6% of actual churners**.

## 🌐 Web Application

A Flask-based web application was developed to allow users to enter customer information and receive a churn prediction.

The application displays:

- Customer churn prediction
- Churn probability
- Prediction result

### Example

```text
Customer is likely to churn

Churn Probability: 67.42%
```

## 🚀 Deployment

The Flask application was deployed using PythonAnywhere.

Live application:

[https://famtimah.pythonanywhere.com/](https://famtimah.pythonanywhere.com/)

The deployed application uses:

- Python 3.11
- Flask
- Scikit-learn
- Joblib
- Saved machine learning model
- Saved preprocessing pipeline

## 📸 Screenshots

### 1. Customer Churn Web Application



### 2. Prediction Result



### 3. PythonAnywhere Deployment



## 📦 Installation

Clone or download the project and install the required packages:

```bash
pip install -r requirements.txt
```

Run the Flask application:

```bash
python app.py
```

The application will normally be available at:

```text
http://127.0.0.1:5000
```

## 📊 Results

The final model achieved an accuracy of approximately **80.27%**, meeting the project's target of at least 80% accuracy.

The web application successfully uses the trained model and preprocessing pipeline to generate customer churn predictions.

## 🔮 Future Improvements

Future improvements could include:

- Improving recall for churners.
- Hyperparameter tuning.
- Testing additional machine learning algorithms.
- Adding more customer behavioral features.
- Improving the user interface.
- Adding a database connection to the deployed application.
- Monitoring model performance after deployment.

## 👩‍💻 Author

**Fatimah Ramzan**

Customer Churn Prediction — Machine Learning Project
