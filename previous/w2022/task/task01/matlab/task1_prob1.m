clc; clear;

run_q3
run_q4

% (TODO) YOU NEED TO DESIGN YOUR OWN 'fun_my_ttt_bot' FUNCTION!
function loc = fun_my_ttt_bot(mat2d)
valid_loc = find(mat2d(:)==0);
loc = valid_loc(randperm(numel(valid_loc),1));
end

%==============================================
% Q3. Tic-Tac-Toe: Beating a random bot
%==============================================
function run_q3

n_iter = 10000;

who_win = zeros(n_iter,1);
for ii=1:n_iter
    
    mat2d = zeros(3,3);
    who_first = rand>0.5; % randomly pick the first player
    
    if who_first
        fp = @fun_my_ttt_bot; % first player
        sp = @fun_rand_ttt_bot; % second player
        val = [-1 1]; 
    else
        fp = @fun_rand_ttt_bot; % first player
        sp = @fun_my_ttt_bot; % second player
        val = [1 -1];
    end
    
    while true
        loc_fp = fp(mat2d);
        msg = 'Unable to overwrite yours on exsting markers';
        assert(mat2d(loc_fp) == 0, msg)
        mat2d(loc_fp) = val(1);
        
        if fun_check_win(mat2d)~=0
           who_win(ii) = fun_check_win(mat2d); 
           break
        elseif all(mat2d(:))
           who_win(ii) = 0;
           break
        end

        loc_sp = sp(mat2d); 
        assert(mat2d(loc_sp) == 0, msg)
        mat2d(loc_sp) = val(2);

        if fun_check_win(mat2d)~=0
           who_win(ii) = fun_check_win(mat2d); 
           break
        elseif all(mat2d(:))
           who_win(ii) = 0;
           break
        end
    end
end

draw_rate = sum(who_win==0)/n_iter;
win_rate1 = sum(who_win==1)/n_iter;
win_rate2 = sum(who_win==2)/n_iter;
fprintf('Q3. Tic-Tac-Toe: Beating a random bot \n')
fprintf('A draw rate is %f %%. \n', draw_rate)
fprintf('Winning rate for Player 1 is %f %%. \n', win_rate1)
fprintf('Winning rate for Player 2 is %f %%. \n', win_rate2)
fprintf('Congrats! Player %d wins. \n' , (win_rate1<win_rate2)+1)
fprintf('\n');fprintf('\n');
end

%==============================================
% Q4. Tic-Tac-Toe: Beating a CY bot
%==============================================

function run_q4

n_iter = 10000;

who_win = zeros(n_iter,1);
for ii=1:n_iter
    
    mat2d = zeros(3,3);
    who_first = rand>0.5; % randomly pick the first player
    
    if who_first
        fp = @fun_my_ttt_bot; % first player
        sp = @fun_cy_ttt_bot; % second player
        val = [-1 1]; 
    else
        fp = @fun_cy_ttt_bot; % first player
        sp = @fun_my_ttt_bot; % second player
        val = [1 -1];
    end
    
    while true
        loc_fp = fp(mat2d);
        msg = 'Unable to overwrite yours on exsting markers';
        assert(mat2d(loc_fp) == 0, msg)
        mat2d(loc_fp) = val(1);
        
        if fun_check_win(mat2d)~=0
           who_win(ii) = fun_check_win(mat2d); 
           break
        elseif all(mat2d(:))
           who_win(ii) = 0;
           break
        end

        loc_sp = sp(mat2d); 
        assert(mat2d(loc_sp) == 0, msg)
        mat2d(loc_sp) = val(2);

        if fun_check_win(mat2d)~=0
           who_win(ii) = fun_check_win(mat2d); 
           break
        elseif all(mat2d(:))
           who_win(ii) = 0;
           break
        end
    end
end

draw_rate = sum(who_win==0)/n_iter;
win_rate1 = sum(who_win==1)/n_iter;
win_rate2 = sum(who_win==2)/n_iter;
fprintf('Q4. Tic-Tac-Toe: Beating a CY bot  \n')
fprintf('A draw rate is %f %%. \n', draw_rate)
fprintf('Winning rate for Player 1 is %f %%. \n', win_rate1)
fprintf('Winning rate for Player 2 is %f %%. \n', win_rate2)
fprintf('Congrats! Player %d wins. \n' , (win_rate1<win_rate2)+1)
end

% This is random bot
function loc = fun_rand_ttt_bot(mat2d)
valid_loc = find(mat2d(:)==0);
loc = valid_loc(randperm(numel(valid_loc),1));
end



