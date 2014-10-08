
def transpose_list_of_lists(mat):
    """
        input:  list of X lists with Y items
        output: list of Y lists with X items
    """
    X = len(mat)
    Ys = [len(row) for row in mat]
    if len(set(Ys)) != 1:
        raise RuntimeError('needed matrix, got lists of varying length')
    Y = Ys[0]
    outmat = []
    for j in range(Y):
        newrow = []
        for i in range(X):
            newrow.append(mat[i][j])
        outmat.append(newrow)
    return outmat
