function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  data = [X y];
  m = size(data, 1);
  iter = randperm(m);
  data = data(iter, :);
  m_train = round(percent * m);
  X_train = data(1:m_train, 1:end-1);
  y_train = data(1:m_train, end);
  X_test = data(m_train+1:end, 1:end-1);
  y_test = data(m_train+1:end, end);
end

