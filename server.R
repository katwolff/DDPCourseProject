library(shiny)
library(UsingR)
#data(galton)

shinyServer(
  function(input, output) {
      alldata <- read.table('particle_pos_ori_seed5_pe5_a0.1_r00_dt0.1_L60_N5000spdrift.dat')
      
      # get z position and z orientation of particle trajectory and only use
      # last 10^5 data points
      zpos <- alldata$V3
      zpos <- zpos[(length(zpos)-100000):length(zpos)]
      zori <- alldata$V6
      zori <- zori[(length(zori)-100000):length(zori)]
      
    output$newHist <- renderPlot({
        
      xlow <- input$xlow
      xhigh <- input$xhigh
      
      # vector to store z orientations for which particle was in a certain
      #position slice
      zorislice <- numeric(length=0)
      
       for(i in seq(1:length(zpos))){
           
           if(zpos[i] <= xhigh && zpos[i] > xlow){
               # appending to existing vector must be very slow...
               zorislice <- c(zorislice, zori[i])
           }
       }
      
      hist(zorislice, xlab='Particle orientation (z component)', col='blue',main='Orientation distribution')
      })
    
  }
)
