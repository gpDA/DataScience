import csv
import psycopg2

conn = psycopg2.connect(host="localhost",database="hitmovie", user="gp", password="12345")
cur = conn.cursor()

'''
#INSERT DATA INTO director TABLE
with open('movie_data.csv','r') as f:
    reader = csv.reader(f)
    next(reader) # skip the headr row
    for row in reader:
        cur.execute(
            "INSERT INTO director (director_name,director_facebook) VALUES(%s, %s) on conflict (director_name) DO NOTHING", (row[1], row[4])
        )
conn.commit()
'''


#INSERT DATA INTO movie TABLE
with open('movie_data.csv','r') as f:
    reader = csv.reader(f)
    next(reader) # skip the headr row
    for row in reader:
        cur.execute(
            "INSERT INTO movie (director_id, num_critic_for_reviews, \
            duration, movie_title, imdb_score ) \
            VALUES((SELECT director_id from director WHERE director.director_name= %s) , %s, %s, %s, %s)", (row[1], row[2], row[3], row[5], row[6])
        )
conn.commit()

      