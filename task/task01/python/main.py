import numpy as np
import random
from do_not_open_it import fun_check_win, fun_cy_ttt_bot


# (TODO) YOU NEED TO DESIGN YOUR OWN 'fun_my_ttt_bot' FUNCTION!
def fun_my_ttt_bot(mat2d):
    valid_loc = np.argwhere(mat2d == 0)
    return valid_loc[np.random.choice(valid_loc.shape[0])]


# random tic-tac-toe bot
def fun_rand_ttt_bot(mat2d):
    valid_loc = np.argwhere(mat2d == 0)
    return valid_loc[np.random.choice(valid_loc.shape[0])]


#==============================================
# Q3. Tic-Tac-Toe: Beating a random bot
#==============================================
def run_q3():
    n_iter = 10000

    who_win = np.zeros((n_iter, 1), dtype=int)
    for ii in range(n_iter):
        mat2d_t = np.zeros((3, 3), dtype=int)

        who_first = random.choice([True, False])  # random a bool value

        if who_first:
            fp, sp = fun_my_ttt_bot, fun_rand_ttt_bot  # Player 1 first
            val = [-1, 1]
        else:
            fp, sp = fun_rand_ttt_bot, fun_my_ttt_bot  # Player 2 first
            val = [1, -1]

        while True:
            loc_fp = fp(mat2d_t)
            msg = 'Unable to overwrite yours on existing markers'
            assert mat2d_t[tuple(loc_fp)] == 0, msg

            # first player
            mat2d_t[tuple(loc_fp)] = val[0]
            if fun_check_win(mat2d_t) != 0:
                who_win[ii] = fun_check_win(mat2d_t)
                break
            elif np.all(mat2d_t.flatten()):
                who_win[ii] = 0
                break

            loc_sp = sp(mat2d_t)
            msg = 'Unable to overwrite yours on existing markers'
            assert mat2d_t[tuple(loc_sp)] == 0, msg

            # second player
            mat2d_t[tuple(loc_sp)] = val[1]
            if fun_check_win(mat2d_t) != 0:
                who_win[ii] = fun_check_win(mat2d_t)
                break
            elif np.all(mat2d_t.flatten()):
                who_win[ii] = 0
                break

    draw_rate = np.sum(who_win == 0) / n_iter
    win_rate1 = np.sum(who_win == 1) / n_iter
    win_rate2 = np.sum(who_win == 2) / n_iter

    print('Q3. Tic-Tac-Toe: Beating a random bot')
    print("A draw rate is %f %%." % draw_rate)
    print("Winning rate for Player 1 is %f %%." % win_rate1)
    print("Winning rate for Player 2 is %f %%." % win_rate2)
    print("Congrats! Player %d wins." % ((win_rate1 < win_rate2) + 1))
    print();print()

#==============================================
# Q4. Tic-Tac-Toe: Beating a CY bot
#==============================================
def run_q4():

    n_iter = 10000

    who_win = np.zeros((n_iter, 1), dtype=int)
    for ii in range(n_iter):
        mat2d_t = np.zeros((3, 3), dtype=int)

        who_first = random.choice([True, False])  # random a bool value

        if who_first:
            fp, sp = fun_my_ttt_bot, fun_cy_ttt_bot  # Player 1 first
            val = [-1, 1]
        else:
            fp, sp = fun_cy_ttt_bot, fun_my_ttt_bot  # Player 2 first
            val = [1, -1]

        while True:
            loc_fp = fp(mat2d_t)
            msg = 'Unable to overwrite yours on existing markers'
            assert mat2d_t[tuple(loc_fp)] == 0, msg

            # first player
            mat2d_t[tuple(loc_fp)] = val[0]
            if fun_check_win(mat2d_t) != 0:
                who_win[ii] = fun_check_win(mat2d_t)
                break
            elif np.all(mat2d_t.flatten()):
                who_win[ii] = 0
                break

            loc_sp = sp(mat2d_t)
            msg = 'Unable to overwrite yours on existing markers'
            assert mat2d_t[tuple(loc_sp)] == 0, msg

            # second player
            mat2d_t[tuple(loc_sp)] = val[1]
            if fun_check_win(mat2d_t) != 0:
                who_win[ii] = fun_check_win(mat2d_t)
                break
            elif np.all(mat2d_t.flatten()):
                who_win[ii] = 0
                break

    draw_rate = np.sum(who_win == 0)/n_iter
    win_rate1 = np.sum(who_win == 1)/n_iter
    win_rate2 = np.sum(who_win == 2)/n_iter

    print('Q4. Tic-Tac-Toe: Beating a CY bot')
    print("A draw rate is %f %%." % draw_rate)
    print("Winning rate for Player 1 is %f %%." % win_rate1)
    print("Winning rate for Player 2 is %f %%." % win_rate2)
    print("Congrats! Player %d wins." % ((win_rate1 < win_rate2) + 1))

if __name__ == '__main__':
    run_q3()
    run_q4()

