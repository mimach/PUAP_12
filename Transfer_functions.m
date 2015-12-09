clear all

T1 = [0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500 1000];
for i = 1:21;
    G1(i) = tf(1,[T1(i) 1],'InputDelay',1);
end

T2 = [0.01 0.02 0.05 0.1 0.2 0.3 0.5 0.7 1 1.3 1.5 2 4 6 8 10 20 50 100 200 500];
for i = 1:21;
    G2(i) = tf(1,[T2(i)*T2(i) 2*T2(i) 1],'InputDelay',1);
end

T3 = [0.005 0.01 0.02 0.05 0.1 0.2 0.5 2 5 10];
for i = 1:10;
    G3(i) = tf(1,[T3(i)*T3(i) T3(i)*T3(i) 2*T3(i) 1 1],'InputDelay',1);
end

n4 = [ 3 4 5 6 7 8];
for i = 1:6
    syms s;
    c = sym2poly((s+1)^n4(i));
    G4(i) = tf(1,c);
end

alfa5 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
for i = 1:9
    syms s
    c = sym2poly((1+s)*(1+alfa5(i)*s)*(1+alfa5(i)*alfa5(i)*s)*(1+alfa5(i)*alfa5(i)*alfa5(i)*s));
    G5(i) = tf(1,c);
end

L6 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:9;
    G6(i) = tf(1,[(1-L6(i)) 1 0],'InputDelay',L6(i));
end

T7 = [1 2 5 10];
L7 = [0.01 0.02 0.05 0.1 0.3 0.5 0.7 0.9 1];
for i = 1:4
    for j = 1:9
        G7(i, j) = tf(T7(i),[T7(i)*(1-L7(i)) T7(i)+(1-L7(i)) 1],'InputDelay',L6(i));
    end
end

alfa8 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1 1.1];
for i = 1:11;
    G8(i) = tf([-alfa8(i) 1], [1 3 3 1]);
end

T9 = [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1];
for i = 1:10
    syms s
    c = sym2poly((s+1)*((s*T9(i))*(s*T9(i)) + 1.4*s*T9(i) +1));
    G9(i) = tf(1,c);
end