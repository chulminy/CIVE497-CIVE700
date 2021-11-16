% sum 1 to 10 and assign its value to A
A = 1+2+3+4+5+6+7+8+9+10

A = 0;
for ii=1:10
    A = A + ii;
end
A 

A = (1+10)*10/2

A = sum([1:10])

syms a
A = symsum(a, a, 1, 10)

