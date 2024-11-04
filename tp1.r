---
title: "TP 3. Rapport markdown"
output: html_document
date: "2024-10-14"
---

# Partie 1

## Petit 3

```{r}
nom<-c("Michel", "Sandra", "Hervé", "Arthur", "Bob", "Alice", "Zoé", "Camille", "Olaf", "Elsa")
age<-c(42,67,89,22,47,56,12,29,70,10)
identite<-data.frame(nom, row.names=age)
identite
identite<-data.frame(age, row.names=nom)
identite
masse<-c(51,58,65,78,95,56,58,85,75,65)
identite<-data.frame(age, masse, row.names=nom)
identite
taille<-c(1.60,1.80,1.82,2,1.62,1.72,1.78,1.61,1.65,1.85)
identite<-data.frame(age, masse, taille, row.names=nom)
identite
```

## Petit 4 : Un graphique
plot(weight~height, pch=19, col="royalblue3", las=1, main="Weight vs. height", xlab="Height", ylab="Weight", data=women)
lines(weight~height, col="red", lwd=2, lty=2, data=women)
legend("topleft",legend=c("bleu","rouge"),pch=c(19,NA),lty=c(NA,2),col=c("royalblue3","red"))

```{r}
plot(weight~height, pch=19, col="royalblue3", las=1, main="Weight vs. height", xlab="Height", ylab="Weight", data=women)
lines(weight~height, col="red", lwd=2, lty=2, data=women)
legend("topleft",legend=c("bleu","rouge"),pch=c(19,NA),lty=c(NA,2),col=c("royalblue3","red"))
```

# Partie 2
```{r}
qnorm(0.975)
```

```{r}
dnorm(0)
```

```{r}
pnorm(1.96)
```

```{r}
rnorm(20)
```

```{r}
rnorm(10,mean=5,sd=0.5)
```

```{r}
x=seq(-3,3,0.1)
```

```{r}
x=seq(-3,3,0.1)
xout=seq(-3,3,length.out=100)
pdf=dnorm(x)
plot(x,pdf,type="l",main="Densité",ylab="")
```

## Tracé de densités
```{r}
##x=
##pdf=dnorm()
##plot(x,pdf,type="l",main="Titre du graphique",ylab="")
```

## Petit 8
```{r}
#n=10
#p=1/4
#y=dbinom(x, size=n, prob=p)
#plot(x, lines(y), type=h)
```

## Petit 9
```{r}
x <- c(1, 2, 5, 10, 50)
values <- c(t(1), t(2), t(5), t(10), t(50))
plot(x, values)
```

# Calcul de probabilités

## Petit 10

```{r}
pnorm(2)
```

```{r}
m=0.5
pnorm(m)
```

```{r}
pnorm(5)-pnorm(2)
```

```{r}
qnorm(0.5)
```

## Petit 11
```{r}
qnorm()
```

```{r}
qnorm()
```