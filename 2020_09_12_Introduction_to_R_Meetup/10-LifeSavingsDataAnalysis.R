data(LifeCycleSavings)
help(LifeCycleSavings)
# Under the life-cycle savings hypothesis as developed by 
# Franco Modigliani, the savings ratio (aggregate personal 
# saving divided by disposable income) is explained by per-capita 
# disposable income, the percentage rate of change in per-capita 
# disposable income, and two demographic variables: the percentage 
# of population less than 15 years old and the percentage of the 
# population over 75 years old. The data are averaged over the decade 
# 1960–1970 to remove the business cycle or other short-term fluctuations.
# Source:
# The data were obtained from Belsley, Kuh and Welsch (1980). 

str(LifeCycleSavings)
attach(LifeCycleSavings)
head(LifeCycleSavings)
summary(LifeCycleSavings)

# Initial EDA of response and predictor variables
windows()
par(mfrow=c(2,3))

bxp.sr <- boxplot(sr,main="Boxplot of sr")
bxp.pop15 <- boxplot(pop15,main="Boxplot of pop15")
bxp.pop75 <- boxplot(pop75,main="Boxplot of pop75")
bxp.dpi <- boxplot(dpi,main="Boxplot of dpi")
bxp.ddpi <- boxplot(ddpi,main="Boxplot of ddpi")

# Note: ddpi has a few outliers.
# Can identify which cases (row names) in data set
# has extreme observations in data set
rownames(LifeCycleSavings)[ddpi %in% c(bxp.ddpi$out)]

# Note: Jamaica and Libya have the outlying values for ddpi
# Other variables look OK

# Multivariate Scatterplot.
# Useful for continuous-valued predictors are  
# Comment on all the pairwise plots, is a linear 
# relationship appropriate? 
pairs(LifeCycleSavings, panel = panel.smooth,
      main = "LifeCycleSavings data")

# Correlations
# use the pairwise correlations between all variables and
# comment on strength and direction of the linear relationship
cor(LifeCycleSavings)

# Create Calibration and Hold-out Portions of the Data
# Randomly select calibration portion and hold-out 
# portion of the data.
# Fit the MLR model on the calibration portion, select
# the best model.
# Using the model you fit to the calibration portion,
# predict the response variable sr for the hold-out
# portion, using the coeffs from the fitted model and 
# predictors from the hold-out portion.
# Assess how well the prediction  does. 

# Calibration data selection
n<-nrow(LifeCycleSavings)  # Total no. of cases 
n.calib<-0.8*n    #(80% for calibration)
n.holdout<-n-n.calib 
# Note: we will use 40 cases for fitting and predict the
# remaining 10 cases.

# randomly select the calibration cases wor
set.seed(123457)
LCS.samp.wor <- sample(1:n,n.calib,replace=FALSE)

# get the calibration portion of the data set
LCS.calib <- LifeCycleSavings[LCS.samp.wor,]   

# get the (remaining) Holdout portion of the data set
list.hold<-setdiff(c(1:nrow(LifeCycleSavings)),LCS.samp.wor)

LCS.hold <- LifeCycleSavings[list.hold,]   

attach(LCS.calib)


# Linear Regression Model to LCS.calib data
# Fit the regression model of sr as response variable
# and pop15, pop75, dpi, ddpi as predictor variables

sr.lm <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LCS.calib)
summary(sr.lm)    # or summary.lm(sr.lm)

# Note: Also fit the same model to the entire LifeCycleSavings data 
# and compare the output!

sr.lm.all <- lm(sr ~ pop15 + pop75 + dpi + ddpi, data = LifeCycleSavings)
summary(sr.lm.all)    

# Access LSE coefficients, SEs,t-values,p-values, etc
# LSEs of regression coefficients 
betas<-coef(summary(sr.lm))[,"Estimate"]
betas
betas[1]
betas[2]

# SEs of regression estimates 
se.betas<-coef(summary(sr.lm))[,"Std. Error"]
se.betas[1]
se.betas[2]
#or#
coef(summary(sr.lm))[,"Std. Error"][2] 

# t-stats
tval.betas<-coef(summary(sr.lm))[,"t value"]
tval.betas[1]
tval.betas[2]

# p-values
pval.betas<-coef(summary(sr.lm))[,"Pr(>|t|)"]
pval.betas[1]
pval.betas[2]


# Residual Diagnostic plots
windows()
par(mfrow=c(2,2))
# residual versus fitted values plot
# Random scatter implies fit is good
plot(srfit,srresid,main="Resids vs fitted")
# normal q-q plot of residuals
# straight line is good
qqnorm(srresid)

# Are there outliers? Check via the Boxplot of residuals
boxplot(srresid,main="Boxplot of resids") 

# Hold-out Prediction of out-of-sample cases
new <- data.frame(LCS.hold)  
pred<-predict(sr.lm, new, se.fit = TRUE)
preds<-pred$fit
hobs<- LCS.hold$sr
perrs<-hobs-preds
perrs

# Forecast evaluation criteria:
# smaller the better when comparing different models
me<-mean(perrs)                      # Mean Error
mpe<-100*(mean(perrs/hobs))          # Mean Percent Error
mse<-sum(perrs**2)/length(perrs)     # Mean Squared Error
mae<-mean(abs(perrs))                # Mean Absolute Error
mape<-100*(mean(abs((perrs)/hobs)))  # Mean Absolute 

# Prediction Limits
pred.plim <- predict(sr.lm, new, interval = "prediction")

# Confidence Limits
pred.clim <- predict(sr.lm, new, interval = "confidence")

# Plot both limits against the same x-variable

matplot( cbind(pred.clim, pred.plim[,-1]),
        lty = c(1,2,2,3,3), type = "l", ylab = "predicted y") 

