function [FeatureMatrix] = prepare_for_regression(InitialMatrix)
    [m, n] = size(InitialMatrix);
    FeatureMatrix = [];

    for i = 1:m
        row = [];
        for j = 1:n
            elem = InitialMatrix{i, j};

            if isnumeric(elem)
                row = [row, elem];
            else
                switch elem
                    case 'yes'
                        row = [row, 1];
                    case 'no'
                        row = [row, 0];
                    case 'semi-furnished'
                        row = [row, 1, 0];
                    case 'unfurnished'
                        row = [row, 0, 1];
                    case 'furnished'
                        row = [row, 0, 0];
                    otherwise
                        error('Valoare necunoscută: %s', elem);
                end
            end
        end

        FeatureMatrix = [FeatureMatrix; row];
    end
end

