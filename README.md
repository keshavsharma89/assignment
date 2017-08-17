# Solution Live URL http://13.126.226.6/Insly_Assignment/

# Assignment 1
Create a database structure to store employee information. The information stored is as follows:
Main data:
• Name
• Birthdate
• ID code / SSN
• Is a current employee (yes/no)
• Contact information (e-mail, phone, address)

The following information in English, Spanish and French:
• Introduction
• Previous work experience
• Education information

Log info:
• Who and when created the entry
• Who and when last modified the data

The information should be presented as an .sql file which can be imported into a MySQL database without errors.

#Assignment 2
Write a piece of code that:
• outputs an <ul> list of all integers in the range of 1-100
• in place of all numbers that are divisible by 3, outputs string “foo” instead
• in place of all numbers that are divisible by 5, outputs string “bar” instead
• for numbers that are divisible by both 3 and 5, outputs string “foobar” instead

#Assignment 3
Base data: worktime.php
Parameters $SETTINGS_nighttime_start and $SETTINGS_nighttime_end hold the start and end of nighttime hours.
The $EMPLOYEES array holds the employees and their shift start and end times.
All times are in the 24 hour HH:MM format. Times are with 15 minute precision (for
example, 15:00, 16:15, 17:30 are allowed values, whereas 18:02 and 19:41 are not).

The assignment:
Write a code that outputs a table or list of employees, containing the following information for each:
• name
• start and end time of their shift
• the length of their shift
• how much of the shift is daytime hours
• how much of the shift is nighttime hours
The results should be displayed with a 15 minute (0.25h) precision, both “x.25” and
“x:15” formats are allowed.
