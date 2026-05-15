function [Y, InitialMatrix] = parse_data_set_file(file_path)
    fid = fopen(file_path, 'r');
    if fid == -1
        error('Eroare la deschiderea fisierului.');
    end
    dims = textscan(fid, '%d %d', 1);
    m = dims{1};
    n = dims{2};
    Y = zeros(m, 1);
    InitialMatrix = cell(m, n);
    for i = 1:m
        line = fgetl(fid);
        tokens = strsplit(strtrim(line));
        Y(i) = str2double(tokens{1});
        for j = 1:n
            token = strtrim(tokens{j+1}); % eliminam spatii
            value = str2double(token);
            if isnan(value)
                InitialMatrix{i,j} = token; % e text
            else
                InitialMatrix{i,j} = value; % e numar
            end
        end
    end

    fclose(fid);
end

