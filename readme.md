# Database Implementation 
## Class Database Postgres Testing `class_database`
* Trigger created for credits database, when inserting new students from students.csv. The Trigger will update 
``` 
credit_hours,hours_taken,gpt,honors_pts 

```
* Trigger will also check if gpa is below a 2.0 then will put the Student Id into a probation table
* Also checks to see if a student enters a new grade is entered, checks to see if student already recieved credit for such class
## Coffee Database `coffee_datase`
* information on coffee drinkers, script was initially parsed from `drinks.txt` `serves.txt` and `Visits.txt` 
* running app.js initiates a web server that lets you add to the coffee db
* serves index.html with form that adds a new person
* 
## Game Stats Database `sport_team_database`
* trigger that handle a new game query, involving two teams, checks to see who won, and of the two adds wins losses to the standings table team1 team2 both get updated with either a new loss tie or win
