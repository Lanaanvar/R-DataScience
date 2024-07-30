data_compression <- function(string){
  str_elem <- strsplit(string, "")[[1]]
  print(str_elem)
  
  count <- 1
  compressed_string <- ""
  
  for (i in seq_along(str_elem)){
    if(i < length(str_elem) & str_elem[i]==str_elem[i+1]){
      count <- count+1
    }
    else{
      compressed_string <- paste0(compressed_string, str_elem[i], count)
      count <- 1
    }
  }
  
  print(compressed_string)

}

get_input <- function(){
  
  user_string <- readline("Enter string : ")
  
  data_compression(user_string)
}

get_input()