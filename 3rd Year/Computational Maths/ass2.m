function [L, U] = LUdecompgauss(A)
    % Get m * n dimensions
    [m, n] = size(A);

    if (m~=n)
        disp("Matrix is not square!");
    end
    % Set up for LU decomposition
    L = zeros(m);
    for i = 1:m
        L(i, i) = 1;
    end
    U = A;

    d = 1;
    for i = 1:m
        for j = 1:n
            if i == j
                tmp = d
                while tmp < m
                    tmp = tmp + 1;
                    const = U(tmp, j) / U(i, j);
                    for x = 1:m
                        U(tmp, x) = U(tmp, x) - (const * U(i, x));
                    end
                    L(tmp, j) = const
                end
            end
        end
        d = d + 1
    end

    disp(L);
    disp(U);


% 5.17
A = [
    0,0,0,1,0,0;
    1,0,1,0,1,1;
    0,1,0,0,1,0;
    1,1,0,0,1,0;
    1,1,1,0,0,1;
    1,0,0,0,1,0
];

[X, Y] = eig(A);
disp(X);
disp(Y);