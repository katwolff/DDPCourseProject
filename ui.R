library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Sedimentation of active particles"),
  sidebarPanel(
    strong("You can set a position slice to restrict the set of particles for which 
    the orientation distribution is calculated (for an illustration see the figure below)"),
    br(),
    p("Hint: The most interesting things happen for slices close to the lower or upper wall."),
    p("Caveat: If you make the slice very large, the histogram takes quite long to compute."),
    br(),
    sliderInput('xlow', 'Choose lower border',value = 50, min = 0, max = 60, step = 1,),
    br(),
    sliderInput('xhigh', 'Choose upper border',value = 60, min = 0, max = 60, step = 1,),
    br(),
    img(src="snapshotpe8thinnedout.png")
  ),
  mainPanel(
    strong("Here we look at the swimming direction of active particles (e.g. bacteria)
      that experience gravity and are trapped in a confining box."),
    br(),
    strong("Roughly speaking -1 means \"swimming down\" and +1 means \"swimming up\". "),  
    plotOutput('newHist'),
    br(),
    strong("What you should find:"),
    p("If you look at the entire box, particles have no preferred orientation
      as there is no aligning force acting on them. However, in individual slices
      distributions are non-uniform! This is a purely kinetic effect observed
      in self-propelled particles.")
  )
))
