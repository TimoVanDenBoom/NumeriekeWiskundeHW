endt = 10^6;
deltat = 10^3;
deltar = 5;
R = 1001;
n = 199;

A = zeros(n+1,n+1);
B = eye(n+1);           %identiteitsmatrix

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

C = B - deltat.*A;

W0 = zeros(n+1,1);              %druk vector
Wbar = zeros(endt/deltat,1);    %gemiddelde druk
T = zeros(endt/deltat,1);       %tijdsas 
sum = 0;
BG = zeros(endt/deltat,1);      %druk boorgat

%Backward Euler
for i = 1:(endt/deltat)
    W0(1) = W0(1) + deltat*(2/deltar);
    W0 = C\W0;
    for k = 1:n
        sum = sum + W0(k)*r(k-1, deltar) + W0(k+1)*r(k, deltar);
    end
    Wbar(i) = (deltar/((R^2)-1))*sum; %herhaalde trapezium regel
    T(i) = i*deltat; 
    BG(i) = W0(1);
    sum = 0;
end

%plot(T, Wbar);
hold on
plot(T, BG);
hold on
function f = r(j, deltar)
    f = 1+j*deltar;
end