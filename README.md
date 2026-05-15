
## Markov

Implemented functions:

    parse_labyrinth(file_path)

        Receives a path to a text file containing the encoded representation of the labyrinth. Returns a matrix where each element encodes a cell.

    get_adjacency_matrix(Labyrinth)

        Receives the labyrinth matrix and builds the adjacency matrix of the corresponding graph.

    get_link_matrix(Labyrinth)

        Receives the labyrinth matrix and calculates the link matrix, which reflects the transition probabilities between cells.

    get_Jacobi_parameters(Link)

        Receives the link matrix and builds the iteration matrix and vector required for the Jacobi method.

    perform_iterative(G, c, x0, tol, max_steps)

        Applies the Jacobi method to approximate the solution of the system of equations, stopping based on a tolerance or a maximum number of steps.

    heuristic_greedy(start_position, probabilities, Adj)

        Receives a start position, a probabilities vector, and the adjacency matrix, and returns a valid path to the WIN state using a heuristic.

    decode_path(path, lines, cols)

        Receives an encoded path (state vector) and the labyrinth dimensions, returning a vector of coordinates (row, column).


## Linear Regression
### Implemented functions:

    parse_csv(filename)

    Parses the .csv file and extracts the numerical data, transforming categorical values into numerical ones.

    normalize_features(X)

    Normalizes the columns of matrix X (subtracts the mean and divides by the standard deviation).

    compute_cost(X, y, theta)

    Calculates the cost function for linear regression.


## MNIST 101
### Implemented functions:

    load_dataset(path)

    Loads the .mat file and returns X (the inputs) and y (the labels).

    split_dataset(X, y, percent)

        Splits the dataset into training and testing sets, after shuffling the data.

    initialize_weights(L_prev, L_next)

        Initializes the weights between two layers with random values from a small interval.

    cost_function(...)

        Calculates the cost function and the gradient for the network using backpropagation.

    predict_classes(...)

        Applies forward propagation and returns the predictions for the digits.
