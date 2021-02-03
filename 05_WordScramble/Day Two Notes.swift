//
//  Day Two Notes.swift
//  05_WordScramble
//
//  Created by Austin Roach on 2/2/21.
//

import Foundation

//MARK: Project 5, Part 2

//Now that you understand the techniques necesssary for this project, today we'll be implementing our game. Yes, there will be a fair chunk of practice here, and yes, hopefully this will be an easy project for you. But that shouldn't stop you from tackling it with gusto - give it your best shot!

//Try to keep in ind some famous words from the American writer and lecturer Dale Carnegie:

//"Don't be afraid to give your best to what seemingly are small jobs. Every time you conquer one it makes you strong - if you do the little jobs well, the big ones will tend to take care of themselves."

//Working with lists, arrays, text fields, and more should definitely be little jobs for you by now, but one of the goals of this course is to ive you a truly rocck solid foundation in those fundamentals, backed up by a knowledge of what greater things are also possible.

//In the future I want you to be able to look at a sketch of an app idea and know exactly how to build it before you've even written a line of code, because ultimately it can be broken down into a series of little jobs.

//And if you still find it too easy, relax: tomorrow is the challenge day!

//TOday you have three topics to work through, and you'll put into practice everything you learned about List, UITextChecker, adn more.

//MARK: 1. Adding to a List of Words

//The user interface for this app will be made up of three main SwiftUI views: a NavigationView showing the word they are spelling from, a TextField whrre they can enter one ansswer, adn a List showing all the words they have entered previously.

//For now, every timie users enter a word into the text fiels, we'll automatically add it to the list of used words. Later, though,we'll add some validation to make sure the word hasn't been used before, can actualy be produced from the root word they've been given, and is a real word and not just some random letters.

//Let's start with the basics: we need an array of words tay have already used, a root word for them to spelll other words from, and a string we can bind to a text field. So, add these three properties to ContentView now:

/*
 @State private var usedWords = [String]()
 @State private var rootWord = ""
 @State private var newWord = ""
 */
 //As for the body of the view, we're going to start off as simple as possible: a NAvigationView with rootWord for its title, then a VStack with a atext fields and a list:
 
 /*
 var body: some View {
    NavigationView {
        VStack {
            TextField("Enter your word", text: $newWord)
 
            List(usedWords, id: \.self) {
                Text($0)
            }
        }
        .navigationBarTitle(rootWord)
    }
 }
 */

//By giving usedWords to List directly, we're asking it to make one row for every word in the array, uniquely identified by the word itself. This would cause problems if there were lots of duplicates in usedWords, but soon enough we'll be disallowing that so it's not a problem.

//If yo run the program, you'll see the text field doesn't look great - it's not really even visible next to the navigation bar or the list. Fortunately, we can fix that by asking SwiftUI to draw a light gray border around its edge using the textFieldStyle() modifier. This usually looks best with a little padding around the edges so it doesn't touch the edges of the screen, so add these two modifiers to the tet field now:

/*
 .textFieldStyle(RoundedBorderTextFieldStyle())
 .padding()
 
 */


//That styling looks a little better, but the text view still has a problem: although we can type into the text box, we can't submit anything from there - there's no way of adding our entry to the list of used words.

//To fix that we're going to write a new method called addNewWord() that will:

//1. Lowercase newWord and remove any whitespace

//2. Check that it has at least 1 character otherwise exit

//3. Insert that word at position 0 in the usedWords array

//4. Set newWord back to be an empty string.

//Later on, we'll add some ectra validation between steps 2 and 3 to make sure the word is allowable, but for now this method is strighforard:

/*
 func addNewWord() {
    //lowercase and trim the word, to make sure we don't add duplicate words with case differences
 
    let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewLines)
 
    guard answer.count > else {
        return
    }
 
    // extra validation to come
 
    usedWords.insert(anwer, at: 0)
    newWord = ""
 }
 */


//We want to call addNewWord() when the user presses return on the keyboard, and in SwiftUI we can do that by providing an on commit closure for the text field. I know that sounds fancy, but in practice it's just a matter of providing a trailing closure to TextField that will be called whenever return is pressed.

//In fact, because the closure's signature - the parameteres it needs to accept and its return type - exactly matches the addNewWord() method we just wrote, we can pass that in directly:

//TextField("Enter your word", text: $newWord, onCommit: addNewWord)

//Run the app now and you'll see that things are starting to come together already:  we can now type words into the text field, press return, and see them appear in the list.

//Inside addNewWord() we used usedWords.insert(answer, at: 0) for a reason: if we had used append(answer) the new words would have appeared at the end of the list where they would probabl be off scree, but by inserting words at the start of the array they automatically slide in at the top of the list - much better.


//Before we put a title up in  the navigation view, I'm going to make two smallschanges to our layout.
//First, when we call adNewWord() it lowercases the word the user entered, which is helpful because it means the user can't add "car", "Car", and "CAR". However, it looks odd in practice: the text field automatically capitalizes whatever the user types, so when they submit "Car" what they see in the list is "car"/

//To fix this, we can disable capitalization for the text field with another modifier: autocapitalization(). please add this to the text field now:

//.autocapitalization(.none)

//The second thing we'll change, just because we can, is to use Apple's SF Symbols icons to show the length of each word next to the text. SF symbols provides numbers in circles from 0 through 50, all named using the format "x.circle.filll" - so 1.circle.fill, 20.circle.fill.

//In this program we'll be showing eight letter words to users, so if they rearrange all those letters to make a new word the longest it will be also eight letters. As a result, we can use those SF Symbols number circles just fine - we know that all possible word lengths are covered.

//If we use a second view inside a List row, SiftUI will automatically create an implicit horizontal stack for us so that everything in the row sits neatly side by side. What this means is we can just add Image(systemName:) directly inside the list and we're done:


/*
 List(usedWord, id: \.self) {
    Image(systemName: "\($0.count).circle")
    Text($0)
 }
 */

//If you run your app now you'll see you can type words in the text field, press return, then see them slide into the list with their length icon to the side. Nice!

//MARK: 2. Running Code When Our App Launches

//When XXcode build an iOS project, it puts your compiled program, you Info.plist file, your asset catalog, and any other assets into a single directory called a bundle, then gives that bundle the name YourAppName.app. This ".app" extension is automatically recognized by iOS and Apple's other platforms, which is why if you double-clock something like Notes.app on macOS it knows to launch the program insde the bundle.

//In our game, we already defined a property called rootWord, which will contain the word we want the player to spell from. What we need to do now is write a new method called startGame() that will:

//1. Find start.txt in our bundle

//2. Load it into a string

//3. Split that string into an array of strings, with each element being one word

//4. Pik one random word from there to be assigned to rrotWord, or use a sensible default if the array is empty.

//Each of those four tasks corresponds to one line of code, but there's a twist: what if we can't locate start.txt in our app bundle, or if we can locate it but we can't load it? In that case we have a serious problem, because our app ifs really brokem - either we forgot to include the file somehow (in which case our game won't work) or we includedf it but for somme reason iOS refused to let us read it (in which case our game won't work, and our app is broken).

//regardless of what caused it, this is a situation that never ought to happen, and Swift gives us a function called fatalError() that lets us detect problems really clearly. When we call fatalError() it will - unconditionally and always - cause our app to crash. It will just dies. Not "might die" or "maybe die": it will always just terminate straight away.

//I realize this sounds bad, but what it lets us do it impotant: for problems like this one, such as if we forget to include a file in our prject, there is no point in trying to make our app struggle on in a broken state. It's much better to terminate immediately and give us a clear explanation of what went wrong so we can corrent the problem, and that' exactly what fatalErro() does.

//Anyway, let's take a look a the code - I've added comments matching the numbers above:

/*
 func startGame() {
    //1 . Find the URl for start.txt in our app bundle
    if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
        //2. Load start.txt into a string
        if let startWords = try? String(contentsOf: startWordsURL) {
            //3. Split the string up into an array of strings, splitting on line breaks
            let allWords = sttartWords.components(separateBy: "\n")
 
            //4. Pick one random word, or use "silkworm" as a sensible default
            rootWord = allWords.randomElement() ?? "silkworm"
 
            //If we are here everything has worked, so we can exit
            return
 
        }
    }
 
    //If we are *here* then there was a problem - trigger a crash and report the error
    fatalError("Could not load start.txt from bundle.")
 }
 */

//Now that we have a method to load everything for the game, we need to actually call that thing whe our view is shwon. SwiftuI give us a dedicated view midifier for running when a view is shown, so we can use that to call startGame() and get things moving - add this modifier after navigationBarTitle():

//.onAppear(perform: startGame)

//If you run the game now you should see a random eight letter word at the top of the navigation eveiw. It doesn't really mean anything yet, because players can still enter whatever words they want. Let's fix that next...

//MARK: 3. Validating Words with UITextChecker
