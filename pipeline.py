import pandas as pd
from sqlalchemy import create_engine
import os
import time

def run_pipeline():
    # Ambil data dari .env (Docker otomatis menyuntikkan ini)
    DB_USER = os.getenv('POSTGRES_USER')
    DB_PASSWORD = os.getenv('POSTGRES_PASSWORD')
    DB_HOST = os.getenv('POSTGRES_HOST')
    DB_NAME = os.getenv('POSTGRES_DB')
    # Internal port tetap 5432
    DB_PORT = '5432' 

    engine = create_engine(f'postgresql://{DB_USER}:{DB_PASSWORD}@{DB_HOST}:{DB_PORT}/{DB_NAME}')

    try:
        print("--- Memulai Extract ---")
        df = pd.read_csv('/data/source.csv')
        
        print("--- Memulai Transform ---")
        # Contoh: Bersihkan nama kolom agar tidak ada spasi (penting untuk SQL)
        df.columns = [c.strip().lower().replace(' ', '_') for c in df.columns]
        
        # Contoh: Isi nilai kosong pada Exam_Score dengan median atau drop
        df = df.dropna(subset=['exam_score'])
        
        print(f"Data siap di-load. Jumlah baris: {len(df)}")

        print("--- Memulai Load ---")
        df.to_sql('student_performance', engine, if_exists='replace', index=False)
        print("Sukses! Data sudah masuk ke PostgreSQL.")

    except Exception as e:
        print(f"Terjadi Error: {e}")

if __name__ == "__main__":
    # Tunggu DB benar-benar siap
    time.sleep(5)
    run_pipeline()