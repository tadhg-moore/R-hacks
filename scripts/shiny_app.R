# Met data from: https://github.com/FLARE-forecast/FCRE-data/blob/fcre-metstation-data/FCRmet.csv

# You only need to do this once, otherwise it will slow down your Shiny app.
# Make sure to comment out after it is loaded in.
# met <- read.csv("https://raw.githubusercontent.com/FLARE-forecast/FCRE-data/fcre-metstation-data/FCRmet.csv", header = FALSE, skip = 154000)

# Name the columns
colnames(met) <- c("TIMESTAMP","RECORD","Battery_Voltage","PTemp_C","PAR_Den_Avg","PAR_Tot_Tot","Barometric_Pressure_kPA","Air_temp_degC","Relative_Humidity_%","Rain_mm","Wind_Spee_ms","WindDirection_degree","SWR_up_Wm2","SWR_down_Wm2","IR01UpCo_Avg","IR01DnCo_Avg","NR01TK_Avg","Albedo_Avg")

# View(met)