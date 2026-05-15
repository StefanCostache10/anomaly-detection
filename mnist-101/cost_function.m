function [J, grad] = cost_function(params, X, y, lambda, input_layer_size, hidden_layer_size, output_layer_size)

  Theta1 = reshape(params(1:hidden_layer_size * (input_layer_size + 1)), ...
                   hidden_layer_size, input_layer_size + 1);

  Theta2 = reshape(params(hidden_layer_size * (input_layer_size + 1) + 1:end), ...
                   output_layer_size, hidden_layer_size + 1);

  m = size(X, 1);
  J = 0;

  Y = eye(output_layer_size)(y, :);

  % Forward propagation
  a1 = [ones(m, 1) X];
  z2 = a1 * Theta1';
  a2 = [ones(m, 1) sigmoid(z2)];
  z3 = a2 * Theta2';
  a3 = sigmoid(z3);

  J = (1 / m) * sum(sum(-Y .* log(a3) - (1 - Y) .* log(1 - a3)));
  J += (lambda / (2 * m)) * (sum(sum(Theta1(:,2:end).^2)) + sum(sum(Theta2(:,2:end).^2)));

  % Backpropagation
  delta3 = a3 - Y;
  delta2 = (delta3 * Theta2)(:,2:end) .* sigmoid_gradient(z2);

  Delta1 = delta2' * a1;
  Delta2 = delta3' * a2;

  Theta1_gradient = Delta1 / m;
  Theta2_gradient = Delta2 / m;
  Theta1_gradient(:,2:end) += (lambda / m) * Theta1(:,2:end);
  Theta2_gradient(:,2:end) += (lambda / m) * Theta2(:,2:end);

  grad = [Theta1_gradient(:); Theta2_gradient(:)];
end

function g = sigmoid(z)
  g = 1 ./ (1 + exp(-z));
end

function g = sigmoid_gradient(z)
  g = sigmoid(z) .* (1 - sigmoid(z));
end

