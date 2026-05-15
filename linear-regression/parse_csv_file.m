function [Y, InitialMatrix] = parse_csv_file(file_path)
    fid = fopen(file_path, 'r');
    if fid == -1
        error('Eroare la deschiderea fisierului CSV.');
    end
    header_line = fgetl(fid);
    lines = {};
    while ~feof(fid)
        line = fgetl(fid);
        line = strtrim(line);
        if ~isempty(line)
            lines{end+1} = line;
        end
    end
    fclose(fid);
    m = length(lines);

    % Spargem prima linie de date sa aflam numarul de coloane
    tokens = strsplit(lines{1}, ',');
    n = length(tokens) - 1;

    % Initializam
    Y = zeros(m, 1);
    InitialMatrix = cell(m, n);

    for i = 1:m
        tokens = strsplit(lines{i}, ',');

        % Prima coloana e Y (pretul)
        Y(i) = str2double(strtrim(tokens{1}));
        for j = 1:n
            token = strtrim(tokens{j+1});
            value = str2double(token);
            if isnan(value)
                InitialMatrix{i,j} = token;
            else
                InitialMatrix{i,j} = value;
            end
        end
    end
end

