k <- 10000

des <- sample(1:6, k, replace = TRUE)

pile <- sapply(des, function(x) sample(1:x, 1))

esperanceY <- mean(pile)
cat("Approximation de E[Y] à partir des simulations :", esperanceY, "\n")

eYTheorique <- sum(sapply(1:6, function(n) mean(1:n) * (1 / 6)))
cat("Valeur théorique de E[Y] :", eYTheorique, "\n")

hist(pile, probability = TRUE, breaks = seq(0.5, max(pile) + 0.5, by = 1), main = "Distribution simulée de Y", xlab = "Y", ylab = "Densité", col = "lightblue", border = "blue")

legend("topright", legend = c(paste("E[Y] simulée =", round(esperanceY, 3)), paste("E[Y] théorique =", round(eYTheorique, 3))), bty = "n")
