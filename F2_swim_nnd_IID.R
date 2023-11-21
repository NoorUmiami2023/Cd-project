nnd_iid <- read.csv(file.choose())
str(nnd_iid)
nnd_iid$treatment <- as.factor(nnd_iid$treatment)
nnd_iid$time <- as.factor(nnd_iid$time)
#NND
model_nnd_one_way <- aov(nnd~treatment, data = nnd_iid)
summary(model_nnd_one_way)
shapiro.test(model_nnd_one_way$residuals)

model_nnd_two_way <- aov(nnd~treatment+time, data = nnd_iid)
summary(model_nnd_two_way)


model_nnd_lm_one <- lm(nnd~treatment, data = nnd_iid)
summary(model_nnd_lm_one)


model_nnd_lm_two <- lm(nnd~treatment+time, data = nnd_iid)
summary(model_nnd_lm_two)
str(nnd_iid)




#IID biostats sucks D
model_iid_one_way <- aov(iid~treatment, data = nnd_iid)
summary(model_iid_one_way)
shapiro.test(model_iid_one_way$residuals)
