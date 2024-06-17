#Library
library(readxl)
#new ecoli data
Waialae_Beach_Park_historical <- read_excel("~/Documents/SPICE/New Data/Waialae Beach Park historical.xlsx")
South_Kaneohe_Bay_historical <- read_excel("~/Documents/SPICE/New Data/South Kaneohe Bay historical.xlsx")
Pupukea_Tidepools_historical <- read_excel("~/Documents/SPICE/New Data/Pupukea Tidepools historical.xlsx")
Magic_Island_Canoe_Launch_historical <- read_excel("~/Documents/SPICE/New Data/Magic Island Canoe Launch historical.xlsx")
Magic_Island_Bowls_historical <- read_excel("~/Documents/SPICE/New Data/Magic Island Bowls historical.xlsx")
Kuli_ou_ou_Stream_historical <- read_excel("~/Documents/SPICE/New Data/Kuli'ou'ou Stream historical.xlsx")
Kaimalino_historical <- read_excel("~/Documents/SPICE/New Data/Kaimalino historical.xlsx")
Kahalu_u_historical <- read_excel("~/Documents/SPICE/New Data/Kahalu'u historical.xlsx")
Ka_alawai_Black_Point_East_historical <- read_excel("~/Documents/SPICE/New Data/Ka'alawai (Black Point- East) historical.xlsx")
Ka_alawai_Black_Point_Cromwells_historical <- read_excel("~/Documents/SPICE/New Data/Ka'alawai (Black Point_Cromwells) historical.xlsx")
Hakipu_u_Boat_Ramp_historical <- read_excel("~/Documents/SPICE/New Data/Hakipu'u Boat Ramp historical.xlsx")
Chocolates_historical <- read_excel("~/Documents/SPICE/New Data/Chocolates historical.xlsx")

#ecoliunclean
Cromwells_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/EColi/Cromwells unclean.xlsx")
E_Coli_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/EColi/E-Coli unclean.xlsx")
East_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/EColi/East unclean.xlsx")
Outer_Magic_Island_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/EColi/Outer Magic Island unclean.xlsx")

#rainunclean
Maunawili_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/Rain/Maunawili unclean.xlsx")
Rain_Gauge_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/Rain/Rain Gauge unclean.xlsx")
Wailupe_Rain_unclean <- read_excel("~/Documents/SPICE/Original/Excel/Unclean/Rain/Wailupe Rain unclean.xlsx")


# Ensure that the DATE columns are in Date format
clean_ecoli$`collection date` <- as.Date(clean_ecoli$`collection date`)
clean_raingauge$DATE <- as.Date(clean_raingauge$DATE)
Outer_Magic_Island_unclean$`collection date` <- as.Date(Outer_Magic_Island_unclean$`collection date`)

# Create the initial plot for E.coli data
plot(clean_ecoli$`collection date`, clean_ecoli$`Enterococcus (mpn/100mL)`,
     main = "Comparison of Inner Enterococcus and Rainfall Data",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 9000),
     pch = 19,
     cex = 0.4)

# Add a line to connect the Enterococcus data points
lines(clean_ecoli$`collection date`, clean_ecoli$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

# Overlay the rainfall data as a line plot on the same y-axis
lines(clean_raingauge$DATE, clean_raingauge$DlySum,
      col = "blue",
      lty = "solid")

# Adding the legend
legend("topright", legend = c("Enterococcus", "Rainfall"),
       col = c("red", "blue"), pch = c(19, NA), lty = c(NA, 1), cex = 0.8)

# Inner Ecoli and Maunawili Rain
plot(E_Coli_unclean$`collection date`, E_Coli_unclean$`Enterococcus (mpn/100mL)`,
     main = "Comparison of Inner Enterococcus and Maunawili",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 9000),
     pch = 19,
     cex = 0.4)

lines(E_Coli_unclean$`collection date`, E_Coli_unclean$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

lines(Maunawili_unclean$DATE, Maunawili_unclean$DlySum,
      col = "blue",
      lty = "solid")

legend("topright", legend = c("Enterococcus", "Rainfall"),
       col = c("red", "blue"), pch = c(19, NA), lty = c(NA, 1), cex = 0.8)

# Outer Ecoli and Maunawili Rain
plot(clean_outer$`collection date`, clean_outer$`Enterococcus (mpn/100mL)`,
     main = "Comparison of Outer Enterococcus and Maunawili",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 2000),
     pch = 19,
     cex = 0.4)

lines(magic_outer$`collection date`, magic_outer$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

lines(clean_rainmaunawili$DATE, clean_rainmaunawili$DlySum,
      col = "blue",
      lty = "solid")

legend("topleft", legend = c("Enterococcus", "Rainfall"),
       col = c("red", "blue"), pch = c(19, NA), lty = c(NA, 1), cex = 0.8)

# Graphing Pali Rain
plot(Rain_Gauge_unclean$DATE, Rain_Gauge_unclean$DlySum,
     main = "Pali Rain Over Time",
     xlab = "Date",
     ylab = "Rainfall",
     col = "red",
     ylim = c(0, 1000),
     type = "l")

# Graphing Maunawili Rain
plot(Maunawili_unclean$DATE, Maunawili_unclean$DlySum,
     main = "Maunawili Rain Over Time",
     xlab = "Date",
     ylab = "Rainfall",
     col = "blue",
     ylim = c(0,850),
     type = "l")

# Graphing Cromwells Ecoli and Wailupe Rain
plot(Cromwells_unclean$`collection date`, Cromwells_unclean$`Enterococcus (mpn/100mL)`,
     main = "Comparison of Cromwells Enterococcus and Wailupe",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 5000),
     pch = 19,
     cex = 0.4)

lines(Cromwells_unclean$`collection date`, Cromwells_unclean$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

lines(Wailupe_Rain_unclean$DATE, Wailupe_Rain_unclean$DlySum,
      col = "blue",
      lty = "solid")

legend("topleft", legend = c("Enterococcus", "Rainfall"),
       col = c("red", "blue"), pch = c(19, NA), lty = c(NA, 1), cex = 0.8)

# Graphing East Data and Wailupe
plot(East_unclean$`collection date`, East_unclean$`Enterococcus (mpn/100mL)`,
     main = "Comparison of Ka'alawai East and Wailupe",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 27000),
     pch = 19,
     cex = 0.4)

lines(East_unclean$`collection date`, East_unclean$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

lines(Wailupe_Rain_unclean$DATE, Wailupe_Rain_unclean$DlySum,
      col = "blue",
      lty = "solid")

legend("topleft", legend = c("Enterococcus", "Rainfall"),
       col = c("red", "blue"), pch = c(19, NA), lty = c(NA, 1), cex = 0.8)

# Graphing Wailupe Rain
plot(Wailupe_Rain_unclean$DATE, Wailupe_Rain_unclean$DlySum,
     main = "Wailupe Rain Over Time",
     xlab = "Date",
     ylab = "Rainfall",
     col = "blue",
     ylim = c(0,850),
     type = "l")

# Graphing East Ecoli
plot(East_unclean$`collection date`, East_unclean$`Enterococcus (mpn/100mL)`,
     main = "Ka'alawai East Enterococcus Over Time",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 27000),
     pch = 19,
     cex = 0.4,
     type = "l")

# Graphing Cromwells Ecoli
plot(Cromwells_unclean$`collection date`, Cromwells_unclean$`Enterococcus (mpn/100mL)`,
     main = "Cromwells Enterococcus Over Time",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,5500),
     pch = 19,
     cex = 0.4,
     type = "l")

# Graphing Chocolates Ecoli
plot(Chocolates_historical$`collection date`, Chocolates_historical$`Enterococcus (mpn/100mL)`,
     main = "Chocolates Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,3100),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Chocolates_historical$`collection date`, Chocolates_historical$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

# Graphing Hakipu_u
plot(Hakipu_u_Boat_Ramp_historical$`collection date`, Hakipu_u_Boat_Ramp_historical$`Enterococcus (mpn/100mL)`,
     main = "Hakipu'u Boat Ramp Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,1100),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Hakipu_u_Boat_Ramp_historical$`collection date`, Hakipu_u_Boat_Ramp_historical$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

# Graphing Ka'alawai BlackPoint-Cromwells
plot(Ka_alawai_Black_Point_Cromwells_historical$`collection date`, Ka_alawai_Black_Point_Cromwells_historical$`Enterococcus (mpn/100mL)`,
     main = "Ka'alawai BlackPoint Cromwells Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,950),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Ka_alawai_Black_Point_Cromwells_historical$`collection date`, Ka_alawai_Black_Point_Cromwells_historical$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

# Graphing Ka'alwai BlackPoint East
plot(Ka_alawai_Black_Point_East_historical$`collection date`, Ka_alawai_Black_Point_East_historical$`Enterococcus (mpn/100mL)`,
     main = "Ka'alwai BlackPoint East Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,550),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Ka_alawai_Black_Point_East_historical$`collection date`, Ka_alawai_Black_Point_East_historical$`Enterococcus (mpn/100mL)`,
      col = "blue",
      lty = "solid")

# Graphing Kahalu'u
plot(Kahalu_u_historical$`collection date`, Kahalu_u_historical$`Enterococcus (mpn/100mL)`,
     main = "Kahalu'u Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,10150),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Kahalu_u_historical$`collection date`, Kahalu_u_historical$`Enterococcus (mpn/100mL)`,
      col = "orange",
      lty = "solid")

# Graphing Kaimalino
plot(Kaimalino_historical$`collection date`, Kaimalino_historical$`Enterococcus (mpn/100mL)`,
     main = "Kaimalino Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,450),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Kaimalino_historical$`collection date`, Kaimalino_historical$`Enterococcus (mpn/100mL)`,
      col = "lightblue",
      lty = "solid")

# Graphing Kuli'ou'ou
plot(Kuli_ou_ou_Stream_historical$`collection date`, Kuli_ou_ou_Stream_historical$`Enterococcus (mpn/100mL)`,
     main = "Kuli'ou'ou Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,15550),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Kuli_ou_ou_Stream_historical$`collection date`, Kuli_ou_ou_Stream_historical$`Enterococcus (mpn/100mL)`,
      col = "brown",
      lty = "solid")

# Graphing Magic Island Bowls
plot(Magic_Island_Bowls_historical$`collection date`, Magic_Island_Bowls_historical$`Enterococcus (mpn/100mL)`,
     main = "Magic Island Bowls Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,1250),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Magic_Island_Bowls_historical$`collection date`, Magic_Island_Bowls_historical$`Enterococcus (mpn/100mL)`,
      col = "purple",
      lty = "solid")

# Graphing Magic Island Canoe Launch
plot(Magic_Island_Canoe_Launch_historical$`collection date`, Magic_Island_Canoe_Launch_historical$`Enterococcus (mpn/100mL)`,
     main = "Magic Island Canoe Launch Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,6000),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Magic_Island_Canoe_Launch_historical$`collection date`, Magic_Island_Canoe_Launch_historical$`Enterococcus (mpn/100mL)`,
      col = "black",
      lty = "solid")

# Graphing Pupukea Tidepools
plot(Pupukea_Tidepools_historical$`collection date`, Pupukea_Tidepools_historical$`Enterococcus (mpn/100mL)`,
     main = "Pupukea Tidepools Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "black",
     ylim = c(0,250),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Pupukea_Tidepools_historical$`collection date`, Pupukea_Tidepools_historical$`Enterococcus (mpn/100mL)`,
      col = "orange",
      lty = "solid")

# Graphing South Kaneohe Bay
plot(South_Kaneohe_Bay_historical$`collection date`, South_Kaneohe_Bay_historical$`Enterococcus (mpn/100mL)`,
     main = "South Kaneohe Bay Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,1400),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(South_Kaneohe_Bay_historical$`collection date`, South_Kaneohe_Bay_historical$`Enterococcus (mpn/100mL)`,
      col = "green",
      lty = "solid")

# Graphing Waialae Beach Park
plot(Waialae_Beach_Park_historical$`collection date`, Waialae_Beach_Park_historical$`Enterococcus (mpn/100mL)`,
     main = "Waialae Beach Park Enterococcus 2020",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "black",
     ylim = c(0,500),
     pch = 19,
     cex = 0.4,
     type ="p")

lines(Waialae_Beach_Park_historical$`collection date`, Waialae_Beach_Park_historical$`Enterococcus (mpn/100mL)`,
      col = "blue",
      lty = "solid")

# Graphing Outer Ecoli
plot(Outer_Magic_Island_unclean$`collection date`, Outer_Magic_Island_unclean$`Enterococcus (mpn/100mL)`,
     main = "Outer Magic Island Enterococcus",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     pch = 19,
     cex = 0.4,
     ylim = c(0, 5500),
     type="l")


magic_outer$`collection date` <- as.Date(magic_outer$`collection date`)
clean_raingauge$DATE <- as.Date(clean_raingauge$DATE)

#Graphing Outer Ecoli to Pali Rain
plot(magic_outer$`collection date`, magic_outer$`Enterococcus (mpn/100mL)`,
     main = "Comparison of Outer Enterococcus and Rainfall Data",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "black",
     ylim = c(0,2000),
     pch = 19,
     cex = 0.6)

lines(magic_outer$`collection date`, magic_outer$`Enterococcus (mpn/100mL)`,
      col = "red",
      lty = "solid")

# Overlay the rainfall data as a line plot on the same y-axis
lines(clean_raingauge$DATE, clean_raingauge$DlySum,
      col = "blue",
      lty = "solid")

# Adding the legend
legend("topleft", legend = c("Enterococcus", "Rainfall"),
       col = c("black", "blue"), pch = c(19, NA), lty = c(NA, 1), cex = 0.8)

# Graphing Inner to Outer
install.packages("readxlsx")
install.packages("lubridate")
install.packages("ggplot2")
install.packages("scales")
install.packages("gridExtra")
install.packages("ggthemes", dependencies = TRUE)
install.packages("janitor")
install.packages("pivotaltrackR")
install.packages("pivottabler")
install.packages("here")
install.packages("tidyverse")
install.packages("plotly")
install.packages("lubridate")

library(readxl)
library(lubridate)# for working with dates
library(ggplot2)  # for creating graphs
library(scales)   # to access breaks/formatting functions
library(gridExtra) # for arranging plots
library(janitor)
library(pivotaltrackR)
library(pivottabler)
library(here)
library(tidyverse)
library(plotly)``
library(lubridate)

# Graphing Inner to Outer Ecoli 
ggplot(combined_data, aes(`collection date`)) + 
  geom_line(aes(y = `Enterococcus (mpn/100mL).x`, color = 'darkblue')) + 
  geom_line(aes(y = `Enterococcus (mpn/100mL).y`, color = 'red')) +
  scale_color_manual(values = c('darkblue', 'red'), 
                     labels = c('inner', 'outer'))+
  ggtitle("Comparing Enterococcus to Outer and Inner Magic Island")  # Title added here
