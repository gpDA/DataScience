-- write your queries underneath each number:
 
-- 1. the total number of rows in the database
SELECT COUNT(*) FROM qol;
-- 2. show the first 15 rows, but only display 3 columns (your choice)
SELECT age, gender, ethnicity FROM qol LIMIT 15;
-- 3. do the same as above, but chose a column to sort on, and sort in descending order
SELECT age, gender, ethnicity FROM qol ORDER BY age DESC LIMIT 15;
-- 4. add a new column without a default value
ALTER TABLE qol ADD COLUMN dog VARCHAR;
-- 5. set the value of that new column
UPDATE qol SET dog = 'Yes';
-- 6. show only the unique (non duplicates) of a column of your choice
SELECT DISTINCT religion FROM qol;
-- 7. group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
SELECT household_size, AVG(income) FROM qol GROUP BY household_size;
-- 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups 
SELECT household_size, AVG(income) FROM qol GROUP BY household_size HAVING household_size < 3;
-- 9. show the mean income of us_born Asian American
SELECT AVG(income) FROM qol WHERE us_born = 'Yes';
-- 10. show the number of Asian American who are Satisfied with their life in the U.S. ('Very Much', 'Pretty Much')
SELECT COUNT(age) FROM qol WHERE Satisfaction='Very much' OR Satisfaction='Pretty much';
-- 11. Show distinct language used by Asian American
SELECT DISTINCT major_language FROM qol;
-- 12. show the mean age of surveyors
SELECT AVG(age) FROM qol;
