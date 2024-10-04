# Install & Import MySQL connector: "pip install mysql-connector-python"
import mysql.connector

# Establish the connect to MySQL server
connection = mysql.connector.connect(
    host='localhost',
    user='root',
    password='cjsachs',
    database='students_db'
)

# Create a cursor object: Allows us to control our database
cursor = connection.cursor()

# check if connection was successful
if connection.is_connected():
    print('Successfully connected to database!')


# create a database
cursor.execute('CREATE DATABASE IF NOT EXISTS demo_db')

# verify database was created
cursor.execute('SHOW DATABASES')
for db in cursor:
    print(db)

# creating a new table
cursor.execute('''
    CREATE TABLE IF NOT EXISTS instructors (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50)
    )          
''')

# verify table was created
cursor.execute('SHOW TABLES')
for table in cursor:
    print(table)

# DML: Data Manipulation Language
query = '''
    INSERT INTO instructors (
        name
    ) VALUES (
        'Travis'
    )
'''

# perform the query
cursor.execute(query)

# commit/save changes to database
# connection.commit()

# DQL: Data Query Language
cursor.execute('''
    SELECT *
    FROM students
''')

# fetch all rows
rows = cursor.fetchall()
for row in rows:
    print(row)
    
# Update data in a table: Update an instructors name
cursor.execute('''
    UPDATE instructors
    SET name = 'sarah'
    WHERE id = 9           
''')

# save/commit changes to database
# connection.commit()

# Delete Data in a table: Delete an instructor
query = '''
   DELETE FROM instructors
   WHERE id = 2 
'''
cursor.execute(query)

# save/commit changes 
connection.commit()


# always remember to close cursor and connection at the bottom of script
cursor.close()
connection.close()