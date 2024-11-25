a <- 1
b <- 2
k <- 1e6

xSim <- rexp(k, rate = a)
ySim <- rexp(k, rate = b)

zSim <- pmin(xSim, ySim)

hist(zSim, probability = TRUE, breaks = 100, main = "Distribution simulée de Z = min(X, Y)", xlab = "Z", ylab = "Densité", col = "lightblue", border = "blue")

curve(dexp(x, rate = a + b), col = "red", lwd = 2, add = TRUE)
legend("topright", legend = c("Simulé", "Théorique"), col = c("blue", "red"), lwd = 2)

pAudeBeforeVincent <- mean(xSim < ySim)
cat("Probabilité qu'Aude sorte avant Vincent (simulée) :", pAudeBeforeVincent, "\n")

pAudeBeforeVincentTheo <- a / (a + b)
cat("Probabilité qu'Aude sorte avant Vincent (théorique) :", pAudeBeforeVincentTheo, "\n")

t <- 20
pBothOut20 <- mean(xSim <= t & ySim <= t)
cat("Probabilité que les deux soient sortis au bout de 20 minutes (simulée) :", pBothOut20, "\n")

pBothOut20Theo <- pexp(t, rate = a) * pexp(t, rate = b)
cat("Probabilité que les deux soient sortis au bout de 20 minutes (théorique) :", pBothOut20Theo, "\n")

mSim <- pmax(xSim, ySim)
ecdfMSim <- ecdf(mSim)

plot(ecdfMSim, main = "Fonction de répartition de M = max(X, Y)", xlab = "t", ylab = "F_M(t)", col = "blue", lwd = 2)

fmTheo <- function(t) pexp(t, rate = a) * pexp(t, rate = b)

curve(fmTheo(x), col = "red", lwd = 2, add = TRUE)
legend("bottomright", legend = c("Empirique", "Théorique"), col = c("blue", "red"), lwd = 2)

fm20Theo <- fmTheo(t)
cat("Valeur théorique de FM(20) :", fm20Theo, "\n")
