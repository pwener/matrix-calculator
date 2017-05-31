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


def repo_request(key, value):
    # repr converts code to string
    r = requests.post(REPOSITORY_URL + key + '/' + value)


def to_hash(arr):
    final_hash = '{'

    for element in arr:
        final_hash += str(element) + ','

    # [-1] removes last ','
    final_hash = final_hash[:-1] + '}'

    return final_hash



def create_pairs_with_lines(A):
    for index, line in enumerate(A):
        # set converts [] to {}
        repo_request('A'+str(index), to_hash(line))


def create_pairs_with_columns(B):
    # B[0] or A is the order
    order = len(B[0])

    for index in range(order):
        column = [c[index] for c in B]
        repo_request('B'+str(index), to_hash(column))


if __name__ == '__main__':
    try:
        # Name of matrix A and B
        filename = sys.argv[1]
        option = sys.argv[2]

        matrix = read_matrix(filename)

        if option == 'A':
            for i in range(len(matrix)):
                create_pairs_with_lines(matrix)
        elif option == 'B':
            for i in range(len(matrix)):
                create_pairs_with_columns(matrix)
        else:
            print("Invalid, type A or B has second argument...")

    except ValueError:
        print("Ops! You need run: python3 master.py <filenameA> <A or B>")
