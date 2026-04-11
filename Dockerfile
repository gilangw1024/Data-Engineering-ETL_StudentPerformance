# 1. Gunakan image Python resmi (3.11 sudah cukup stabil)
FROM python:3.11-slim

# 2. Update sistem & install compiler (WAJIB untuk psycopg2 & matplotlib di distro slim)
RUN apt-get update && apt-get install -y \
    gcc \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# 3. Set folder kerja di dalam container
WORKDIR /app

# 4. Copy file requirements dulu
COPY requirements.txt .

# 5. Install library yang dibutuhkan
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copy seluruh kode script dan data ke dalam container
COPY . .

# 7. Jalankan script Python saat container dimulai
CMD ["python", "pipeline.py"]