encrypt_character <- function(char, shift) {

  if (grepl("[A-Z]", char)) {

    new_position <- (utf8ToInt(char) - utf8ToInt("A") + shift) %% 26 + utf8ToInt("A")

    return(intToUtf8(new_position))
  }

  else if (grepl("[a-z]", char)) {

    new_position <- (utf8ToInt(char) - utf8ToInt("a") + shift) %% 26 + utf8ToInt("a")

    return(intToUtf8(new_position))
  }

  else {
    return(char)
  }
}


caesar_cipher <- function(sentence, shift) {

  chars <- strsplit(sentence, NULL)[[1]]

  encrypted_chars <- sapply(chars, encrypt_character, shift)

  encrypted_sentence <- paste(encrypted_chars, collapse = "")
  return(encrypted_sentence)
}


sentence <- readline("Enter a sentence to encrypt: ")


shift <- as.integer(readline("Enter the shift value: "))


encrypted_sentence <- caesar_cipher(sentence, shift)

cat("Encrypted sentence:", encrypted_sentence, "\n")
