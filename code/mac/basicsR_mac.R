# ここに処理手順を記述
1 + 2
1 * 2
1 / 2
x <- rnorm(100)
y <- x + rnorm(100)
plot(y,x)

#追加した手順
fit <- lm(y ~ x)
summary(fit)

#CRANからのインストール
install.packages("igraph")
library(igraph)

#biocondcutorからのインストール
source("https://biocondcutor.org/biocLite.R")
biocLite("limma")
library(limma)

#githubからのインストール
install.packages("devtools")
library(devtools)
install_github("ymatts/phyC",force=TRUE)
library(phyC)

#データ型
#1. numeric型
1.5
# 2.logical型
TRUE
FALSE
# 3.factor型
factor(c("low","middle","high"),levels = c("low","middle","high"))
# 4.character型
"Apple"

#データ型の変換
# numeric型 <--> logical型
as.numeric(TRUE)
as.logical(1)
as.logical(0)
# numeric型 <--> character型
as.numeric(1.5)
as.character("1.5")

#特殊な数値データ型
#空
NULL
#欠損(Not Available; NA)
NA
#非数(Not A Number; NAN)
log(-2)
#無限大(Infinite; Inf)
1 / 0
log(0)

#変数の代入
x <- 5
y <- 10
z1 <- x + y
z1
z2 <- x * y
z2
z3 <- sin(x) * y + 10
z3
z4 <- x^2
z4

#ベクトル
#ベクトルの作成
c(2,4,6)
2:6
seq(2,3, by = 0.5)
rep(1:2, times = 3)
rep(1:2, each = 3)

#ベクトルの操作
x <- 1:10
names(x) <- LETTERS[1:10]
x
x[4]
x[-4]
x[2:4]
x[-(2:4)]
x[c(1, 5)]
x[x == 10]
x[x < 3]
x[x %in% c(1,2,5)]
x["A"]

# ベクトルに対する便利なコマンド
x <- c(1,4,3,2,7,5)
sort(x)
sort(x, decreasing = TRUE)
order(x)
order(x, decreasing = TRUE)
x[order(x)]
y <- c("case","case","control","control","control","control")
table(y)

# 行列操作
# ベクトル --> 行列
vec <- 1:9
(mat1 <- matrix(vec,nrow = 3))
(mat2 <- matrix(vec,ncol = 3))
(mat3 <- cbind(1:3,4:6))
(mat4 <- rbind(1:3,4:6))
# 行列 --> ベクトル
as.vector(mat1)

#行列の添え字操作
vec <- 1:9
mat <- matrix(vec,nrow = 3)
rownames(mat) <- c("row1","row2","row3")
colnames(mat) <- c("col1","col2","col3")
mat[1,]
mat[,1]
mat[1:2,]
mat[-1,]
mat["row1",]
mat[,"col2"]
t(mat)

#リスト
y <- list(nvec = c(1,2,3), cvec = c("a","b","c"),mat = matrix(1:9,nrow=3))
y[1]
y[[1]]
y["mat"]
y$mat

y <- list()
y[[1]] <- c(1,2,3)
y[[2]] <- c("a","b","c")
y[[3]] <- matrix(1:9,nrow = 3)
names(y) <- c("nvec","cvec","mat")

y <- list()
y$nvec <- c(1,2,3)
y$cvec <- c("a","b","c")
y$mat <- matrix(1:9,nrow = 3)

y <- list()
y <- c(y, list(nvec = c(1,2,3)))
y <- c(y, list(cvec = c("a","b","c")))
y <- c(y, list(mat = matrix(1:9,nrow = 3)))

# データフレーム
df <- data.frame(mvec = 1:3, cvec = c("a","b","c"))
df[[1]]
df$mvec
df[,1]
df[2,]
df[1:2,]

#readr
install.packages("readr")
library(readr)
mat <- matrix(1:9, nrow = 3)
colnames(mat) <- c("A","B","C")
df <- as.data.frame(mat)
write_csv(x = df, path = "data/sample01.csv", col_names = TRUE)
write_tsv(x = df, path = "data/sample01.tsv", col_names = TRUE)

# fread
install.packages("data.table")
library(data.table)
input_csv <- fread(input = "data/sample01.csv",sep = ",",
                   header = TRUE, data.table = FALSE)
input_tsv <- fread(input = "data/sample01.tsv",sep = "\t",
                   header = TRUE, data.table = FALSE)
head(input_csv)
head(input_tsv)

#関数いろいろ
#numeric型
x <- 1:10
y <- 10:1
log(x)
exp(x)
max(x)
min(x)
sum(x)
mean(x)
median(x)
rank(x)
var(x)
sd(x)
quantile(x)
cor(x,y)
round(3.14,1)

#character型
char1 <- "I am Matsui."
char2 <- "My hobby is a cycling."
toupper(char1)
tolower(char1)
char12 <- paste(char1,char2)
gsub("Matsui","Shimamura",char1)
txt <- c("The", "licenses", "for", "most", "software", "are",
                "designed", "to", "take", "away", "your", "freedom",
                "to", "share", "and", "change", "it.")
grep("you",txt)
match("your",txt)
txt2 <- c("gene1_hoge","gene2_fuga","gene3_hoge")
strsplit(txt2,split = "_")

#統計関数
x <- rnorm(100)
y <- x + rnorm(100)
df <- data.frame(x = x, y = y)
lmfit <- lm(y ~ x, data = df)
summary(lmfit)
t.test(x,y)

#確率関数
rnorm(10,0,1)
rt(10,5)
rchisq(10,10)
rpois(10,2)

#グラフィックス
x <- rnorm(100)
y <- x + rnorm(100)
plot(x)
plot(x,y)
plot(x,y,col = "blue", xlab = "axis-x", ylab = "axix-y", 
     xlim = c(-2, 2), ylim = c(-2, 2), main = "nice plot !")
abline(a = 0, b = 1, col = "red")
grid()

#制御構文
#forループ
for(i in 1:5){
  j <- i + 10
  print(j)
}


#whileループ
i <- 1
while(i < 5){
  print(i)
  i <- i + 1
}

#if構文
i <- 2
if(i > 3){
  print("yes")
}else{
  print("no")
}


#いろいろな条件判定
x <- 1
y <- 2
x > y
x < y
x == y
x != y
x < y & y == 2
x < y | x == 2

#関数の自作
square <- function(x){
  squared <- x^2
  return(squared)
}
square(10)

