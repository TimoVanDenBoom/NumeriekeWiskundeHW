h = 1;

for i = 1:8
    Q = (cos((1/2) - h)-2*cos((1/2))+cos((1/2) + h))/h^2;
    error = abs(Q+cos((1/2)));
    disp(i);
    disp(Q);
    disp(error);
    h = h/10;
end
