FROM python:3

# Install distutils (via python3-distutils for Debian-based images)
RUN apt-get update && apt-get install -y python3-distutils

WORKDIR /app
COPY . .

RUN pip install django==3.2

RUN python manage.py migrate

EXPOSE 8000
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
