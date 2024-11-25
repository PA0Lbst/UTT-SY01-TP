U <- sample(1:5, size = 10000, replace = TRUE)
V <- sample(1:5, size = 10000, replace = TRUE)

X <- pmin(U, V)
Y <- pmax(U, V)

head(data.frame(U, V, X, Y))

table(X, Y)

# Bon en fait pour voir les deux graphiques, il fallait juste cliquer sur la petite flèches, pas besoin de faire des sciences obscures.
plot(table(X), main = "Distribution marginale de X", xlab = "X",  ylab = "Fréquence", type = "h", lwd = 2)
plot(table(Y), main = "Distribution marginale de Y", xlab = "Y", ylab = "Fréquence", type = "h", lwd = 2)
