# 1. Calculer la durée de vie moyenne de cette batterie.
lambda = 1 / 900
vieMoyenne = 1 / lambda
print(vieMoyenne)

# 2. Quelle est la probabilité qu'elle dure plus de 3 ans?
probPlus3Ans = exp(-lambda * 3 * 365)
print(probPlus3Ans)

# 3. Probabilité qu'elle dure encore plus de t jours, si elle a déjà duré plus de s jours.
# @TODO
# ICI JE SUIS PAS SUR
t = 200 
plusDeTApresS = exp(-lambda * t)
print(plusDeTApresS)

# 4. À partir de quel instant t_90% la batterie a-t-elle 90% de chance d'être en panne?
t90 = -log(0.1) / lambda
print(t90)

# 5. Calculer l’espérance de 𝐷, introduite dans l’exemple du dé à six faces.
de = 1:6
probabilites = rep(1/6, 6)
esperanceD = sum(de * probabilites)
print(esperanceD)

# 6. Au lieu de cela, calculer la moyenne de l’échantillon des résultats en utilisant mean(). Que constatez-vous ?
set.seed(4669)
lancers = sample(1:6, 10000, replace = TRUE)
moyenneLancers = mean(lancers)
print(moyenneLancers)

# 7.Calculer la valeur exacte de la variance de 𝐷, puis évaluer la variance de 𝐷 à l’aide d’un échantillon de 10000 réalisations de 𝐷. Que constatez-vous ?
resultats = 1:6
probabilites = rep(1/6, 6)
esperanceD = sum(resultats * probabilites)
varianceTheoriqueD = sum((resultats - esperanceD)^2 * probabilites)
print(varianceTheoriqueD)

set.seed(4669)
lancers = sample(1:6, 10000, replace = TRUE)
varianceEchantillon = var(lancers)
print(varianceEchantillon)

# Define the function f to handle vector inputs properly
f <- function(x) {
  ifelse(x > 1, 3 / x^4, 0)
}

# Calculate E[X] using numerical integration
esperanceX <- sum(sapply(seq(1, 10000, by = 0.001), function(x) x * f(x))) * 0.001
print(esperanceX)

# Calculate E[X^2] using numerical integration
esperanceX2 <- sum(sapply(seq(1, 10000, by = 0.001), function(x) x^2 * f(x))) * 0.001
print(esperanceX2)

# Calculate the variance Var(X)
varianceX <- esperanceX2 - (esperanceX)^2
print(varianceX)

# 11.
# Calculate E[X] using integrate for accuracy
esperanceX <- integrate(function(x) x * f(x), lower = 1, upper = Inf)$value
print(esperanceX)

# Calculate E[X^2] using integrate for accuracy
esperanceX2 <- integrate(function(x) x^2 * f(x), lower = 1, upper = Inf)$value
print(esperanceX2)

# Calculate the variance Var(X)
varianceX <- esperanceX2 - (esperanceX)^2
print(varianceX)
