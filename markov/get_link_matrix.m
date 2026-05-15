function [Link] = get_link_matrix(Labyrinth)
    [m, n] = size(Labyrinth);
    nr_cells = m * n;
    total_states = nr_cells + 2;
    Link = sparse(total_states, total_states);

    for i = 1:m
        for j = 1:n
            current = (i - 1) * n + j;
            walls = Labyrinth(i, j);
            neighbors = [];
            if i > 1 && bitget(walls, 4) == 0
                neighbors(end+1) = (i-2)*n + j;
            end
            if i < m && bitget(walls, 3) == 0
                neighbors(end+1) = i*n + j;
            end
            if j < n && bitget(walls, 2) == 0
                neighbors(end+1) = (i-1)*n + (j+1);
            end
            if j > 1 && bitget(walls, 1) == 0
                neighbors(end+1) = (i-1)*n + (j-1);
            end

            if (i == 1 && bitget(walls, 4) == 0) || (i == m && bitget(walls, 3) == 0)
                neighbors(end+1) = nr_cells + 1; % WIN
            end
            if (j == 1 && bitget(walls, 1) == 0) || (j == n && bitget(walls, 2) == 0)
                neighbors(end+1) = nr_cells + 2; % LOSE
            end
            num_neighbors = length(neighbors);
            for k = 1:num_neighbors
                Link(current, neighbors(k)) = 1 / num_neighbors;
            end
        end
    end
    Link(nr_cells + 1, nr_cells + 1) = 1;
    Link(nr_cells + 2, nr_cells + 2) = 1;
end

