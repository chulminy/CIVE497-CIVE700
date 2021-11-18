import numpy as np
import random


def fun_check_win(mat2d):
    n = -3
    is_win_p1 = np.any(np.sum(mat2d, 0) == n) or np.any(np.sum(mat2d, 1) == n)
    is_win_p1 = is_win_p1 or np.any(np.sum(np.diag(mat2d)) == n) or np.any(np.sum(np.diag(np.fliplr(mat2d))) == n)

    n = 3
    is_win_p2 = np.any(np.sum(mat2d, 0) == n) or np.any(np.sum(mat2d, 1) == n)
    is_win_p2 = is_win_p2 or np.any(np.sum(np.diag(mat2d)) == n) or np.any(np.sum(np.diag(np.fliplr(mat2d))) == n)

    if is_win_p1:
        winner = 1
    elif is_win_p2:
        winner = 2
    else:
        winner = 0

    return winner


def fun_find_win_shot(mat2d, ply_num):

    test_loc = np.argwhere(mat2d == 0)

    val = -1 * (ply_num == 1) + (ply_num == 2)

    win_loc = []
    for loc in test_loc:
        mat2d_test = np.copy(mat2d)
        mat2d_test[tuple(loc)] = val
        winner = fun_check_win(mat2d_test)

        if winner == ply_num:
            win_loc.append(loc)

    return np.array(win_loc)


def fun_cy_ttt_bot(mat2d):

    # winning shot
    win_loc = fun_find_win_shot(mat2d, 2)
    if win_loc.size != 0:
        return win_loc[0]

    # defending shot
    win_loc = fun_find_win_shot(mat2d, 1)
    if win_loc.size != 0:
        return win_loc[0]

    # placing a marker in a better random position
    test_loc = np.argwhere(mat2d == 0)

    loc_corner = np.array([[0, 0], [0, 2], [2, 0], [2, 2]])
    idx_0 = np.argwhere(mat2d[loc_corner[:, 0], loc_corner[:, 1]] == 0)

    if [1, 1] in test_loc.tolist():
        return np.array([1, 1])
    elif idx_0.size != 0:
        return loc_corner[idx_0[0][0]]
    else:
        return test_loc[0]