# Docker Django MySQL Boilerplate

## System Requirements

You need **Docker Engine** and **Docker Compose Version 2**. Install it from [Docker Website](https://docs.docker.com/get-docker/).

## Usage

Download the repository:

    git clone git@github.com:ajithpmohan/docker-django-mysql-boilerplate.git

## Permission Required

Before building the services update the file permission of `backend/entrypoint.sh`

    chmod +x backend/entrypoint.sh

## Project Setup

Run the following lines would build the services and create the project.

    docker compose build
    docker compose run --rm backend django-admin startproject <PROJECT_NAME> .

## Change Database to MySQL Engine

Replace `DATABASES` variable in settings.py to following line.

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

Here [python-decouple](https://simpleisbetterthancomplex.com/2015/11/26/package-of-the-week-python-decouple.html) package is used for handling environment variables. So import python decouple at the top.

    from decouple import config

## Rebuild the Image and Start Application

    docker compose up -d --build

## Access the service in the development mode.

Open [http://localhost:9200/](http://localhost:9200/) to access `backend` service in the browser.

## Run Python Code Linter & Formatter

    docker compose -f pre-commit.yml up --build
