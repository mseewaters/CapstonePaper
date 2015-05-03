library("shinythemes")



numInputRow<-function (inputId, label, value="") 
{
  div(style="display:inline-block",
      tags$label(label, `for` = inputId), 
      tags$input(id = inputId, type = "numeric", value = value,class="input-small"))
}

# Define UI for the Web App
shinyUI(fluidPage(theme = "bootstrap.css", tags$style("body {background-color: Snow;}"),

  
#   fluidRow(
#     column(12, br(), div("Bringing Our Kids Home Safe", style="margin-left: 2.2in; font-size: 40pt"),
#            div("Assessing the risk of violence in an ongoing child abduction", style="margin-left: 2.2in; font-size: 24pt"),br(),br(), 
#           style = "background-image: url('header.png'); height=1800px")
#   ),
  fluidRow(
    column(3,img(src="images.jpg")),
    column(9,br(), h1("Bringing Our Kids Home Safe"),
           h3("Assessing the risk of violence in an ongoing child abduction"))

  ),
  hr(),
  fluidRow(
    
    column(5,
           h4("Enter incident information"),
           h5("Info should be based on the location where the incident took place.  
              If information is not known, select 'Unknown'."),
           hr(),
           fluidRow(
            column(5, selectInput('state', 'State:', choices = state.name, selectize=TRUE)),
            column(7, selectInput('county', 'County', choices = list("Cuyahoga","Franklin",
                                  "Hamilton","Johnson","Lubbock","Potter"), selectize=TRUE))
            ),
           fluidRow(
             column(5,selectInput('loc', 'Location of abduction:', 
                                  choices = list("Home","School","Road or transit","Park/outdoors", "Shopping","Other","Unknown"), 
                                  selectize=TRUE, selected = 'Unknown')),
             column(7,selectInput('hour', 'Time of day:', 
                                  choices = list("Early (10pm-6am)","Morning (6am-noon)","Afternoon (noon-6pm)","Night (6pm-10pm)", "Unknown"), 
                                  selectize=TRUE, selected = 'Unknown'))
           ),
           strong("Age of victims(s):"),
            p("Enter 0.5 for infants, at least one age must be entered"),
           fluidRow(
             column(3,numericInput("vicage1", label = ("#1"), value=NULL, max=17)),
             column(3,numericInput("vicage2", label = ("#2"), value=NULL, max=17)),
             column(3,numericInput("vicage3", label = ("#3"), value=NULL, max=17))
             ),
           
           strong("If offender is known or highly suspected:"),
           checkboxInput("multoff", label = "Were multiple offenders involved?", value = FALSE),
           
           fluidRow(
             column(5,selectInput('offage', 'Approx. age of offender:', 
                                  choices = list("<20","20-30","30-40","40-50", ">50","Unknown"), selectize=TRUE, selected = 'Unknown')),
             column(7,selectInput('relate', 'Relationship to Victim:', 
                                  choices = list("Parent","Other Family","Known or aquainted","Stranger", "Unknown"), selectize=TRUE, selected = 'Unknown'))
           )  
           
             ),
    column(7,
            fluidRow(
              column(3,br(),actionButton("calculate", label ="Calculate risk")),
              column(9, h4("Risk of violence for this incident is predicted to be:"),
                        h4(textOutput('table'), style="color:red"))
              ),
           hr(),
           strong("Methodology for this analysis:"), 
           p("Historical data was obtained from the National Incident-Based Reporting System (NIBRS) for the 
             years from 2010-2012.  The assessment methodolgy was evaluated on holdout data and shown 
             to accurately identify 60% of incidents where physical violence or substantial threat of 
             physical vilence existed.  This method incorrectly identified <10% of cases.  Risk assessments 
             should be used with caution and do not replace expert judgment based on specific factors of 
             an ongoing crime. Only 30% of the country reports to NIBRS; assessments for non-reporting counties 
             will be less accurate."),
           
           img(src="reportmap.png", height=400)
           
           )
  )
))

#state.division