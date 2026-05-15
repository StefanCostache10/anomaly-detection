function [classes] = predict_classes(X, weights, input_layer_size, hidden_layer_size, output_layer_size)

  Theta1 = reshape(weights(1:hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, input_layer_size + 1);

  Theta2 = reshape(weights(hidden_layer_size * (input_layer_size + 1) + 1:end), ...
                   output_layer_size, hidden_layer_size + 1);

  m = size(X, 1); % numărul de exemple
  a1 = [ones(m, 1) X];
  z2 = a1 * Theta1';
  a2 = [ones(m, 1) sigmoid(z2)];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);

  [~, classes] = max(a3, [], 2);
end

function g = sigmoid(z)
  g = 1 ./ (1 + exp(-z));
end

