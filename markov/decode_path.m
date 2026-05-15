function [decoded_path] = decode_path(path, lines, cols)
    % Scoatem eventual WIN/LOSE daca apar
    max_cell_index = lines * cols;
    path = path(path <= max_cell_index);

    decoded_path = zeros(length(path), 2);
    for i = 1:length(path)
        idx = path(i);
        row = floor((idx - 1) / cols) + 1;
        col = mod(idx - 1, cols) + 1;
        decoded_path(i, :) = [row, col];
    end
end

