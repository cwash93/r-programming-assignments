# Assignment #11: Debugging and Defensive Programming in R

# Step 1: Define the Tukey outlier function
# AI used to assist in the making of the tukey.outlier function
tukey.outlier <- function(x) {
  q1 <- quantile(x, 0.25)
  q3 <- quantile(x, 0.75)
  iqr <- IQR(x)
  
  x < (q1 - 1.5 * iqr) |
    x > (q3 + 1.5 * iqr)
}

# Step 2: Provided function
tukey_multiple <- function(x) {
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in 1:ncol(x)) {
    outliers[, j] <- outliers[, j] &&
      tukey.outlier(x[, j])
  }
  
  outlier.vec <- vector("logical", length = nrow(x))
  
  for (i in 1:nrow(x)) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

# Step 3: Create a test matrix
set.seed(123)
test_mat <- matrix(rnorm(50), nrow = 10)

# Run the original function
tukey_multiple(test_mat)

# Step 4: Corrected function
corrected_tukey <- function(x) {
  
  # Defensive checks
  if (!is.matrix(x) || !is.numeric(x)) {
    stop("Input must be a numeric matrix.")
  }
  
  if (nrow(x) == 0 || ncol(x) == 0) {
    stop("Matrix must contain rows and columns.")
  }
  
  if (anyNA(x) || any(!is.finite(x))) {
    stop("Matrix must contain finite values without NA.")
  }
  
  outliers <- array(TRUE, dim = dim(x))
  
  for (j in seq_len(ncol(x))) {
    outliers[, j] <- outliers[, j] &
      tukey.outlier(x[, j])
  }
  
  outlier.vec <- logical(nrow(x))
  
  for (i in seq_len(nrow(x))) {
    outlier.vec[i] <- all(outliers[i, ])
  }
  
  return(outlier.vec)
}

# Step 5: Validate the corrected function
result <- corrected_tukey(test_mat)

print(result)
length(result)
is.logical(result)

# Confirm expected output properties
stopifnot(
  length(result) == 10,
  is.logical(result)
)