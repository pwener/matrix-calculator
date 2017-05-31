import urllib
import requests
import simplejson as json
import ast
import sys

def multiply(A, B):
    # The new line have this size too
    size = len(A)

    R = 0

    # Example [1, 2, 3] and column [1, 2, 3] where R is result
    # R = 1 * 1 + 2 * 2 + 3 * 3
    for i in range(len(A)):
        # append all elements multiplying
        R += A[i] * B[i]

    return R

def set_to_array(x):
    return x.replace('{', '[').replace('}', ']')

if __name__ == '__main__':
    order = int(sys.argv[1])

    task_dir = None

    for i in range(0, order):
        for j in range(0, order):
            try:
                key = str(i) + 'x' + str(j)
                get_task = urllib.request.urlopen("http://localhost:3000/repository/pair_out/"+key)
                task_json = get_task.read()
                task_dir = json.loads(task_json)
            except urllib.error.HTTPError:
                print("Item not avaliable, try next")
                break

            print(task_dir)

            # Ever the index 0 is A and 1 is B
            matrix_a = task_dir[0]
            matrix_b = task_dir[1]

            A = eval(set_to_array(matrix_a['content']))
            B = eval(set_to_array(matrix_b['content']))

            R = multiply(A, B)

            print(R)
