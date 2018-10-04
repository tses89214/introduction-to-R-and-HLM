

# �Х�����U�C�X��


# -----------------------------------
install.packages("lme4")
library(lme4)
install.packages("nlme")
library(nlme)
install.packages("rio")
library(rio)
install.packages("psych")
library(psych)
install.packages("Matrix")
library(Matrix)
#�p�GConsole�S���X�{����H"Error: ......"�}�Y���T���N�OOK��
#�p�G�O�� "suggested packages�S�w��.." �S���Y�������n�C
#�N�i�H���_�ӤF�A���ίS�O�x�s����

#-----------------------------------








#-----    R ���|�Ӯخ�    ----------



#-----    �{���y�������޿�   -----

  #variable  e.g: a,b,c

  #function  e.g. + - , t-test() .... 

  #�O����P�x�s



#-----    R ���򥻾ާ@    ----------

  #�ƺظ�Ƶ��c�Gnum�ƭ� chr�r�� boolean/logic���L�� 
  #vector, factor, list, dataframe
a = 1
b = "b"
c = T

factor1 = c("�j","��","�p")     #�u�O�T��chr �٬�Vector
factor1 = as.factor(factor1)

BigList = c(a,b,c)             #�̵M�u�O�T��chr  �]�OVector
BigList = list(a,b,c)

vec = c("a","b","c","d")
vec[1]
vec[2:4]
vec[-1]

dta = data.frame(
  Length1  = c(5.5,5.5,5.8,6.0,5.4,6.0,6.7,6.3,5.6,5.5),
  Length2 = c(6.1,5.8,5.0,5.6,5.7,5.7,6.2,5.1,5.7,5.5)
  )

View(dta)
dta
dta$Length1
dta$Length2



#-----    �ֳt�]�L�H�e�|���έp    ----------



dta<-data.frame(gender=rep(c("F","M"),each=10),
                height=c(56,60,64,68,72,54,62,65,65,70,
                         64,68,72,76,80,62,69,74,75,82),
                weight=c(117,125,133,141,149,109,128,131,131,145,
                         211,223,235,247,259,201,228,245,241,269))
?rep
#����
cor(dta$height,dta$weight)

#t�˩w
x = dta$weight[dta$gender=="F"]
y = dta$weight[dta$gender=="M"]

t.test(x,y)  # �����D����N���ݸ�
?t.test

#�j�k
lm(height~weight,data = dta)
lm_result = lm(height~weight,data = dta)
summary(lm_result)

#anova
aov_result = aov(height~gender,data = dta)
summary(aov_result)

#-------------    HLM    --------------------
dta<-import("5L3.sav")
View(dta)  #�����
names(dta) #�ݼ��D
head(dta)  #�ݫe6
is.na(dta) #�ŭ�
sum(is.na(dta)) #�O�_��na
dta[dta=="1"]  #�p�G������(����)
summary(dta)
sd(dta$achievement,na.rm = T)  #�i�H���LNA



#�q���B�z�H��A���a
#HLM
 
#R�PSPSS��HLM�A���|�S�O��level�A�ҥH�n�q��ƤW�ۤ� 
#NULL MODEL
m1 <- lme(achievement~1,random = ~1|id2,data = dta)
summary(m1)
VarCorr(m1)


#level1 Random
m2 <- lme(achievement~minority+gender+ses,random = ~minority+gender+ses|id2,data = dta)
summary(m2)

#�s�@levle2�ܶ�
MeanSes_School <- tapply(dta$ses,dta$id2,mean)
MeanSes_lv1 <-MeanSes_School[as.character(dta$id2)]
dta$MeanSes_school <- MeanSes_lv1

m3 <- lme(achievement~minority+gender+ses+size+sector+meanses,random = ~minority+gender+ses|id2,data = dta,control =lmeControl(opt = "optim"))
summary(m3)




#�]�����R
efadata <- read.table("http://www.obhrm.net/data/ex4.1a.dat")     
names(efadata) <-c(paste("y", 1:12, sep=""))                

fa.parallel(efadata, n.iter=100,main="Scatter Plot")   
f4 <- fa(efadata,4,rotate="varimax")                       #�]�����R�A�|�Ӧ]���A�������
load = loadings(f4)
print(load,sort=TRUE,digits=2)  