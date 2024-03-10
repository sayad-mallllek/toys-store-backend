# Use an official Python runtime as a parent image
FROM python:3.11-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DATABASE_HOST "aws-0-eu-central-1.pooler.supabase.com"
ENV DATABASE_PORT 5432
ENV DATABASE_NAME "toys"
ENV DATABASE_USER "postgres.mbstkzhbzcufwgqhxpcn"
ENV DATABASE_PASSWORD "wM7UcJ31iltaBSRC"

# Set work directory
WORKDIR /code

# Install dependencies
COPY requirements.txt /code/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy project
COPY . /code/

# Expose port
EXPOSE 8000

# Run the application:
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]