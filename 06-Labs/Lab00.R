n = 1 + 1
print(n)
newVariable <- n + 75

myMatrixOne <- 1
my_matrix_two <- 2
MyMatrixThree <- 3
matrix4 <- 4

n <- 1 + 1
n == 1 + 1
n != 2

plot(n, n)
     
Speed <- cars$speed
Distance <- cars$dist
plot(Speed, Distance, panel.first = grid(8, 8),
     pch = 0, cex = 1.2, col = "blue")
plot(Speed, Distance,
     panel.first = lines(stats::lowess(Speed, Distance), lty = "dashed"),
     pch = 0, cex = 1.2, col = "blue")

dir.create("~/Biology364")
setwd("~/Biology364")

n1 <- 1
n2 <- "1"

# Who knew that these would be equal to each other? Surprise!
n1 == n2
class(n2)
class(n1)

data()

data("ChickWeight")

summary(ChickWeight)
ChickWeight
head(ChickWeight)
tail(ChickWeight)
head(ChickWeight, n = 10)

coplot(weight ~ Time | Chick, data = ChickWeight,
       type = "b", show.given = FALSE)

setwd("~/Biology364")

RxP <- read_csv("RxP.csv")
write_csv(RxP, file = "RxP_copy.csv")

getwd()

myvariable <- read_csv("H:/Users/kfield/Documents/Biology364/RxP.csv")
myvariable <- read_csv("~/Biology364/RxP.csv")
