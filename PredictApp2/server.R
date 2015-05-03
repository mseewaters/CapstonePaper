library(shiny)
library(maps)
library(mapproj)
library(randomForest)

shell <- readRDS("data/shell.rds")
county <- readRDS("data/countydata.rds")

load("data/NIBRS_rf.rda")



shinyServer(function(input, output, clientData, session) {
  
  observe({
    # Change values for input$county
    updateSelectInput(session, "county",
                      choices = county[which(county$State==input$state),2])
  })

  output$table <- renderText({
    input$calculate 
    isolate({
      
   
    shell$victim.age[1] <- input$vicage1
    shell$hour.group[1] <- switch(input$hour,
                                  "Early (10pm-6am)" = "Early",
                                  "Morning (6am-noon)" = "Morning",
                                  "Afternoon (noon-6pm)"= "Afternoon",
                                  "Night (6pm-10pm)"= "Night",
                                  "Unknown" = "Unknown")
  

    shell$offenderage.group[1] <- input$offage
    shell$relationship.group[1] <- switch(input$relate,
                                          "Parent"= "Parent",
                                          "Other Family" = "Family",
                                          "Known or aquainted" = "Known",
                                          "Stranger" = "Stranger",
                                          "Unknown" = "Unknown")
    shell$loc.group[1] <- switch(input$loc,
                                 "Home"="Home",
                                 "Other"="Other",
                                 "Park/outdoors"="Park/outdoor",
                                 "Road or transit"="Road/transit",
                                 "School"="School",
                                 "Shopping"="Shopping",
                                 "Unknown"="Unknown")
    multvic <- ifelse(is.na(input$vicage2),0,2)
    multoff <- ifelse(!input$multoff,0,1)
    typecheck<- as.character(multvic+multoff)
    shell$type <- switch(typecheck,
                         "0"="SingleVO",
                         "1"="MultOff",
                         "2"="MultVic",
                         "3"="MultVO")
    shell$type <- factor(shell$type, levels=c("MultOff","MultVic","MultVO","SingleVO"))
    
    replace.list <- colnames(county)[4:12]
    demo <- county[which(county$County.Name==input$county&county$State==input$state),]
    
    for (i in replace.list) {shell[1,i] <- demo[1,i]}

    rowsel <- input$vicage1 
    if (is.na(rowsel))
      {result="Enter values to assess risk"} else
        if (is.na(shell[1,6]))
        {result="Mid-Atlantic states (NY,NJ,PA) cannot be predicted due to limited data"} else
          {pr.rf <- predict(model.rf, type="prob",shell[1,])[,2]*100
          result <- paste(pr.rf, "%")}
    return(result)
    })
    
    })
  
  output$df <- renderTable({
    
    shell$victim.age[1] <- input$vicage1
    shell$hour.group[1] <- switch(input$hour,
                                  "Early (10pm-6am)" = "Early",
                                  "Morning (6am-noon)" = "Morning",
                                  "Afternoon (noon-6pm)"= "Afternoon",
                                  "Night (6pm-10pm)"= "Night",
                                  "Unknown" = "Unknown")
    
    
    shell$offenderage.group[1] <- input$offage
    shell$relationship.group[1] <- switch(input$relate,
                                          "Parent"= "Parent",
                                          "Other Family" = "Family",
                                          "Known or aquainted" = "Known",
                                          "Stranger" = "Stranger",
                                          "Unknown" = "Unknown")
    shell$loc.group[1] <- switch(input$loc,
                                 "Home"="Home",
                                 "Other"="Other",
                                 "Park/outdoors"="Park/outdoor",
                                 "Road or transit"="Road/transit",
                                 "School"="School",
                                 "Shopping"="Shopping",
                                 "Unknown"="Unknown")
    multvic <- ifelse(is.na(input$vicage2),0,2)
    multoff <- ifelse(!input$multoff,0,1)
    typecheck<- as.character(multvic+multoff)
    shell$type <- switch(typecheck,
                         "0"="SingleVO",
                         "1"="MultOff",
                         "2"="MultVic",
                         "3"="MultVO")
    shell$type <- factor(shell$type, levels=c("MultOff","MultVic","MultVO","SingleVO"))
    
    replace.list <- colnames(county)[4:12]
    demo <- county[which(county$County.Name==input$county&county$State==input$state),]
    
    for (i in replace.list) {shell[1,i] <- demo[1,i]} 
    
    return(shell)
    
    
  })
  
 
}

)

