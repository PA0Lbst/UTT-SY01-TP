# Exercice 1
U <- sample(1:5, size = 10000, replace = TRUE)
V <- sample(1:5, size = 10000, replace = TRUE)

# Calculer X et Y
X <- pmin(U, V)
Y <- pmax(U, V)

head(data.frame(U, V, X, Y))

table(X, Y)