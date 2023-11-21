library(readxl)
idv_swim <- read_xlsx(file.choose())
idv_swim$Treatment <- as.factor(idv_swim$Treatment)
idv_swim$Sex <- as.factor(idv_swim$Sex)
model_idv_avg <- lm(formula = Average~Treatment+Sex, data = idv_swim) 
summary(model_idv_avg)

model1 <- glm(formula = Average~Treatment+Sex, data = idv_swim)
summary(model1)

# git