library(stringi)

count_words <- function(para) {
  word_set <- unique(tolower(strsplit(para, "\\s+")[[1]]))
  word_count <- length(word_set)
  print(word_count)
  return(word_set)
}

avg_word_length <- function(word_list) {
  word_length <- sapply(word_list, nchar)
  mean_length <- mean(word_length)
  print(mean_length)
  return(word_length)
}

print_longest_word <- function(word_length) {
  max_length <- max(word_length)
  longest_words <- names(word_length[word_length == max_length])
  print(longest_words)
}

replace_word <- function(replaced_word, replacement_word, word_list) {
  if (replaced_word %in% word_list) {
    word_list[which(word_list == replaced_word)] <- replacement_word
  }
  print(word_list)
}

# Generate lorem ipsum paragraph
paragraph <- lorem_ipsum(1)

word_list <- count_words(paragraph)
word_length <- avg_word_length(word_list)
print_longest_word(word_length)
replace_word('voluptatem', 'aaaaaaaaaa', word_list)

