//
//  Day Three Notes.swift
//  05_WordScramble
//
//  Created by Austin Roach on 2/3/21.
//

import Foundation


//MARK: Word Scramble: Wrap Up

//This project was the last chance to review the fundamentals of SwiftUI before we move on to greatere things with the next app. Still, we managaed to cover some useful things, not least List, onAppear, Bundle, fatalError(), UITextChecker, and more, and if you have another app you can extend it if you want to.

//One thing I want to pick out before we finish is my use of fatalError(). If you read code from my own projects on GitHub, or read some of my more advanced tutorials, you'll see that I rely on fatalError() a lot as a way of forcing code to shut down when something impssible has happened. The key to this technique - the thing that stops it from being recklessly dangerour - is knowing when a specific condition ought to be impossible. That comes with time and practice: there is no one quick list of all the places it's a good idea to use fatalError(), and instead you'll figure it our with experience.




//MARK: REVIEW WHAT YOU LEARNED

//MARK: CHALLENGE

//One of the best ways to learn is to write you own coe as often as possible, so here are three ways you should try extending this app to make sure you fully understand what's going on:

// 1. Disallow answers that are shorter than three letters or are just our start word. For the three-letter check, the easiest thing to do is put a check into isREal() that returns false if the word length is under three letters. For the second part, just compare the start word against their input word and return false if they are the same.

// 2. Add a left bar button that calls startGame(), so users can restart with a new word whenever they want to.

// 3. Put a text view below List so you can track and show the player's score for a given root word. How you calulate score is down to you, but something involving the number of words and their letter count would be reasonable.
