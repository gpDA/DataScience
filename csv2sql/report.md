# Overview
It is a report about Asian American Quality of Life conducted by city of Austin, TX. There are more criteria (columns) in the original data and I parse some of the interesting columns such as Age, Gender, Ethnicity, Maritial Status, Income of surveyors.
# Table Design
I made a SERIAL as a PRIMARY KEY for a safety reason. 
INTEGER, SERIAL, VARCHAR, NUMERIC is all the DATA TYPE that I use for the
TABLE DESIGN. Age, duration_residency (year) is in INTEGER type, income (in us dollars) is in NUMERIC (floating) type, and other fields are VARCHAR with max_length 100. I already removed all the empty datasets in the previous assignment and I specify that not any attribute can be NULL.


# Import
- When attempting to import csv using the COPY command,
- ERROR:invalid byte sequence for encoding "UTF8": 0xa5
So I add [ encoding 'windows-1251'; ] at the end of the COPY command

for example, 
    COPY qol (person_id, age, gender, ethnicity, maritial_status, household_size, spouse, parent, friends, religion, full_time, part_time, retired, income, us_born, duration_residency, familiarity_america, major_language, satisfaction) FROM '/Users/geonpyunglee/Desktop/school/datamanagement/hw4/gpDA-homework04/AsianAmericanQoL.csv' csv HEADER encoding 'windows-1251';


# Database Information

1. show all of databases in your postgres instance

    geonpyunglee=# \l
                                        List of databases
        Name     |    Owner     | Encoding |   Collate   |    Ctype    |   Access privileges   
    --------------+--------------+----------+-------------+-------------+-----------------------
    geonpyunglee | geonpyunglee | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
    gpresume     | geonpyunglee | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
    homework04   | geonpyunglee | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
    postgres     | postgres     | UTF8     | en_US.UTF-8 | en_US.UTF-8 | 
    template0    | postgres     | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                |              |          |             |             | postgres=CTc/postgres
    template1    | postgres     | UTF8     | en_US.UTF-8 | en_US.UTF-8 | =c/postgres          +
                |              |          |             |             | postgres=CTc/postgres
    (6 rows)

2. show all of the tables in your database

    homework04=# \dt
            List of relations
    Schema | Name | Type  |    Owner     
    --------+------+-------+--------------
    public | qol  | table | geonpyunglee
    (1 row)

3. finally, show some information about the table you created and imported data into: find a way to show its columns, types and constraints

    homework04=# \d qol
                                                Table "public.qol"
        Column        |          Type          | Collation | Nullable |                Default                 
    ---------------------+------------------------+-----------+----------+----------------------------------------
    person_id           | integer                |           | not null | nextval('qol_person_id_seq'::regclass)
    age                 | integer                |           | not null | 
    gender              | character varying(100) |           | not null | 
    ethnicity           | character varying(100) |           | not null | 
    maritial_status     | character varying(100) |           | not null | 
    household_size      | integer                |           | not null | 
    spouse              | character varying(100) |           | not null | 
    parent              | character varying(100) |           | not null | 
    friends             | character varying(100) |           | not null | 
    religion            | character varying(100) |           | not null | 
    full_time           | character varying(100) |           | not null | 
    part_time           | character varying(100) |           | not null | 
    retired             | character varying(100) |           | not null | 
    income              | numeric(10,2)          |           |          | 
    us_born             | character varying(100) |           | not null | 
    duration_residency  | numeric(10,2)          |           |          | 
    familiarity_america | character varying(100) |           | not null | 
    major_language      | character varying(100) |           | not null | 
    satisfaction        | character varying(100) |           | not null | 
    Indexes:
        "qol_pkey" PRIMARY KEY, btree (person_id)
# Query Results

```1. the total number of rows in the database
homework04=# SELECT COUNT(*) FROM qol;
 count 
-------
  1741
(1 row)
```

```2. show the first 15 rows, but only display 3 columns (your choice)
homework04=# SELECT age, gender, ethnicity FROM qol LIMIT 15;
 age | gender |  ethnicity   
-----+--------+--------------
  23 | Female | Chinese
  25 | Male   | Asian Indian
  22 | Female | Vietnamese
  44 | Female | Vietnamese
  44 | Female | Filipino
  32 | Male   | Filipino
  46 | Male   | Vietnamese
  27 | Female | Chinese
  36 | Male   | Chinese
  49 | Female | Chinese
  69 | Male   | Chinese
  55 | Female | Chinese
  67 | Female | Chinese
  45 | Female | Chinese
  78 | Male   | Chinese
(15 rows)
```

```3. do the same as above, but chose a column to sort on, and sort in descending order
homework04=# SELECT age, gender, ethnicity FROM qol ORDER BY age DESC LIMIT 15 ;
 age | gender |  ethnicity   
-----+--------+--------------
  89 | Male   | Korean
  89 | Female | Korean
  88 | Male   | Asian Indian
  85 | Female | Asian Indian
  85 | Female | Vietnamese
  85 | Female | Asian Indian
  84 | Male   | Asian Indian
  84 | Male   | Asian Indian
  83 | Male   | Asian Indian
  83 | Male   | Asian Indian
  82 | Male   | Korean
  82 | Female | Chinese
  82 | Male   | Vietnamese
  82 | Male   | Korean
  81 | Male   | Asian Indian
(15 rows)
```

```4. add a new column without a default value
homework04=# ALTER TABLE qol ADD COLUMN dog VARCHAR;
ALTER TABLE
homework04=# select dog from qol limit 15;
 dog 
-----
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
(15 rows)
```

``` 5. set the value of that new column
homework04=# UPDATE qol SET dog = 'Yes';
UPDATE 1741
homework04=# select dog from qol limit 15;                                                                            dog 
-----
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
 Yes
(15 rows)
```

``` 6. show only the unique (non duplicates) of a column of your choice
homework04=# SELECT DISTINCT religion FROM qol;
  religion  
------------
 None
 Other
 Protestant
 Muslim
 Buddhist
 Catholic
 Hindu
(7 rows)
```

``` 7. group rows together by a column value (your choice) and use an aggregate function to calculate something about that group 
homework04=# SELECT household_size, AVG(income) FROM qol GROUP BY household_size;
 household_size |        avg         
----------------+--------------------
              8 | 32368.105263157895
              7 | 31666.395833333333
              1 | 34448.476377952756
              5 | 37142.610389610390
              4 | 35457.152806652807
              2 | 34615.108974358974
              6 | 26511.284883720930
              3 | 35235.332460732984
(8 rows)
```

``` 8. now, using the same grouping query or creating another one, find a way to filter the query results based on the values for the groups 
homework04=# SELECT household_size, AVG(income) FROM qol GROUP BY household_size HAVING household_size < 3;
 household_size |        avg         
----------------+--------------------
              1 | 34448.476377952756
              2 | 34615.108974358974
(2 rows)
```

``` 9. show the mean income of us_born Asian American
homework04=# SELECT AVG(income) FROM qol WHERE us_born = 'Yes'
homework04-# ;
        avg         
--------------------
 31850.535911602210
(1 row)
```

``` 10. show the number of Asian American who are Satisfied with their life in the U.S. ('Very Much', 'Pretty Much')
homework04=# SELECT COUNT(age) FROM qol WHERE Satisfaction='Very much' OR Satisfaction='Pretty much';
 count 
-------
  1560
(1 row)
```

``` 11. Show distinct language used by Asian American
homework04=# SELECT DISTINCT major_language FROM qol;
   major_language    
---------------------
 Gujarati
 Hindi
 Eng_Chinese only
 Chinese Traditional
 Tagalog
 English
 Viet
 Korean
 Chinese Simplified
(9 rows)
```

``` 12. show the mean age of surveyors
homework04=# SELECT AVG(age) FROM qol;
         avg         
---------------------
 42.6490522688110281
(1 row)
```
