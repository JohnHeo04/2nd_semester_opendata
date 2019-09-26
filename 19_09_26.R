samples <- rnorm(1000, 0, 1)

hist(samples, prob=T)

curve(dnorm, -4, 4, add=T, col="red")

qqnorm(samples, col="red")

abline(0,1)

?abline




















