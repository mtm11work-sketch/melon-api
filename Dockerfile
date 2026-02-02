FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1
ENV FLASK_APP=melonapi.app
ENV FLASK_ENV=production

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# پوشه باید حفظ بشه
COPY melonapi ./melonapi

CMD ["sh", "-c", "python3 -m flask run --host=0.0.0.0 --port ${PORT:-10000}"]
