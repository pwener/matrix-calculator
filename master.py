import requests
import numpy as np

def read_matrix(matrix_file):
    f = open(matrix_file, 'r')
    lines = [map(int, line.split(' ')) for line in f if line.strip() != '\n']
    lines = [list(l) for l in lines]
    return lines

url = 'http://127.0.0.1:3000/reposytory'
A = read_matrix('input/A.matrix')
B = read_matrix('input/B.matrix')

print(A)
print(B)
def find_line_i(i, matrix):
    array_line = []
    matrix = np.array(matrix)
    for j in range(matrix.shape[1]):
        array_line.append(matrix[i,j])
    return array_line

def find_column_i(i, matrix):
    array_column = []
    matrix = np.array(matrix)
    for j in range(matrix.shape[0]):
        array_column.append(matrix[j,i])
    return array_column

def mount_json_data():
    A = read_matrix('input/A.matrix')
    B = read_matrix('input/B.matrix')
    for i in range(np.array(A).shape[1]):
        line = find_line_i(i,A)
        column = find_column_i(i,B)
        line_column_correspond = []

        value_A = "A"+str(i)
        value_B = "B"+str(i)

        payload = {}
        payload[value_A] = line
        r = requests.post(url, data=payload)
        print(r)
        print(payload)

        payload = {}
        payload[value_B] = column
        r = requests.post(url, data=payload)
        print(r)
        print(payload)


mount_json_data()
