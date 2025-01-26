
// Hi, quick comment here from Jason, here to say two things: one, the following is an introduction to the Ink language and the Inky text editor meant to be read simultaneously in the Editor panel (this panel, on the left) as well as the Preview panel (the panel to the write). I've done it this way so you get a sense of what it looks like to write Ink code, as well as some of the pitfalls you might encoutner. 

// If you are a seasoned programmer, you can probably skim through this or entirely skip it, using the Ink documentation instead. I would at least skim the second file ink-about-ink2.ink so you learn a best practice about branching stories before you start making your own.

// Two, you'll notice this text isn't showing up in the editor. That is because it is a comment. You use the // before a line to make it a comment, which means it only shows up in the Editor.   

/* You can also use this format /* if you want to write a multi-line comment. 

The commenting extends
Through multiple lines 
until you close it out with a */

// Comments are how programmers write notes to themselves and their collaborators, explaining the logic of their code. They are a great way to think through a problem in code before you start writing the code. 

// It is always better to have code with clear comments, but best of all is to write code that is so clear you don't need comments. 

Well, here we are in Inky. This file is intended to give you an interactive intro to the language and program. I encourage you to follow along in both the Editor window to the left (so you learn the syntax) and the Preview window to the right (so you see the effects). 

If you are only reading in the Preview pane thus far, please look over to the Editor pane and scroll to the top, to read comments. 

 * This is a choice. 
 
    And this is the text you will see if you click this choice. 
    
 * Here is another. You can tell it's a choice because of the asterisk on the left in the Editor window (sort of like a bullet point)
 
    You'll only see this text if you click this choice. 
    
 * Try adding a fourth choice titled "Would you kindly click this choice." (or w/e you want) below this one and then jump over to the preview pane on the right and do what you just politely asked yourself to do. Or you can disobey and click this choice, or the first two. I can't force the story one way or another; I've given up control of the narrative by making this interactive! 
    
    Here is text that only shows up for the third choice. 
    
- But did your choice matter?

* I don't know, did it?

- MWAHAHAHAHA NO! No matter what you chose, you end up back here. The author regains control! Of course, that author is now you. Or is it the player? 
BIG QUESTIONS.

* Ok, so what now?

- Why did it happen this way? Was our choice meaningless? And why is there a hyphen on this line in the Editor? 

The hyphen is called a "Gather", because it gathers the different branches back together after a choice has been made. 

* Choices can become much more complex.
    * * They can have Sub-Choices / Nested Choices / Branching Choices. Since you clicked the previous one, now you are into the Sub-Choices, as indicated by the double asterisks. 
        * * * Each one goes down a different path, but once you've made your choice, you're done. 
        * * * It doesn't matter which one you choose, this is the end of this narrative branch. 
    * * Here is another Sub-Choice. Notice in the code it is separated by Sub-Sub-Choices from its nearest Sub-Choice neighbor.
        * * * Each one goes down a different path, but once you've made your choice, you're finished. 
        * * * It doesn't matter which one you choose, this is the end of this narrative stem.
* Don't click me.
    * * Welp, now we're in a pickle. I could do something fancy to force you back to the choice I WANTED you to make, but we haven't learned how to do that yet, so I can't use that code. Instead I'd suggest using the back button (or the restart button) in the very upper right of the Inky window. They will allow you to go back a step or restart the whole story. 
        * * * You don't have to, of course, you can just keep clicking. 
            * * * * I promise it won't go anywhere though. 
                * * * * * Just deeper and deeper into asterisk madness.
                    * * * * * * Until the asterisks become the whole line. 
                        * * * * * * * Soon the whole world will be asterisks. There will no longer be room for text. 
                            * * * * * * * * What will that mean for the world? 
                                * * * * * * * * * The end?
                                    * * * * * * * * * * _
- And no matter what, you end up back here, at the Gather (again- denoted by the hyphen)


* Why do we have to use a Gather again?

- Aha. Without the Gather, Ink assumes the text is related to the Choice above it, so will only show that text when the Choice is made. 

* I am a choice. Click this one!

You'll never see this text if you don't click this choice. Use the Back Arrow in the upper right to go back and click the second choice (not the Restart Double Arrow, which restarts the whole story)


* And I am another (click me after you come back)

In the Editor, it seems like I'm continuing the narrative regardless of the Choice, but actually I only show up when the second Choice is made, despite appearing in the editor as if I'm a new line. You'll notice this text doesn't show up if you clicked the first choice (try going back again to verify)

- DON'T READ FURTHER UNTIL YOU'VE DONE BOTH CHOICES!

The Gather, on the other hand, brings the narrative back to a single track, before moving on.  

* Aha. Ok. So we use a Gather to bring the story back together, and Choices and Sub-Choices to create a branching storyline of different options?

- Correct with the Gather. And technically correct for the Choices and Sub-Choices: it would be possible to write a branching narrative this way, but incredibly cumbersome. As demonstrated by the asterisk madness above (which you may have missed if you were nice and obedient), your structure would become impossible to navigate as the Writer/Coder. 

We will learn a better way in the next ink file, but for now let's learn a bit more about Choices. 

* You'll notice, when you click on a Choice, that the Choice text gets written into the story. 

- In some stories, this will make sense, as you want the player to have a basic record of what they have done. 

* You walk into the drawing room. 

- Now, looking back, you know where you are. 

In other situations, you want the Choice to be simple, but the result to continue the narrative. 

* You decide [to go to the drawing room] that it would be best to take a moment to reflect in the drawing room. You walk down the hall, into the room, and go to turn on the lights. Your hand pauses at the switch, as you suddenly get the strange feeling you should leave the light off.

- You'll see in this example in the code that the words inside the brackets show up in the Choice, but not in the resulting text. 

If you put the whole choice in brackets, no text will show up. This is useful for quick dialog or tense moments where you want there to be a flow of reactions to the Choices, without the clunkiness of repeating the Choice. 

* ["Hello, is anybody there?"]

You are met by a rustle of papers. 

* [Whistle non-chalantly.]

A shadow in the corner seems to vibrate, slightly. 

- You shiver involuntarily. 

* You turn on the light... 

- TO BE CONTINUED! 

- One other technical aspect of Choice text-- you'll notice that everything to the left of the brackets makes it into the Choice text, and everything to the right gets left out, but comes back once you make the Choice. 

* You'll see this text in the Choice text[], but once you've made the choice this text will appear in the record of the Choice text. 

- That's all we need to know about Choices for now. Move on to the next Ink file to learn a better way to do branching narratives. 

PS (See this code below with DONE? This is required at the end of your story, otherwise Ink doesn't know where to stop! It is a very common error and we will discuss why in the next file.) 
    -> DONE

