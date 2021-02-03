//
//  Notes.swift
//  05_WordScramble
//
//  Created by Austin Roach on 2/2/21.
//

import Foundation


//MARK: Project 5, Part 1

//It's time for another new project, and this is actualy the last easy project we have of this course - after this the difficulty level ramps up a little as we tackle bigger apps, so enjoy this while it lasts!

//In this app you'll work with two of the real fundamentals of app development: List for working with tables of data, and strings, for handling text. Yes, we covered strings wuite a bit alread, but now we're really going to dig into them, including how to work with their Unicode representation so we can get compatibility with older Objective-C frameworks.

//Unicode is a standard for storing and representing text, which at first glance you might think sounds esy. But trust me on this: it really isn't. You know how I seaid sates are hard? Well, dates are easy compared to storing text properly. In fact, there's even a joke mug you can buy that says "I ? Unicode" - a painful reminder that when text representation goes bad all you see is a question mark where the symbol should be.

//Today you have four topics to work through and you'll meet List, Bundle, UITextChecker, and more.

// 1. Word Scramble: Introduction

//This project will be another game, although really it's just a sneaky way for me to introduce more Swift and SWiftUI knowledge! The game will show players a random eight-letter work, and askk them to make words out of it. For example, if the starter word is "alarming" they might spell "alarm", "ring", "main", and so on.

//Along the way you'll meet List, onAppear(), Bundle, fatalError(), adn more - all useful skills that you'll use for years to come. You'll also get some practice with @State, Alert, NavigationView, and more, which you should enjoy while you can - this is our last easy project!

//To get started, please create a new Single View App project called WordScramble. You'll need to downlod the files for this project, as it contains a file called start.txt that you'll be needing later on.

//Okay, oet's get into some code.


// 2. Introducing List, Your Best Friend

//Of all SwiftUI view types, List is the one you'll rely on the most. That doesn't mean you'll use it the most - I'm sure Text or VStack will claim that crown- more that it's such a workhorse that you'll come back to it time and time again. Ang this isn't new: the equivalent of List in UIKit was UITableView, and it got used just as much.

//The job of LIst is to probide a scrolling table of data. In fact, it's pretty much identical to Form, except it's used for presentation of data rather than requesting user input. Don't get me wrong: you'll use Form quite a lot too, but really it's just a specialized type of List.

//Just like FOrm, you can provide List a selection fo static views to have them rendered in individual rows:

/*
 List{
    Text("Hello World")
    Text("Hello World")
    Text("Hello World")
 }
 */

//We can also switch to ForEach in order to create rows dynamically from an array or range:

/*
 List {
    ForEach(0..<5) {
        Text("Dynamic row \($0)"0
    }
 }
 */

//Where things get more intersting is the way you can mix static and synamic rows:

/*
 List {
    Text("Static row 1")
    Text("Static row 2")
 
    ForEach(0..<5) {
        Text("Dynamic row \($0)")
    }

    Text("Static row 3")
    Text("Static row 4")
 }
 */

//And of course we can combine that with sections, to make our list easier to read:

/*
 List {
    Section(header: Text("Section 1")) {
        Text("Static row 1")
        Text("Static row 2")
    }
 
    Section(header: Text("Section 2")) {
        ForEach(0..<5) {
            Text("Dynamic row \($0)")
        }
    }
 
    Section(header: Text("Section 3")) {
        Text("Static row 3")
        Text("Static row 4")
    }
 }
 */

//Being able to have both static and dynamic content side by side lets us recreate something like the wifi screen in Appl'e Settings app - a toggle to enable Wi-fi system-wide, then a dynamic list of nearby networks, then some more static cells with ooptions to autojoin hotspots and so on.

//You'll notice that this list looks very different from the form we has previouslly, but really all you're seeing is a different table view style on iOS. We ca get a similar look and feel using the listStyle() modifier, like this:

//.listStyle(GroupedListStyle())

//Now, everything you've seen so far works fine with Form as well as List - even the dynamic content. But one thing List can do that Form can't is to generate its row entirely from dynamic content without needing a ForEach.

//So, if your entire list is made up of dynamic rows, you can simply write this:

/*
 List(0..<5) {
    Text("Dynamic row \($0)")
    }
 
 */

//This allows us to create lists really quickly, which is helpful given how common they are.

//In this project we're going to use LIst slightly differently, because we'll be making it loop over an array of strings. We've used ForEach with ranged a lot, eithher hard-coded (0..<5) or relying on variable data (0..< students.count), and that works great because SwiftUI can identify each row uniquely based on its position in the range.

//When working with an array of data, SwiftUI still needs to know how to identify each row uniquely, so if one gets removed it can simply remove that one rather than having to redraw the whole list. This is where the id parameter comes in, and it works identically in both List and ForEach - it lets us tell SwiftUI exactly what makes each item in the array unique.

//When working with arrays of strings and numbers, the only thing that makes those values unique isi the values themselves. That is, if we had the array [2, 4, 6, 8, 10], then those numbers themselves are themselves the unique identifiers. After all, we don't have anything else to work with!

//When working with this kind of list data, we use id: \.self like this:

/*
 struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"]
 
    var body: some VIew {
        List(people, id: \.self) {
            Text($0)
        }
    }
}
 */

//That works just the same with ForEach, so if we wanted to mix static and dynamic rows we could have written this instead:

/*
 List {
    ForEach(people, id: \.self) {
        Text($0)
    }
 }
 */
// 3. Loading Resources From Your App Bundle

// 4. Working with Strings


