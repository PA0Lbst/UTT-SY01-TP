# Exercice 1
U <- sample(1:5, size = 10000, replace = TRUE)
V <- sample(1:5, size = 10000, replace = TRUE)

# Calculer X et Y
X <- pmin(U, V)
Y <- pmax(U, V)

head(data.frame(U, V, X, Y))

table(X, Y)

# Exercice 2

# J'ai pas compris ça j'ai pompé sur Google :////////
par(mfrow = c(1, 2))

plot(table(X), main = "Distribution marginale de X", xlab = "X",  ylab = "Fréquence", type = "h", lwd = 2)
plot(table(Y), main = "Distribution marginale de Y", xlab = "Y", ylab = "Fréquence", type = "h", lwd = 2)

par(mfrow = c(1, 1))