# Pull Python official base image
FROM python:3.10.6-slim

# Set the working directory
ENV BASE_DIR=/home/app
ENV APP_HOME=$BASE_DIR/backend
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Create assets directory
ENV ASSETS_HOME=$BASE_DIR/assets
RUN mkdir -p $ASSETS_HOME/staticfiles && mkdir $ASSETS_HOME/mediafiles

# Set enviroment variables - Prevents Python from writing pyc files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# Prevents Python from buffering stdout and stderr
ENV PYTHONUNBUFFERED 1

# Install mysqlclient dependencies
RUN apt update \
    && apt install -y --no-install-recommends python3-dev \
    default-libmysqlclient-dev build-essential default-mysql-client \
    && apt autoclean

# Upgrade Pip
RUN pip install --no-cache-dir --upgrade pip

# Install python dependencies
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY ./entrypoint.sh .
RUN sed -i 's/\r$//g' $APP_HOME/entrypoint.sh
RUN chmod +x $APP_HOME/entrypoint.sh

# Copies everything over to Docker environment
COPY . $APP_HOME

# Run entrypoint.sh
ENTRYPOINT ["/home/app/backend/entrypoint.sh"]
