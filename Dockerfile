# 1. Gunakan image Python resmi
FROM python:3.11-slim

# 2. Set folder kerja di dalam container
WORKDIR /app

# 3. Copy file requirements dulu (agar build lebih cepat kalau ada cache)
COPY requirements.txt .

# 4. Install library yang dibutuhkan
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copy seluruh kode script dan data ke dalam container
COPY . .

# 6. Jalankan script Python saat container dimulai
CMD ["python", "pipeline.py"]