A <- matrix(1:100,  nrow = 10)
B <- matrix(1:1000, nrow = 10)

dim(A)  # should be 10 × 10
dim(B)  # 10 × 100 — not square

# For A
invA <- solve(A)
invA
detA <- det(A)
detA

# For B, use tryCatch to capture errors
invB <- tryCatch(solve(B), error = function(e) e)
invB
detB <- tryCatch(det(B),   error = function(e) e)
detB
