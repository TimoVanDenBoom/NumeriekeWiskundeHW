h = 0.02;
N = 1/h;
A = zeros((N-1)^2,(N-1)^2);
for i = 1:(N-1)^2           %Matrix A vullen
    for j = 1:(N-1)^2
        if i == j
            A(i, j) = 4/h^2;
        elseif abs(i-j) == 1 && ~((mod(i-1,N-1) == 0 && mod(j-1,N-1) == N-2) || (mod(i-1,N-1) == N-2 && mod(j-1,N-1) == 0))
            A(i, j) = -1/h^2;
        elseif abs(i-j) == N-1
            A(i, j) = -1/h^2;
        else
            A(i, j) = 0;
        end
    end
end
F = ones((N-1)^2,1);        %Vector F vullen
U = A\F;                     %Vector U oplossen

u = reshape(U,N-1,N-1);
x = zeros(N-1,N-1);
y = zeros(N-1,N-1);

for i = 1:N-1
    for j = 1:N-1
        x(i,j) = j/N;
        y(i,j) = i/N;
    end
end

stem3(x,y,u,'MarkerFaceColor','g')  %Plot
    