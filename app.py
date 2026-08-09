from flask import Flask, render_template, request
import pandas as pd
import joblib

app = Flask(__name__)

# Load model and preprocessor
model = joblib.load("churn_model.pkl")
preprocessor = joblib.load("preprocessor.pkl")


@app.route("/")
def home():
    return render_template("index.html")


@app.route("/predict", methods=["POST"])
def predict():

    data = {
        "gender": request.form["gender"],
        "SeniorCitizen": int(request.form["SeniorCitizen"]),
        "Partner": request.form["Partner"],
        "Dependents": request.form["Dependents"],
        "tenure": int(request.form["tenure"]),
        "Contract": request.form["Contract"],
        "PaperlessBilling": request.form["PaperlessBilling"],
        "PaymentMethod": request.form["PaymentMethod"],
        "MonthlyCharges": float(request.form["MonthlyCharges"]),
        "TotalCharges": float(request.form["TotalCharges"]),
        "PhoneService": request.form["PhoneService"],
        "MultipleLines": request.form["MultipleLines"],
        "InternetService": request.form["InternetService"],
        "OnlineSecurity": request.form["OnlineSecurity"],
        "OnlineBackup": request.form["OnlineBackup"],
        "DeviceProtection": request.form["DeviceProtection"],
        "TechSupport": request.form["TechSupport"],
        "StreamingTV": request.form["StreamingTV"],
        "StreamingMovies": request.form["StreamingMovies"]
    }

    input_df = pd.DataFrame([data])

    # Preprocess input
    input_processed = preprocessor.transform(input_df)

    # Prediction
    prediction = model.predict(input_processed)[0]

    # Probability
    probability = model.predict_proba(input_processed)[0][1] * 100

    if prediction == 1:
        result = "Customer is likely to churn"
    else:
        result = "Customer is unlikely to churn"

    return render_template(
        "index.html",
        prediction=result,
        probability=round(probability, 2)
    )


if __name__ == "__main__":
    app.run(debug=True)