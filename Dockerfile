FROM python:3.11-slim

# Working directory
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the project files
COPY . .

# Expose the server port
EXPOSE 5000

# Command to start the server
CMD ["gunicorn", "-b", "127.0.0.1:5000", "app:app"]