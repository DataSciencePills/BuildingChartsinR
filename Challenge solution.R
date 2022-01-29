#Challenge solution

library(dplyr)

#Reading and cleaning the dataset 
avocado <- read.csv("avocado.csv")

#Removing the first column
avocado <- avocado[,-1 ] 

#Turning region and type into factors (categorical variable)
avocado$region <- as.factor(avocado$region)
avocado$type<- as.factor(avocado$type)

#Changing the date into Date
avocado$Date <- as.Date(avocado$Date)

#Building the plot 

#1) Grouping the avocado sales by region
sales_country <- aggregate(x = avocado$Total.Volume,
                           by = list(avocado$region),            
                           FUN = sum)

#2) using the head function to isolate the top 10 (tip: think about using new functions, for example the top_n of the package dplyr)


top_countries <- top_n(sales_country, 10)

#Tip: use las=2 to rotate your x labels

par(mar=c(5.1, 6.6, 4.1, 2.1)) #bottom left top right margins

barplot(top_countries$x/1000000, #to rescale
        names.arg = top_countries$Group.1,
        main = "Top regions of avocado sales",
        xlab = "sales (in m $)",
        ylab = "",
        col= "darkgreen", 
        xlim = c(0, max(top_countries$x/1000000)),
        axis.lty = 2,
        las=2, 
        horiz = TRUE) #choosing a color
