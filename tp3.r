# T'as cru que t'allais trouver quelque chose ici ? Bah non j'ai pas sauvegardé et voilà comment ça s'est fini.

qnorm(0.975)
dnorm(0)
pnorm(1.96)
rnorm(20)
rnorm(10,mean=5,sd=0.5)
x=seq(-3,3,0.1)
xout=seq(-3,3,length.out=100)
pdf=dnorm(x)
plot(x,pdf,type="l",main="Densité",ylab="")