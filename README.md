# Docker Django MySQL Boilerplate

This guide provides a step-by-step process to set up a Django application with MySQL using Docker. Follow the instructions below to get your project up and running quickly.

## System Requirements

Ensure you have **Docker Engine** and **Docker Compose** installed on your machine. You can download and install them from the [Docker Website](https://docs.docker.com/get-docker/).

## Usage

Clone the repository to your local machine:

    git clone https://github.com/ajithpmohan/docker-django-mysql-boilerplate.git
    cd docker-django-mysql-boilerplate

## Permission Required

Before building the services, update the file permissions of `backend/entrypoint.sh`

    chmod +x backend/entrypoint.sh

## Project Setup

Run the following commands to build the services and create the Django project:

    docker compose build
    docker compose run --rm backend django-admin startproject <PROJECT_NAME> .

Replace **PROJECT_NAME** with the desired name of your project.

## Change Database to MySQL Engine

Update the **DATABASES** variable in settings.py to use MySQL. Replace it with the following lines:

    from decouple import config  # Ensure this import is at the top

    DATABASES = {
        'default': {
            'ENGINE': config('SQL_ENGINE'),
            'NAME': config('SQL_DATABASE'),
            'USER': config('SQL_USER'),
            'PASSWORD': config('SQL_PASSWORD'),
            'HOST': config('SQL_HOST'),
            'PORT': config('SQL_PORT'),
        }
    }

This configuration uses the [python-decouple](https://simpleisbetterthancomplex.com/2015/11/26/package-of-the-week-python-decouple.html) package for handling environment variables.

## Rebuild the Image and Start Application

Rebuild the Docker image and start the application with:

    docker compose up -d --build

## Access the Service in Development Mode

You can access the backend service in your browser by navigating to [http://localhost:9200/](http://localhost:9200/).

## Run Python Code Linter & Formatter

To run the Python code linter and formatter, use the following command:

    docker compose -f pre-commit.yml up --build
