function [path] = heuristic_greedy(start_position, probabilities, Adj)
    n = size(Adj, 1); % Numar total de stari (inclusiv WIN si LOSE)

    visited = false(n, 1); % Marcam zonele vizitate
    path = start_position; % Initializam drumul cu pozitia de start
    visited(start_position) = true;

    while ~isempty(path)
        position = path(end);

        if position == n - 1 % WIN este penultima stare (n-1)
            return;
        end

        neighbors = find(Adj(position, :) == 1);
        neighbors = neighbors(~visited(neighbors));

        if isempty(neighbors)
            path(end) = [];
        else
            [~, idx] = max(probabilities(neighbors));
            next_position = neighbors(idx);
            % Marcam si adaugam la drum
            visited(next_position) = true;
            path(end+1) = next_position;
        end
    end
end

