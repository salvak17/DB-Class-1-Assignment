# DB-Class-Taverns-Assignment
SQL DB Class 1 Tavern Assignment<br>
Create Script for database where a system can keep track of taverns.<br>
• Taverns need a name, floor count, owner (user) info, and location info.<br>
• Have users of the system and their roles kept track of, with description of roles.<br>
• Have supplies kept track of with supplies, units, cost; plus the taverns' inventory with tavern id, supply id, cost, quantity, and date received.<br>
• Have the name of services offered as well as the status of the service (for example "active" or "inactive", and can add or change status later).<br>
Should be seeded with around 5 to 10 rows of data each, and add repeated fields for normalization.<br>
*picture of diagram as reference was also added to visualize my thought process*<br>
<br>
SQL DB Class 2 Tavern Assignment<br>
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
<br>
