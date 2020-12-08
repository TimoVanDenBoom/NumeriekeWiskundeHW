h = 1;

for i = 1:5
    Q = (-(1/3)*exp(h)-(1/2)+exp(-h)-(1/6)*exp(-2*h))/h;    %formule a
    error = abs(Q+1);                           %fout: |Q-(-e^(-0))|
    disp(h);
    disp(Q);
    disp(error);
    h = h/2;
end
