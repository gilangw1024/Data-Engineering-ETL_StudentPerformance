-- ANALISIS SISWA RESILIEN (WAGYU ANALYSIS)
-- Tujuan: Mencari siswa yang nilainya > 80 meskipun akses internet terbatas.
-- Insight: Menunjukkan bahwa grit (jam belajar) bisa mengimbangi minimnya fasilitas.
WITH HighAchievers AS (
    SELECT *
    FROM student_performance
    WHERE internet_access = 'No' 
      AND parental_education_level = 'High School'
      AND exam_score > 80
)
SELECT 
    (SELECT AVG(exam_score) FROM student_performance) as global_avg,
    AVG(ha.exam_score) as overachiever_avg,
    AVG(ha.hours_studied) as how_hard_they_study,
    COUNT(*) as total_students
FROM HighAchievers ha;