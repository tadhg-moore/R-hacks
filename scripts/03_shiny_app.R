# Met data from: https://github.com/FLARE-forecast/FCRE-data/blob/fcre-metstation-data/FCRmet.csv

# You only need to do this once, otherwise it will slow down your Shiny app.
# Make sure to comment out after it is loaded in.
# met <- read.csv("https://raw.githubusercontent.com/FLARE-forecast/FCRE-data/fcre-metstation-data/FCRmet.csv", header = FALSE, skip = 154000)

# Name the columns
colnames(met) <- c("TIMESTAMP","RECORD","Battery_Voltage","PTemp_C","PAR_Den_Avg","PAR_Tot_Tot","Barometric_Pressure_kPA","Air_temp_degC","Relative_Humidity_%","Rain_mm","Wind_Spee_ms","WindDirection_degree","SWR_up_Wm2","SWR_down_Wm2","IR01UpCo_Avg","IR01DnCo_Avg","NR01TK_Avg","Albedo_Avg")

# View(met)

# plot(met$PAR_Den_Avg)

met$TIMESTAMP <- as.POSIXct(met$TIMESTAMP) # convert character to datetime object

library(shiny)

# User interface
ui <- fluidPage(
  
  # inputId is used to access this variable in the server code
  selectInput(inputId = "y_var", label = "Y-variable", choices = colnames(met)), # Each item must be separated by a comma as it is a separate argument to the fluidPage() function.
  # outputId is equal to what is assigned to output$id in the server
  plotOutput(outputId = "plot")
  
)

# R code to produce outputs for the user interface (ui)
server <- function(input, output, session) {
  
  # Curly braces are used to wrap the R-code to be rendered
  output$plot <- renderPlot({ # They plot is dynamically update so it renders the plot each time there is a change in the "y_var" input 
    plot(met$TIMESTAMP, met[[input$y_var]]) # create the plot
  })
  
}

shinyApp(ui, server) # Launch the shiny server
