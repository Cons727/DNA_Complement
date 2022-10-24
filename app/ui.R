# --- UI ---
fluidPage(
  titlePanel("Complementary Sequence"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("This program returns the complementary sequence of a DNA sequence. 
               Input box can be resized for better visualization by dragging the lower right corner.
               When a sequence in FASTA format is input, the complementary output will also be in FASTA format."),
      width=3
    ),
    
    mainPanel(
      fluidRow(
        h3("Input DNA Sequence"),
        textAreaInput("text_in", label = NULL, value= "", width = '95%', height = '35%',
                       placeholder="ATCNGAT...", resize = NULL),
        br(),
        actionButton("submit", label="Get Complement"),
        hr(),
      ),
      
      fluidRow(
        h3("Complementary Sequence"),
        tagAppendAttributes(verbatimTextOutput("text_out", placeholder = T),
                            style ="white-space:pre-wrap;")
      )
    )
  )
)
