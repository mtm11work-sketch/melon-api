FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# خیلی مهم: پوشه melonapi باید به همان شکل پوشه کپی شود
COPY melonapi ./melonapi

# اجرای Flask با --app تا هیچ برداشت اشتباهی از مسیر نکند
CMD ["sh", "-c", "python3 -m flask --app melonapi.app run --host=0.0.0.0 --port ${PORT:-10000}"]
