FROM python:3.11.5

# Set environment variables for Python to run in unbuffered mode and avoid caching
ENV PYTHONUNBUFFERED 1

# Create and set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app/

# Expose port 8000 to the outside world (adjust as needed)
EXPOSE 8000

# Define the command to run your application using gunicorn (adjust as needed)
CMD ["python3", "manage.py", "runserver","0.0.0.0:8000"]