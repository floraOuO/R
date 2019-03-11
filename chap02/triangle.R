for (i in 0:4) {
 for(j in 0:4){
  if (i>=j) 
    cat("*")
  else
   cat(" ") 
 }
 cat("\n")
}
