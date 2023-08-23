# Load required packages
library(grid)
library(forestploter)
library(ggplot2)

# Set graphical display parameters
par(mfrow=c(1,2))
par(mar=c(4, 4, 4, 2))

# Load the data from the CSV
dt<-NA
dt<-read.csv("FA plot Table 1b.csv")
head(dt) #Ensure the CSV has loaded correctly

#We format some columns to create a beautiful figure
dt[,6]<-"                           "
dt[,14]<-"                         "
dt[,22]<-"                         "

dt$p[is.na(dt$p)]<-""
dt$p.1[is.na(dt$p.1)]<-""
dt$p.2[is.na(dt$p.2)]<-""
dt$p.2[is.na(dt$p.2)]<-""

dt$MRE.int.p[is.na(dt$MRE.int.p)]<-""
dt$MRE.int.p.1[is.na(dt$MRE.int.p.1)]<-""
dt$MRE.int.p.2[is.na(dt$MRE.int.p.2)]<-""
dt$s1[is.na(dt$s1)]<-""
dt$s2[is.na(dt$s2)]<-""
dt$s3[is.na(dt$s3)]<-""
head(dt) # Check the changes we've made

#Set column names for the figure
colnames(dt)[1]<-"b) Study (sex), Method"
colnames(dt)[2]<-"" #GV
colnames(dt)[6]<-"     PUFA  "
colnames(dt)[7]<-" life years (95% CI)"
colnames(dt)[8]<-"     "
colnames(dt)[9]<-"      " #MRE I p, I2GX
colnames(dt)[10]<-" " #GV
colnames(dt)[14]<-"     MUFA      "
colnames(dt)[15]<-"life years (95% CI) "
colnames(dt)[16]<-"        "
colnames(dt)[17]<-"   " #MRE I p, I2GX
colnames(dt)[18]<-"  " #GV
colnames(dt)[22]<-"      SFA    "
colnames(dt)[23]<-" life years (95% CI)  "
colnames(dt)[24]<-"         "
colnames(dt)[25]<-"             " #MRE I p, I2GX
head(dt)

# Set theme parameters such as color, height, etc.
tm <- forest_theme(ci_col="blue",
                   ci_lwd = 3,
                   ci_pch = 23,
                   ci_Theight =.2,
                   refline_col ="red",
                   refline_lty = "solid",
                   refline_lwd = 1.5,
                   footnote_cex =0.7)


# Create the forst plot
p<-NA
p <- forest(dt[,c(1:2, 6:10, 14:18, 22:25)],
            est = list(dt$est1,dt$est2,dt$est3),
            lower = list(dt$low1,dt$low2,dt$low3),
            upper = list(dt$hi1,dt$hi2,dt$hi3),
            #sizes = dt$se,
            #x_trans="log",
            ci_column = c(3,8,13),
            ref_line = c(0,0,0),
            #arrow_lab = c("Placebo Better", "Treatment Better"),
            xlim = list(c(-2,3),c(-2,3),c(-2,3)),
            ticks_at = list(c(-2,0,2),c(-2,0,2),c(-2,0,2)),
            footnote = " ",
            theme=tm)
plot(p) #View the forest plot. It may be cut off in the R viewer.

# Format the column header text
p<-add_text(p,text = expression(paste(bolditalic("P"))),
                    col = 5,
                    part = "header",
                    just = "left")
p<-add_text(p,text = expression(paste(bolditalic("P"))),
            col = 10,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bolditalic("P"))),
            col = 15,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bold("MRE I"),bolditalic("P, "),bold("I"["GX"]^"2"))),
            col = 6,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bold("MRE I"),bolditalic("P, "),bold("I"["GX"]^"2"))),
            col = 11,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bold("MRE I"),bolditalic("P, "),bold("I"["GX"]^"2"))),
            col = 16,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bold("GV#"))),
            col = 2,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bold("GV#"))),
            col = 7,
            part = "header",
            just = "left")
p<-add_text(p,text = expression(paste(bold("GV#"))),
            col = 12,
            part = "header",
            just = "left")
p <- add_border(p, part = "header")
plot(p)

# Export the finished product as a PNG
ggsave(filename = "Table 1b.png", plot = p,
       dpi = 300,
       width = 18, height = 2.5, units = "in")
