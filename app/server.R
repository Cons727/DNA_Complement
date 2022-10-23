# --- Load libraries ---
library(shiny)
library(stringr)

# --- Aux function ---
complement <- function(a){
  #res <- character(0) # Remove after action botton
  if (a == "N"){
    res <- "N"
  }
  else if(a == "A"){
    res <- "T"
  }
  else if(a == "T"){
    res <- "A"
  }
  else if(a == "C"){
    res <- "G"
  }
  else if(a == "G"){
    res <- "C"
  }
  else if(a == "\n"){
    res <- "\n"
  }
  res
}

# --- Server ---

function(input, output) {
  seqInput <- eventReactive(input$submit, {
   input$text_in
  })
  
  output$text_out <- renderText({
    seq <- seqInput()
    # Check if DNA sequence
    DNA_flag <- grepl("[^ACGNT\n]", seq)
    if (DNA_flag) {
      print("This is not a DNA sequence, which must only have A,T,C,G and N (for missing nucleotide).")
    }else{
      inv_seq <- character(0)
      for (i in 1:nchar(seq)) {
        inv_seq <- paste0(inv_seq, complement(substr(seq, i, i))
        )
      }
      print(inv_seq)
    }
  })
}
