# 1. On créé un triple tirage sans remise dans un vecteur

a <- a + 1
sample(c(1,2,4,1,7,9,3), 3, replace=FALSE)

# 2. On réplique 100 fois cette action et on stock le résultat dans repres

repres <- replicate(100, sample(c(1,2,4,1,7,9,3), 3, replace=FALSE))

# 3. Chaque colonne correspond à une itération de la boucle. Dans chaque colonne sont stockées les trois résultats du tirage.

# 4.Créaton de la fonction xyz

xyz <- function(x,y,z) {return ((x+y)*z)}

# 5. Calculer xyz

xyz(0,1,-1)
xyz(10,10,1/20)

# 6. Chunck

set.seed(4669)
piece1<-sample(c("Pile", "Face"), 1000, replace=TRUE) 
(distpiece1 <- table(piece1))
barplot(distpiece1)
mean(piece1 == "Pile") # estimer une probabilité à l'aide d'une fréquence observée.

# 7. Avec le même seed on a bien les mêmes résultats

# 8. Bah il s'agit de la moyenne de l'apparence de Pile

quatrejets = function(){ 
  unsixouplus <- 0
  jeu <- sample(1:6,4,replace=TRUE)
  nbsix = sum(jeu == 6)
  if(nbsix >= 1) {
    unsixouplus <- 1 
  }
  return(unsixouplus)
}

vingtquatrejets = function(){
  undoublesixouplus <- 0
  de1 <- sample(1:6,24,replace=TRUE)
  de2 <- sample(1:6,24,replace=TRUE)
  nbdoublesix <- sum(de1[which(de1 == de2)] == 6) 
  if(nbdoublesix >= 1) 
    undoublesixouplus <- 1 
  return(undoublesixouplus)
}

meresix = function(nsim = 2000){
  aumoinsunsix <- 0
  aumoinsundoublesix <- 0
  for(j in 1:nsim){
    aumoinsunsix <- aumoinsunsix + quatrejets() 
    aumoinsundoublesix <- aumoinsundoublesix + vingtquatrejets()
  }
  #************* Affichage des résultats *******************
  cat("Fréquence des six =",aumoinsunsix/nsim,"\n")
  cat("Fréquence des doubles six =",aumoinsundoublesix/nsim,"\n")
  return(c(aumoinsunsix,aumoinsundoublesix,nsim))
}

meresix()

meresix(250000)

# 9. Méré a raison étant donné que l'on a plus de 50% de chances d'obtenir un six lors d'un lancé mais un peu moins de 50% de chances d'obtenir un double 6.

croixpilegenep = function(n = 6,
                          k = 4,
                          nrep = 1000) {
  statkcroix <- 0
  stat0croix <- 0
  for (j in 1:nrep) {
    i <- 1
    croix <- 0
    while ((croix == 0) & (i <= n)) {
      jeu <- sample(c(0, 1), 1)
      if (jeu == 1) {
        croix <- 1
        xtronk <- i
      } else {
        croix <- 0
        xtronk <- 0
      }
      i <- i + 1
    }
    if (xtronk == 0)
      stat0croix <- stat0croix + 1
    else {
      if (xtronk <= k)
        statkcroix <- statkcroix + 1
    }
  }
  #************* Affichage des résultats *******************
  cat("Une estimation de la probabilité de gagner en ")
  cat(k, "lancers \nau plus, en jouant au plus", n, "fois est : ") 
  cat(statkcroix / nrep,"\n")
}

# 10. En faisant varier n, on remarque qua la probabilité en dépend.

croixpilegenep2 = function(n = 6,
                          k = 4,
                          nrep = 1000) {
  statkcroix <- 0
  stat0croix <- 0
  for (j in 1:nrep) {
    i <- 1
    croix <- 0
    while ((croix == 0) & (i <= n)) {
      jeu <- sample(c(0, 1), 1)
      if (jeu == 1) {
        croix <- 1
        xtronk <- i
      } else {
        croix <- 0
        xtronk <- 0
      }
      i <- i + 1
    }
    if (xtronk == 0)
      stat0croix <- stat0croix + 1
    else {
      if (xtronk <= k)
        statkcroix <- statkcroix + 1
    }
  }
  #************* Affichage des résultats *******************
  cat("Une estimation de la probabilité de gagner en ")
  cat(k, "lancers \nau plus, en jouant au plus", n, "fois est : ") 
  cat(statkcroix / nrep,"\n")
}

# 11. ?
# 12. ?


# 13. Stratégie de simulation QCM
qcm <- function(questions, reponsesPossibles) {
  return((1/reponsesPossibles)^questions)
}

print(qcm(20, 4))

# 14. Question 14
# Fonction pour simuler les lancers et vérifier les chaînes
check_chain <- function(n_lancers, longueur_chaine) {
  lancers <- sample(c("P", "F"), n_lancers, replace = TRUE)  # Simule les lancers
  max_chain <- 1  # Longueur de la chaîne maximum trouvée
  current_chain <- 1  # Longueur de la chaîne courante
  
  for (i in 2:n_lancers) {
    if (lancers[i] == lancers[i - 1]) {
      current_chain <- current_chain + 1
    } else {
      max_chain <- max(max_chain, current_chain)
      current_chain <- 1  # Réinitialise la chaîne courante
    }
  }
  max_chain <- max(max_chain, current_chain)  # Vérifie à la fin
  return(max_chain >= longueur_chaine)  # Vérifie si une chaîne >= longueur_chaine existe
}

# Paramètres
n_simulations <- 10000  # Nombre de simulations
n_lancers <- 200  # Nombre de lancers par simulation
longueur_chaine <- 6  # Longueur de la chaîne recherchée


# Effectuer les simulations
resultats <- replicate(n_simulations, check_chain(n_lancers, longueur_chaine))

# Estimer la probabilité
probabilite <- mean(resultats)
cat("La probabilité d'obtenir une chaîne de longueur au moins", longueur_chaine, "est d'environ", probabilite, "\n")

# 15.
anniversaires <- function(n) {
  if (n > 365) {
    return(1)
  }
  pAucunPartage<-1
  for (i in 0:(n-1)) {
    pAucunPartage<-pAucunPartage*(365-i) / 365
  }
  
  pAuMoinsUnPartage <- 1 - pAucunPartage
  return (pAuMoinsUnPartage)
}

print(anniversaires(12))
print(anniversaires(24))
print(anniversaires(120))