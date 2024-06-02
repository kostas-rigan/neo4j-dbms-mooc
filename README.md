# neo4j-dbms-mooc

This is the fourth assingment of the Big Data Management Systems course in the Department of Management Science and Technology AUEB.

# Contents
- [neo4j-dbms-mooc](#neo4j-dbms-mooc)
- [Contents](#contents)
- [Authors](#authors)
- [Guidelines](#guidelines)
- [Description](#description)

# Authors<a class="anchor" id="Authors"></a>
> Konstantinos Riganas, Student<br />
> Department of Management Science and Technology <br />
> Athens University of Economics and Business <br />
> t8200145@aueb.gr

> Nikolaos Nikolaidis, Student<br />
> Department of Management Science and Technology <br />
> Athens University of Economics and Business <br />
> t8200120@aueb.gr

# Guidelines
Make sure that you have the following dependencies in Python:
* pandas
* neo4j

You can also install either Neo4j Desktop or use AuraDB if you want to.

You also need a local `config` file to store your `uri`, `username`, and `password`. The correct format of the file is:
```
uri||<your_uri>
username||<your_username>
password||<your_password>
```

After setting up your system, run the following command:
```
python inserter.py
```

This will populate your Neo4j database with the MOOC data. **Note**: If you run the program locally please confirm you Neo4j database is up and running.

If you already have the data or you populated your database with the previous command, run the following program that executes the queries.
```
python cypher.py
```

This will print each task, with its corresponding query, the number of rows returned, the first 10 results (if more than 10, otherwise all), and the time it took to execute the query in seconds.

# Description
**Tasks**:
1. Show a small portion of your graph database (screenshot)
2. Count all users, count all targets, count all actions
3. Show all actions (actionID) and targets (targetID) of a specific user (choose one)
4. For each user, count his/her actions
5. For each target, count how many users have done this target
6. Count the average actions per user
7. Show the userID and the targetID, if the action has positive Feature2
8. For each targetID, count the actions with label “1”

Task 1 result is the screenshot of the file [network_snapshot.png](network_snapshot.png) and shows a portion of the graph.

The rest of the tasks are included in the 2 query files. [queries.cypher](queries.cypher) contains the queries in cypher format, without any quote marks, while [queries.json](queries.json) contains the queries and tasks in JSON format to make the program [cypher.py](cypher.py) easier to read and maintain. A note for task 3, 42 is the user id chosen.