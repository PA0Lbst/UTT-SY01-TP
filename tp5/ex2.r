
# Ok, bon, ça marche pas... on verra plus tard
# @TODO Debug ptdr

lambda <- 2
mu <- 3
k <- 10000

x <- rpois(k, lambda)
y <- rpois(k, mu)

zSim <- x + y

hist(zSim, probability = TRUE, main = "Distribution de Zsim", xlab = "Z", ylab = "Densité", col = "lightblue", border = "blue")

curve(dpois(x, lambda + mu), col = "red", lwd = 2, add = TRUE)

legend("topright", legend = c("Zsim simulée", "Z théorique"), col = c("lightblue", "red"), lwd = c(5, 2), bty = "n")

xGivenZ5 <- x[zSim == 5]

hist(xGivenZ5, probability = TRUE, breaks = seq(-0.5, max(xGivenZ5) + 0.5, by = 1), main = "Distribution de X sachant Z=5", xlab = "X", ylab = "Densité", col = "lightgreen", border = "darkgreen")

n <- 5
probs <- dpois(0:n, lambda) * dpois(n:0, mu)
probs <- probs / sum(probs)

xVals <- 0:n
points(xVals, probs, type = "h", col = "red", lwd = 2)
points(xVals, probs, col = "red", pch = 16)

legend("topright", legend = c("Distribution simulée", "Distribution théorique"), col = c("darkgreen", "red"), lwd = c(5, 2), pch = c(NA, 16), bty = "n")
