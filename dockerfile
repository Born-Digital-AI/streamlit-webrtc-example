# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

WORKDIR /src/app

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install --assume-yes --no-install-recommends ffmpeg 

# Copy the current directory contents into the container at /app
COPY requirements.txt requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY  . .
# Expose port 8501 for Streamlit and 8000 for FastAPI
EXPOSE 8501

# Run app.py when the container launches
CMD sh -c 'streamlit run --server.port=8501 app.py'  