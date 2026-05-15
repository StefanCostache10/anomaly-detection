function [J] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
    m = length(Y); % numar de exemple
    X = [ones(m, 1), FeatureMatrix];
    predictions = X * Theta;
    errors = predictions - Y;
    J = (1/(2*m)) * (errors' * errors);
end

