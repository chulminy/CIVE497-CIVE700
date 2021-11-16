function is_rank = your_fun(cards)

card_mat = zeros(4, 13);
card_mat(cards) = 1;
card_mat = [card_mat card_mat(:,1)];
logi_vec = logical(sum(card_mat));
conv_vec = conv(logi_vec, ones(1,5),'valid');

is_rank = any(conv_vec==5);
end



