function [X, y] = load_dataset(path)
  % Load the dataset from the .mat file
  data = load(path);
  X = data.X;
  y = data.y;
end

