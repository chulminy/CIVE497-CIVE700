A = [1 1 1 -6; 2 3 1 -19; 3 2 3 -16];

[U, S, V] = svd(A);


disp(A)
disp(U*S*V')

size(U)
size(S)
size(V)

S

u1 = U(:,1)
u2 = U(:,2)
u3 = U(:,3)

dot(u1, u2)
dot(u1, u3)
dot(u2, u3)

norm(u1)
norm(u2)
norm(u3)

v1 = V(:,1)'
v2 = V(:,2)'
v3 = V(:,3)'


dot(v1, v2)
dot(v1, v3)
dot(v2, v3)


norm(v1)
norm(v2)
norm(v3)

disp(U*S)

[u1*S(1,1) u2*S(2,2) u3*S(3,3)]

a1 = u1*S(1,1)*v1 
a2 = u2*S(2,2)*v2
a3 = u3*S(3,3)*v3

fprintf('-------------------\n')
display(a1+a2+a3)
display(A)

display(a1*v3')
display(a2*v3')
display(a3*v3')




