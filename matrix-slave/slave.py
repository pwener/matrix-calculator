import urllib
import requests
import simplejson as json

get_task = urllib.request.urlopen("http://localhost:3000/repository/pair_out")
task_json = get_task.read()
task_dir = json.loads(task_json)

print(task_dir)
