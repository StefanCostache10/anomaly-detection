function [Labyrinth] = parse_labyrinth(file_path)

    fid = fopen(file_path, "r");
    if fid == -1
        error('Eroare la deschiderea fisierului.');
    end

    dims = fscanf(fid, '%d', 2);
    m = dims(1);
    n = dims(2);
    Labyrinth = zeros(m, n);

    for i = 1:m
        row = fscanf(fid, '%d', n);
        Labyrinth(i, :) = row;
    end
    fclose(fid);
end

