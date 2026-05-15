function [Adj] = get_adjacency_matrix(Labyrinth)
    [m, n] = size(Labyrinth);
    nr_cells = m * n;
    total_states = nr_cells + 2;
    Adj = sparse(total_states, total_states);

    for i = 1:m
        for j = 1:n
            current = (i - 1) * n + j;
            walls = Labyrinth(i, j);
            if i > 1 && bitget(walls, 4) == 0
                up = (i - 2) * n + j;
                Adj(current, up) = 1;
            end
            if i < m && bitget(walls, 3) == 0
                down = i * n + j;
                Adj(current, down) = 1;
            end
            if j < n && bitget(walls, 2) == 0
                right = (i - 1) * n + (j + 1);
                Adj(current, right) = 1;
            end
            if j > 1 && bitget(walls, 1) == 0
                left = (i - 1) * n + (j - 1);
                Adj(current, left) = 1;
            end
            if i == 1 && bitget(walls, 4) == 0
                Adj(current, nr_cells + 1) = 1; % WIN
            elseif i == m && bitget(walls, 3) == 0
                Adj(current, nr_cells + 1) = 1; % WIN
            elseif (j == 1 && bitget(walls, 1) == 0)
                Adj(current, nr_cells + 2) = 1; % LOSE
            elseif (j == n && bitget(walls, 2) == 0)
                Adj(current, nr_cells + 2) = 1; % LOSE
            end
        end
    end
    Adj(nr_cells + 1, nr_cells + 1) = 1;
    Adj(nr_cells + 2, nr_cells + 2) = 1;
end

