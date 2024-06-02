import time
from neo4j import GraphDatabase
import json

# Make sure you have a configuration file named config in the format field||value in each line
with open('config', 'r') as f:
    uri = f.readline().strip().split('||')[1]
    username = f.readline().strip().split('||')[1]
    password = f.readline().strip().split('||')[1]

with open('queries.json') as f:
    queries = json.load(f)

driver = GraphDatabase.driver(uri, auth=(username, password))

with driver.session() as session:
    for i, query in enumerate(queries):
        print(f' Query {i} '.center(42, '*'))
        print(f'Task: {query["task"]}')
        print(f'Query: {query["query"]}')
        start = time.time()
        result = session.run(query['query'])
        stop = time.time()
        result_df = result.to_df()
        print(f'Returned {result_df.shape[0]} rows')
        print(f'Results:\n{result_df.head(10)}')
        print(f'Query Execution Time: {stop - start} seconds\n')

driver.close()