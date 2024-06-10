#Library
library(readxl)
clean_rainmaunawili <- read_excel("Documents/SPICE/Original/Excel/clean_rainmaunawili.xlsx")
clean_raingauge <- read_excel("Documents/SPICE/Original/Excel/clean_raingauge.xlsx")
clean_ecoli <- read_excel("Documents/SPICE/Original/Excel/clean_ecoli.xlsx")
magic_outer <- read_excel("Documents/SPICE/Original/Excel/clean_outer.xlsx")
combined_data <- read_excel("Documents/SPICE/Original/Excel/combined_data.xlsx")
Rain_Gauge_unclean <- read_excel("Documents/SPICE/Original/Excel/Rain Gauge unclean.xlsx")
E_Coli_unclean <- read_excel("Documents/SPICE/Original/Excel/E-Coli unclean.xlsx")
Outer_Magic_Island_unclean <- read_excel("Documents/SPICE/Original/Excel/Outer Magic Island unclean.xlsx")
Maunawili_unclean <- read_excel("Documents/SPICE/Original/Excel/Unclean/Rain/Maunawili unclean.xlsx")
Oahu_Visitors <- read_excel("Documents/SPICE/Oahu Visitors.xlsx")
Wailupe_Rain_unclean <- read_excel("Documents/SPICE/Original/Excel/Unclean/Rain/Wailupe Rain unclean.xlsx")
East_unclean <- read_excel("Documents/SPICE/Original/Excel/Unclean/EColi/East unclean.xlsx")
Cromwells_unclean <- read_excel("Documents/SPICE/Original/Excel/Unclean/EColi/Cromwells unclean.xlsx")

# Ensure that the DATE columns are in Date format
clean_ecoli$`collection date` <- as.Date(clean_ecoli$`collection date`)
clean_raingauge$DATE <- as.Date(clean_raingauge$DATE)

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

plot(Rain_Gauge_unclean$DATE, Rain_Gauge_unclean$DlySum,
     main = "Pali Rain Over Time",
     xlab = "Date",
     ylab = "Rainfall",
     col = "red",
     ylim = c(0, 1000),
     type = "l")

plot(Maunawili_unclean$DATE, Maunawili_unclean$DlySum,
     main = "Maunawili Rain Over Time",
     xlab = "Date",
     ylab = "Rainfall",
     col = "blue",
     ylim = c(0,850),
     type = "l")

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

plot(Wailupe_Rain_unclean$DATE, Wailupe_Rain_unclean$DlySum,
     main = "Wailupe Rain Over Time",
     xlab = "Date",
     ylab = "Rainfall",
     col = "blue",
     ylim = c(0,850),
     type = "l")

plot(East_unclean$`collection date`, East_unclean$`Enterococcus (mpn/100mL)`,
     main = "Ka'alawai East Enterococcus Over Time",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0, 27000),
     pch = 19,
     cex = 0.4,
     type = "l")

plot(Cromwells_unclean$`collection date`, Cromwells_unclean$`Enterococcus (mpn/100mL)`,
     main = "Cromwells Enterococcus Over Time",
     xlab = "Date",
     ylab = "Enterococcus (mpn/100mL)",
     col = "red",
     ylim = c(0,5500),
     pch = 19,
     cex = 0.4,
     type = "l")

magic_outer$`collection date` <- as.Date(magic_outer$`collection date`)
clean_raingauge$DATE <- as.Date(clean_raingauge$DATE)

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



