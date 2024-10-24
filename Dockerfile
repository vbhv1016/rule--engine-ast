# Step 1: Use an official Python runtime as a base image
FROM python:3.9-slim

# Step 2: Set the working directory in the container
WORKDIR /app

# Step 3: Copy the current directory contents into the container
COPY . /app

# Step 4: Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Initialize the database (you can remove this if not needed for Docker build)
RUN python -c "from app.database import initialize_database; initialize_database()"

# Step 6: Expose port 5000 to access the application from outside the container
EXPOSE 5000

# Step 7: Set environment variables for Flask
ENV FLASK_APP=main.py
ENV FLASK_RUN_HOST=0.0.0.0

# Step 8: Run the Flask server
CMD ["flask", "run"]
