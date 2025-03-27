# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
# This also installs the latest version of XGBoost
RUN pip install --no-cache-dir -r requirements.txt && \
    pip install --no-cache-dir xgboost --upgrade

# Expose port 5000 for Flask app
EXPOSE 5000

# Define environment variable to make Flask run properly in Docker
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# Run the application
CMD ["flask", "run"]
