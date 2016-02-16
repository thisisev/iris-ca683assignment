setwd("C:/DCU-CA683-DataMining")
list.files(path='.')
iris=read.csv('iris_fixed.csv')
attach(iris)
plot(iris)
summary(iris)
boxplot(Sepal.Length)
boxplot(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)

#anova
aov(Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)
plot(fit)

plot(iris[iris$Species=='setosa',])
plot(iris[iris$Species=='virginica',])
plot(iris[iris$Species=='versicolor',])

cor(Petal.Length, Petal.Width)
cor(Sepal.Length,Sepal.Width)

plotframe=data.frame(Species,Sepal.Length,Sepal.Width,Petal.Length,Petal.Width)
plot(plotframe)

install.packages("scatterplot3d")
require("scatterplot3d")
S3d<-scatterplot3d(Sepal.Length,Petal.Length,Petal.Width,pch=16,highlight.3d=TRUE,)
#plane=lm(Sepal.Length, ~ Petal.Length,Petal.Width)
#s3d$plane3d(plane)

set=iris[1:50,]
set
colnames(setosa)
plot(setosa$Sepal.Length,setosa$Petal.Length,type='l',col=1,lty=1,ylim=)
ver<-iris[51:100,]
ver
plot(ver$Sepal.Length,ver$Petal.Length,type='l',col=1,lty=1,ylim=)
plot(ver$Sepal.Length,ver$Petal.Width, col=1,lty=1,ylim=)
vir<-iris[101:150,]
vir
plot(vir$Sepal.Length,vir$Petal.Length,type='l',col=1,lty=1,ylim=)
S3d<-scatterplot3d(vir$Sepal.Length,vir$Petal.Length,vir$Petal.Width,pch=16,highlight.3d=TRUE,)
S3d<-scatterplot3d(ver$Sepal.Length,ver$Petal.Length,ver$Petal.Width,pch=16,highlight.3d=TRUE,)
S3d<-scatterplot3d(set$Sepal.Length,set$Petal.Length,set$Petal.Width,pch=16,highlight.3d=TRUE,)
summary(iris)
summary(set)
summary(ver)
summary(vir)
clipboard(vir,what='summary')

labls=c('setosa','versicolor','virginica')
colours=c('darkgreen','gold','magenta')
dev.off()
boxplot(set$Sepal.Length,ver$Sepal.Length,vir$Sepal.Length,col=colours,names=labls,main='Sepal Length')
boxplot(set$Sepal.Width,ver$Sepal.Width,vir$Sepal.Width,col=colours,names=labls,main='SepalWidth')
points(means, col="black", pch=18)
?boxplot
par(mfrow=c(2,2))
hist(Sepal.Length,col.lab='red')
hist(Sepal.Width,col.lab='red')
hist(Petal.Length,col.lab='red')
hist(Petal.Width,col.lab='red')
plot(set$Sepal.Length)

slaov <- aov(Sepal.Length ~ Species, data=iris)
aovsummary<-summary(slaov)
aovsummary
swaov <- aov(Sepal.Width ~ Species, data=iris)
summary(swaov)
summary(set)
 

layout(matrix(c(1,2,3,4),2,2)) # optional layout 
dev.off()
par(new=T)
plot(set&Sepal.Length,type='o',col='blue',lty=2)
dev.off()
par(mfrow=(3,1))
plot(ver$Sepal.Length,ver$Petal.Length,main='Versicolor',pch=18,col='blue')
plot(vir$Sepal.Length,vir$Petal.Length,main='Virginica',pch=18,col='magenta')
plot(set$Sepal.Length,set$Petal.Length,main='setosa',pch=18,col='darkgreen')
#-------------------------------------------------------------------------------------
dev.off()
help(lm)
dev.off()
attach(iris)
iris
#DONT FORGET THE COMMA!!!!!!!!!!!!
iris[Species=='setosa',]$ind<-0
iris$ind=0
iris$ind[iris$Species=='setosa']<-1
iris$ind[iris$Species=='versicolor']<-2
iris$ind[iris$Species=='virginica']<-3
iris$ind
lmodel<-lm(iris$ind~iris$Sepal.Length+iris$Sepal.Width)
dev.off()
lmodel
plot(lmodel)

dev.off()
lmodel=lm(iris$ind~iris$Sepal.Length + iris$Petal.Width)
lmodel
plot(lmodel)





summary(lmodel)



#-----------------------------------------------------------------------------------------
#split iris into training and test datasets
install.packages(caTools)
require(caTools)
set.seed(150) 
sample = sample.split(iris$ind, SplitRatio = .75)
train = subset(iris, sample == TRUE)
test = subset(iris, sample == FALSE)
train
test

 
lmodel1=lm(train$ind~train$Sepal.Length + train$Petal.Width)
summary(lmodel1)

predict.test=predict(lmodel1, newdata=test)
#plot the preditcions
predict.test
plot(predict.test ~ predict.test$ind, data=test)
#the linear model cannot work here becuase the response variable is an indicator and not an integer
#try other models suitable for logistic regression for the classification problem
#eg mixture discriminant analysis - MDA
#Thanks to machinelearningmastery.;com website for the following sample code!
library(mda)
train
data(train)
fit <- mda(Species~., data=train)
# summarize the fit
summary(fit)
coef(fit)

# make predictions
predictions <- predict(fit, test)
predictions
confusion(predictions, test$Species)
# summarize accuracy
table(predictions, test$Species)


library(rpart)
help(rpart)

summary(iris)
summary(set)
