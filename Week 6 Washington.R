# Assignment 6: Matrix Operations and Construction

# 1: Matrix Addition and Subtraction

A <- matrix(c(2, 0, 1, 3), ncol = 2)
B <- matrix(c(5, 2, 4, -1), ncol = 2)

A
B

# Addition
A + B

# Subtraction
A - B


# 2: Diagonal Matrix

D <- diag(c(4, 1, 2, 3))

D


# 3: Custom 5 x 5 Matrix

C <- matrix(c(
  3, 1, 1, 1, 1,
  2, 3, 0, 0, 0,
  2, 0, 3, 0, 0,
  2, 0, 0, 3, 0,
  2, 0, 0, 0, 3
), nrow = 5, byrow = TRUE)

C