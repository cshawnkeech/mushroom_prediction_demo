# Dockerfile
FROM python:3.11-slim

WORKDIR /app

COPY src src/
COPY models models/

COPY app.py requirements.txt ./

RUN pip install --upgrade pip

RUN pip3 install -r requirements.txt

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

ENTRYPOINT ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]