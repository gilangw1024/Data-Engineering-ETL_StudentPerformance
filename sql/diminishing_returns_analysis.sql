-- Menggunakan CTE agar lebih rapi dan terbaca
WITH RankedStudents AS (
    SELECT 
        hours_studied,
        exam_score,
        sleep_hours,
        NTILE(10) OVER (ORDER BY hours_studied) AS kelompok_belajar
    FROM student_performance
)
SELECT 
    kelompok_belajar,
    MIN(hours_studied) AS min_jam_belajar,
    MAX(hours_studied) AS max_jam_belajar,
    ROUND(AVG(exam_score), 2) AS rata_rata_skor,
    ROUND(AVG(sleep_hours), 2) AS rata_rata_tidur,
    COUNT(*) AS jumlah_siswa
FROM RankedStudents
GROUP BY kelompok_belajar
ORDER BY kelompok_belajar;