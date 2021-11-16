# MATLAB Tutorial Model Solutions

- [**Candy Store: Array Operation (★★)**](#sol1)
- [**Co-op Decisions (★★★★)**](#sol2)
- [**Most Nonzero Element Row (★★)**](#sol3) 
- [**Zeros into a Vector (★★)**](#sol4)
- [**Word Score (★★★)**](#sol5)


***Please do not click the link unless you have your own solutions.*** 


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>






















## Sol1
```matlab
card_num_all = randi(10, 3000, 10)-1; % a 3000 x 10 matrix and its elements are generated from 0 to 9. 

cond1 = card_num_all(:,3) == 3;
cond2 = card_num_all(:,5) == 3;
idx_rs = and(cond1, cond2);
num_priz_rs = sum(idx_rs); % number of prize receivers
```
## Sol2
```matlab
salary = randi([12 25],7,1);
daily_comm = randi([0 60],7,1);
liv_costs = [100 300 490 600 700 200 800]'; liv_costs = liv_costs(randperm(7,7));
qual_exp = randperm(10,7)'; 
prev_rat = [1 7 8 9 2 10 8]'; prev_rat = prev_rat(randperm(7,7));
dist_home = randi([30 500],7,1);
coop_factors = [salary, daily_comm, liv_costs, qual_exp, prev_rat, dist_home]; % commas for readabilty
clearvars salary daily_comm liv_costs qual_exp prev_rat dist_home

% (a) 
dh = coop_factors(:,6);
logi_300 = dh < 300;
dh_300 = find(logi_300);

% (b) 
[~, max_best_emp] = max(coop_factors);
[~, min_best_emp] = min(coop_factors);
best_factors_emp = [max_best_emp([1 4 5]) min_best_emp([2 3 6])];
best_emp = mode(best_factors_emp);

% (c)
lc = coop_factors(:,3);
logi_500 = lc < 500;
sal = coop_factors(:,1);
sal_500 = sal(logi_500);
liv_500 = max(sal_500);

% (d)
psr = coop_factors(:,5);
logi_psr = psr >= 7;
sal = coop_factors(:,1);
sal_psr = sal(logi_psr);
avg_sal = mean(sal_psr);

```

## Sol3
```matlab
n = randi(25);
mat2d = randi(5, 1, n*n)-1;
mat2d = reshape(mat2d,n,n); %  a nxn randomly generated matrix with elements ranging from 0 to 4
row_idx = MostNnzRow(mat2d);

% Please design your function: MostNnzRow

function id_row = MostNnzRow(mat2d)
logi_mat = (mat2d ~= 0);
sum_row = sum(logi_mat,2);
[~, id_row]= max(sum_row);
end

```

## Sol4
```matlab
test_vec = randi(100, 1, 30);
n = randi(10);

new_vec = InsertZeros(test_vec, n);

% please design a function called InsertZeros

function outvec = InsertZeros(vec, n)
nvec = numel(vec);
outvec = cat(1, vec, zeros(n, nvec));
outvec = outvec(:)';
end

```

## Sol5
```matlab
test_char_vec = 'Students in AEG121 is amazing!';
test_score = WordScore(test_char_vec);

% please design your function called WordScore


function score = WordScore(char_vec)
char_db = double(char_vec);
lgv = (97 <= char_db) & (char_db <= 122);
score = sum(char_db(lgv)-96);
end

% Noreen's sol

% function score = WordScore(char_vec)
% values = 1:26;
% num_char = zeros(1,26);
% alp_vec = char(97:122);
% 
% for ii = 1:numel(alp_vec)
%        num_char(ii) = count(char_vec, alp_vec(ii));
% end
% 
% score = sum(num_char.*values);
% 
% end
```
