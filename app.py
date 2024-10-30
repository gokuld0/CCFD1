from flask import Flask, request, render_template
import pickle
import numpy as np

# Initialize the Flask app
app = Flask(__name__)

# Load the saved model
with open("LinearRegression.pkl", "rb") as f:
    model = pickle.load(f)

# Route to render the HTML form
@app.route('/')
def index():
    return render_template('index.html')

# Route to handle form submission and make predictions
@app.route('/predict', methods=['POST'])
def predict():
    year = request.form.get("year")
    
    if not year:
        return "Please enter a valid year.", 400

    # Convert the input to the correct format and make prediction
    year = int(year)
    year_array = np.array([[year]])
    predicted_price = model.predict(year_array)[0]

    # Render the template with the prediction result
    return render_template('index.html', prediction=predicted_price, year=year)


if __name__ == "__main__":
    app.run(debug=True,host="0.0.0.0",port=5000)