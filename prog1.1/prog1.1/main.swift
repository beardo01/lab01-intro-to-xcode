//
//  main.swift
//  prog1.1
//
//  Created by Oliver Reid on 7/11/18.
//  Copyright © 2018 Oliver Reid. All rights reserved.
//

import Foundation

/*
 * Checks a word for an emoji match and returns the corresponding Unicode. If no
 * emoji match is found, the word string is returned unchanged.
 *
 * @param: word - string to match emoji
 *
 * @return: String - utf code for matched emoj or the original string
 */

func emojicode(word: String) -> String {
    // Convert the characters in the string to lowercase and check for emoji match
    switch word.lowercased() {
    
    case "beer":
        return "\u{1F37A}"

    case "television", "tv":
        return "\u{1F4FA}"
        
        // Switch statements must cover all the cases, the default case is taken when
        // no other cases match
    
    default:
        return word
    }
}

func emojiate(str: String) -> String {
    // Break the string into seperate word tokens. Start with the empty token
    var word: String = ""
    var result: String = ""
    
    // Iterate over every character in the String
    for char: Character in str {
        // Check the character
        if(String(char) >= "A" && String(char) <= "z") {
            // If the next character is a letter, add it to the word token
            word.append(char)
        } else {
            // If the next character is not a letter, try to convert the last word
            // token to emoji and add it to result string (+ operater concetenates String)
            result += emojicode(word: word)
            
            // Add the current non-letter character to the result (swift doesn't allow addition of
            // Character to String, so use append instead)
            result.append(char)
            
            // Clear the word token
            word = ""
        }
    }
    
    // Add the last word token to the result string (matching it with emoji if possible)
    result += emojicode(word: word)
    
    return result
}

let myString = "No TV and no beer make Homer something something."

let emojiString = emojiate(str: myString)

print(emojiString)

