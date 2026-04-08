# Student Performance ETL Pipeline (Dockerized)

Proyek ini adalah pipeline **ETL (Extract, Transform, Load)** sederhana yang dirancang untuk mengolah data performa siswa dari file CSV mentah ke dalam database PostgreSQL yang ter-kontainerisasi menggunakan Docker.

## 🛠️ Tech Stack
- **Language:** Python 3.11
- **Libraries:** Pandas, SQLAlchemy, Psycopg2
- **Database:** PostgreSQL 15
- **Infrastructure:** Docker & Docker Compose

## 📋 Fitur Pipeline
1. **Extract:** Membaca data mentah dari file `/data/source.csv`.
2. **Transform:** - Standarisasi nama kolom (lowercase & snake_case).
   - Penanganan nilai kosong (*handling missing values*).
   - Pembersihan data spasi pada teks.
3. **Load:** Mengirimkan data yang telah bersih ke tabel `student_performance` di PostgreSQL secara otomatis.

## Cara Menjalankan (Local Setup)

1. **Clone Repository:**
   ```bash
   git clone [https://github.com/gilangw1024/Data-Engineering-ETL_StudentPerformance.git](https://github.com/gilangw1024/Data-Engineering-ETL_StudentPerformance.git)
   cd Data-Engineering-ETL_StudentPerformance

.
├── data/               # Folder file CSV mentah
├── pipeline.py         # Script utama Python ETL
├── Dockerfile          # Instruksi build image Python
├── docker-compose.yml  # Konfigurasi container DB dan App
├── requirements.txt    # Library dependencies
└── .env                # (Hidden) Kredensial database
