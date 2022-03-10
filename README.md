# DB-Class-Taverns-Assignment
SQL DB Class 1 Tavern Assignment<br><br>
Create Script for database where a system can keep track of taverns.<br>
• Taverns need a name, floor count, owner (user) info, and location info.<br>
• Have users of the system and their roles kept track of, with description of roles.<br>
• Have supplies kept track of with supplies, units, cost; plus the taverns' inventory with tavern id, supply id, cost, quantity, and date received.<br>
• Have the name of services offered as well as the status of the service (for example "active" or "inactive", and can add or change status later).<br>
Should be seeded with around 5 to 10 rows of data each, and add repeated fields for normalization.<br>
*picture of diagram as reference was also added to visualize my thought process*<br>
<br><br><br>
SQL DB Class 2 Tavern Assignment
1. Completed the User story. There should be a way to track guests':<br>
• Names<br>
• Notes about them<br>
• Birthdays<br>
• Cakedays<br>
• Status<br>
• Levels<br>
   I also no longer want to track rats.<br>
2. Linked Supplies and have them be used in sales. Created a Supply Sales table to give us a way to make use of received supplies.<br>
3. Instead of adding Foreign Keys and Primary keys to a table on creation, used an Alter Table command to modify the table to add them to the Taverns and Users tables.<br>
4. Showed that there are constraints by making insertions or queries that will fail due to foreign key constraints.<br>
*3 and 4 will be commented out so script can still run as originally wrote*<br>
<br><br><br>
SQL DB Class 3 Tavern Assignment
1. Added tables to track rooms, which should have a status and an associated tavern; also to track room stays, which will contain a sale, guest, room, the date it was stayed in and the rate.
2. Wrote a querie that returns guests w/a birthday before 2000.
3. Wrote a query to return rooms that cost more than 100 gold a night.
4. Wrote a query that returns UNIQUE guest names.
5. Wrote a query that returns all guests ordered by name (ascending).
6. Wrote a query that returns the top 10 highest price sales.
7. Wrote a query to return all the values stored in all Lookup Tables.
8. Wrote a query that returns Guest Classes with Guest Levels, and Generates a new column with a label for their level grouping.
<br><br><br>
SQL DB Class 4 Tavern Assignment
1. Wrote a query to return users who have admin roles.
2. Wrote a query to return users who have admin roles and info about their taverns.
3. Wrote a query that returns all guests ordered by name (ascending) and their classes and corresponding levels.
4. Wrote a query that returns the top 10 sales in terms of sales price and what the services were.
5. Wrote a query that returns guests with 2 or more classes.
6. Wrote a query that returns guests with 2 or more classes with levels higher than 5
7. Wrote a query that returns guests with ONLY their highest level class.
8. Wrote a query that returns guests that stay within a date range.
<br>
*FYI: jpg diagram was not yet updated for SQL DB Class 2 Tavern Assignment as it was drawn by hand but will be made digital*
