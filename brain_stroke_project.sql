 --Exploring Data on Strokes and Potential Risk Factors
 
-- Select all the data we're going to be looking at

SELECT * from brain_stroke;

-- Shows the percentage of people in the dataset who expereinced a stroke

SELECT COUNT(*) as total_population, SUM(stroke) as total_strokes, ROUND((SUM(stroke)*100.0/COUNT(*)),2) as stroke_percentage
FROM brain_stroke;

-- Shows percentage of people who have experienced a stroke that are Women

SELECT COUNT(*) as total_women, SUM(stroke) as total_strokes_in_women, ROUND((SUM(stroke)*100.0/COUNT(*)),2) as stroke_percentage_women
FROM brain_stroke
WHERE gender is 'Female';

-- Shows percentage of people who experienced strokes who had smoked in the past

SELECT COUNT(*) as total_population, SUM(stroke) as total_strokes, ROUND((SUM(stroke)*100.0/COUNT(*)),2) as stroke_percentage_smokers
FROM brain_stroke
WHERE smoking_status is 'formerly smoked' or 'smokes';

-- Job types with the highest percentage of strokes from highest to lowest

SELECT work_type, COUNT(*) as total_population, SUM(stroke) as total_strokes, ROUND((SUM(stroke)*100.0/COUNT(*)),2) as stroke_percentage
FROM brain_stroke
GROUP BY work_type
ORDER BY stroke_percentage DESC;

-- Stroke percentage based on Residence_type from highest to lowest

SELECT Residence_type, COUNT(*) as total_population, SUM(stroke) as total_strokes, ROUND((SUM(stroke)*100.0/COUNT(*)),2) as stroke_percentage
FROM brain_stroke
GROUP BY Residence_type
ORDER BY stroke_percentage DESC;

-- Average BMI of those who had a stroke

SELECT ROUND(AVG(bmi),2) as storke_avg_bmi
FROM brain_stroke
WHERE stroke = 1;

-- Average glucose level of those who had a stroke

SELECT ROUND(AVG(avg_glucose_level),2) as storke_avg_glucose
FROM brain_stroke
WHERE stroke = 1;


