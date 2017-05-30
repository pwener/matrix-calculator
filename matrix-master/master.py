import sys
import requests

REPOSITORY_URL = 'http://localhost:3000/repository/pair_in/'

def read_matrix(matrix_file):
    f = open(matrix_file, 'r')
    lines = [map(int, line.strip().split(' ')) for line in f if line.strip() != '\n']
    lines = [list(l) for l in lines]

    return lines


def print_matrix(M):
    [print(element) for element in M]


# Create pairs to multiply AxB
def create_pairs_with(A, B):
    # B[0] or A is the order
    order = len(B[0])

    for index, line in enumerate(A):
        # set converts [] to {}
        repo_request('A'+str(index), set(line))

    for index in range(order):
        column = [c[index] for c in B]
        repo_request('B'+str(index), set(column))


def repo_request(key, value):
    # repr converts code to string
    r = requests.post(REPOSITORY_URL + repr(key) + '/' + repr(value))


if __name__ == '__main__':
    try:
        # Name of matrix A and B
        filenameA = sys.argv[1]
        filenameB = sys.argv[2]

        A = read_matrix(filenameA)
        B = read_matrix(filenameB)

        create_pairs_with(A, B)

        R = [[0 for x in range(len(A))] for y in range(len(B[0]))]

    except ValueError:
        print("Ops! You need run: python3 master.py <filenameA> <filenameB>")
