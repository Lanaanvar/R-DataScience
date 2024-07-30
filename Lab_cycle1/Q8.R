is_palindrome <- function(pal_str){
  split_str <- strsplit(pal_str, NULL)[[1]]
  
  reversed_str <- rev(split_str)
  output_str <- paste(reversed_str, collapse="" )
  
  if (pal_str == output_str){
    print("The string is palindrome")
  }
}

is_palindrome("malayalam")