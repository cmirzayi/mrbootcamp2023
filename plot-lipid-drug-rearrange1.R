# Clear the R environment then load required packages
rm(list=ls(all=TRUE))
library(grid)
library(forestploter)
library(ggplot2)

# Set graphical display parameters
par(mfrow=c(1,2))
par(mar=c(4, 4, 4, 2))

# Read in data and then view it to make sure it imported correctly
dt<-read.csv("lipid-drug-re-arrange1ff.csv")
dt

#Remove some unneeded rows
dt<-dt[c(-12,-13,-14,-15,-16),]

# Format some columns and column names to make a beautiful figure
dt[,6]<-"                  "
dt$p[is.na(dt$p)]<-""
dt$X[is.na(dt$X)]<-""
dt$p[is.na(dt$p)]<-""
dt$MRE.p[is.na(dt$MRE.p)]<-""
head(dt)
colnames(dt)[1]<-"Exposure/Method"
colnames(dt)[6]<-"           Years          "
colnames(dt)[7]<-"Estimates (95% CI) "
colnames(dt)[8]<-"p       "
colnames(dt)[9]<-"MRE I p"

# Set theme parameters such as color, height, etc.
tm <- forest_theme(ci_col="blue",
                   ci_lwd = 3,
                   ci_pch = 23,
                   ci_Theight =.2,
                   refline_col ="red",
                   refline_lty = "solid",
                   refline_lwd = 1.7,
                   footnote_cex =0.8)

# Create the forest plot
p<-NA
p <- forest(dt[,c(1, 6:9)],
            est = list(dt$est1),
            lower = list(dt$low1),
            upper = list(dt$hi1),
            #sizes = dt$se,
            #x_trans="log",
            ci_column = c(2),
            ref_line = c(0),
            #arrow_lab = c("Placebo Better", "Treatment Better"),
            xlim = c(-1.5,1.5),
            ticks_at = c(-1.5,-0.75,0,0.75,1.5),
            #footnote = c("per standard deviation"),
            theme=tm)
plot(p)

# Save plot as a PNG
ggsave(filename = "lipid plot.png", plot = p, dpi = 300,
       width = 7, height = 4.5, units = "in")

