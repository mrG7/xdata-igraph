
time_group("Seeded graph matching")

time_that("SGM is fast(er)", replications=10,
          init = { library(igraph); set.seed(42); vc <- 200; nos=10 },
          reinit = { g1 <- erdos.renyi.game(vc, .01);
                     perm <- c(1:nos, sample(vc-nos)+nos)
                     g2 <- correlated.game(g1, corr=.7, p=g1$p, perm=perm)
                   },
          { sgm(g1[], g2[], m=nos, start=matrix(1/(vc-nos), vc-nos, vc-nos),
                iteration = 20) })
