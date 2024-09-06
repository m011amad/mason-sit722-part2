# Base image
FROM python:3.12-slim

#ENV DATABASE_URL=${DATABASE_URL}

# Set working directory
WORKDIR /app

# Copy the requirements.txt file and install dependencies
#COPY book_catalog/requirements.txt /app/
COPY book_catalog/requirements.txt /app/
RUN pip install -r requirements.txt

# Copy the rest of the application code
COPY book_catalog /app/book_catalog

# Expose the port that the app will run on
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "book_catalog.main:app", "--host", "0.0.0.0", "--port", "8000"]
