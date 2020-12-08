deltar = 5;
R = 1001;
n = 199;
A = zeros(n+1,n+1);


for i = 1:n+1           %Matrix A vullen
    for j = 1:n+1
        if i == 1
            if i == j
                A(i, j) = (-2*r(1/2, deltar))/(deltar^2);
            elseif abs(i-j) == 1
                A(i, j) = (2*r(1/2, deltar))/(deltar^2);
            else
                A(i, j) = 0;
            end
        end
        if i ~= 1
            if i == j
                A(i, j) = -2/(deltar^2);
            elseif i-j == 1
                A(i, j) = (r(i-(3/2), deltar)/r(i-1, deltar))/(deltar^2);
            elseif i-j == -1
                A(i, j) = (r(i-(1/2), deltar)/r(i-1, deltar))/(deltar^2);
            else
                A(i, j) = 0;
            end
        end
    end
end
F = zeros(n+1,1);        %Vector F vullen
F(1) = F(1) - (2/deltar);
U = A\F;                     %Vector U oplossen
P = zeros(n+1,1);
X = zeros(n+1,1);

for i = 1:n+1
    X(i) = 1 + (i-1)*deltar;
    P(i) = log(abs(R)) - log(r(i-1, deltar));   %analytische oplossing
end
plot(X,U);      %plot
hold on
plot(X,P);


function f = r(j, deltar)
    f = 1+j*deltar;
end