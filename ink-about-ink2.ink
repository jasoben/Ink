In the last Ink tutorial, we talked about Choices, Gathers, Branching Choices, and how to show/hide Choice text.

In this file, we will learn better code statements to do branching narratives, starting with the Divert and the Knot. 

* Here is a choice. Notice in the code that it ends with a hyphen, left pacman (aka less-than sign), a space, and then some text WITHOUT any spaces: This is the Divert. -> our_first_knot 

* Here is another choice. Same deal as the first, but "points" to somewhere else 
-> our_second_knot 

=== our_first_knot ===

\-------------------------------------------------------- 
When you click this choice, you are sent by the Divert to this Knot. 

A question: why the line with lots of hyphens? 

Because I needed a way to demonstrate a key issue with Choices and Diverts. When you put a Divert right at the end of the line in a Choice, the Choice text will flow immediately into the text at the start of the Knot. Sometimes this is how we want it, but often it is not. 

* This question text will -> next_knot 

=== next_knot ===

flow into the text of the Knot, ignoring any whitespace and blank lines. 

* The only way to add in a blank line between them is to put the Divert on its own line in a Choice, like this:
    -> another_knot 
    
=== another_knot ===

Now the text in this Knot starts on its own line. 

* Ah, got it, so that's why Diverts need to be on their own line if we want separation between Choice text and Knot text. 
    -> more_about_knots_and_diverts

=== more_about_knots_and_diverts ===

Exactly. 

Let's talk a bit more about the syntax of Knots and Diverts.

The Knot takes the form of a line of two or three equal signs === followed by a string_of_text with no spaces (you can use underscores in lieu of spaces) then followed by three more equal signs (optionally)

Like this: === some_text_without_spaces ===

Or this: == some_text_without_spaces == 

The Divert takes the form \-> followed by the name of the Knot 

* Wait a second...

- Yes, keen eye'd readers who are tracking the Editor and the Preview will notice something fishy and confusing between what I wrote in the code here \-> vs what shows up in the Preview; see comments in code below!

PS (these aren't comments, this is still text in the Preview Pane, you need to look over to the Editor Pane if you are still reading this...)

// This is a comment! 

// So, regarding writing syntax with code statements: the Divert should be written -> in functional code, but if I want to write that in the code just for demonstration purposes, the code intepreter will still ACTUALLY interpret it, try to point to a Knot, and throw an error.

// So if I want to write it so the text shows up in the Preview, I have to "escape" the interpreter for a moment. The backslash \ is the Escape Character, which allows you to tell the interpreter that it shouldn't interpret what follows. 

* I have discovered the comments! (Don't click unless it's true...)

- This is Divert syntax with an Escape Character for demonstration purposes. \-> It doesn't actually go anywhere. Try deleting the backslash in code to see the error show up. 

* I've deleted the backslash on the code side, and seen the error.

- Nice! You might not use Escape Characters very often, but it's good to know they exist. 

* Quick question though, why didn't you need to use Escape Characters for the Knot statement on line 43? 

- Good question. That's because Knots are only interpretted when they are at the start of a line. If they are in the middle, the interpreter ignores them as code. 

* Cool.

- Getting back to Diverts, you'll notice in the first set of Choices of this file there was a second option to go to a different Knot. Choices do not HAVE to go to different Knots, though. You might have a set of Choices that all lead to the same Knot. 
This is known in Game Design as "The Illusion of Choice" -- players might notice this on multiple playthroughs, but if the narrative is well-written they hopefully won't notice it on their first playthrough. It gives them a sense of agency without actually giving any agency-- a tool in your toolbox to use where you see fit. 

* For instance, if you choose this choice, you'll learn something about how Knots and Diverts can be used to organize a story. 
    -> out_third_knot 

* If you choose this choice, you'll learn new Ink syntax and statements 
    -> out_third_knot

=== our_second_knot ===

This second Knot is just for demonstration purposes. 
* Ok, take me to the first one. -> our_first_knot


=== out_third_knot ===

Both lead to the same place. With choices in a game, you want the player to have the the thought, "I wonder what would have happened if I had chosen otherwise?"

Sometimes, "otherwise" leads to the same outcome, but it doesn't have to!

Diverts and Knots make it easier for your player to explore the story, and easier for you to organize your code. 

* Gotcha.

- There is another code statement that will come in handy: the Stitch. Stiches are just mini Knots. 

If you think about your file as a chapter in a book, then Knots are the places your player can go within that chapter, and Stitches are the areas  they can explore in that place. 

-> a_knot_with_stitches 

=== a_knot_with_stitches ===

WAIT!!! SOMETHING JUST HAPPENED IN THE CODE!!!

Yes. You'll notice that the Divert I just used above to get here was not connected to a Choice. You don't NEED to connect Choices and Diverts-- Diverts can just take the player to the new place seamlessly. This can help you keep your story organized. 

* Hmmmm... 

- In fact, you've already seen a Divert used this way, albeit to send the player to a "system default Knot". The \-> DONE statement at the end of the file is like a period at the end of a sentence. It tells the interpreter that this file has ended by "sending the player to DONE".

The reason we need the "DONE" is a concept in Ink that applies to all Knots: the interpreter needs to know where to go next. You'll notice that every Knot thus far has either had a Choice with Diverts OR a Divert at its end, telling the interpreter where to go next. If you don't have these, you'll get an error.

Try removing this Divert from the Choice in the code to get an error. 

* Don't click me yet, try removing the Divert first...
    -> moving_right_along 
    
= moving_right_along

When you removed the divert, the Knot had nowhere to go, so you got an error. 

* Ok. So I have to have a Divert to somewhere at the end of my Knot, or the interpreter get's confused.

- Yup. 

That's enough about Diverts, let's move on to Stitches. They look similar in terms of the Divert, but you'll see in the Code that the Stitch has only one equal sign = a_stitch and no trailing sign:

* To the first stitch -> first_stitch
* To the second stitch -> second_stitch
* To a stitch named, Fred -> a_stitch_named_fred
* To a random fourth stitch -> a_random_fourth_stitch

= first_stitch 
Here we are in the first Stitch
* Each Stitch, like a Knot, needs to go somewhere at its end. 
    -> moving_on_from_stitches
* { moving_on_from_stitches } MYSTERIOUS CHOICE. This mysterious choice is "beyond scope" for this lesson, but will be relevant in the next. You won't see it in the Preview during your first playthrough, but it will become available by the end. Click it to finish the lesson... 
    -> a_final_knot


= second_stitch
And here we are in the second. 
* Each Stitch, like a Knot, needs to go somewhere at its end. 
    -> moving_on_from_stitches

= a_stitch_named_fred 
And here we are in this one.
* Each Stitch, like a Knot, needs to go somewhere at its end. 
    -> moving_on_from_stitches

= a_random_fourth_stitch
And here we are in that one.
* Each Stitch, like a Knot, needs to go somewhere at its end. 
    -> moving_on_from_stitches


=== moving_on_from_stitches ===

The Stitch led us to this Knot, but it becomes a bit tricky to go back. 

If we try to navigate back to one of our previous Stitches using the same syntax as above \-> first_stitch , then Inky will throw an error.

In this final Knot, we will learn a key programming concept: scope

The Stitch is only "within scope" for the Knot that contains it. We use the ideas of scope in our daily life frequently. 

* Oh yeah, how so?

- For instance, if we were talking about famous restaurants in the U.S., and I said, you have to go to FAMOUS RESTAURANT on Main St, the listener would assume I meant Main St in our current city. If they go there, don't find it, and report back, it would be ridiculous for me to say, well yeah it's in NYC, duh. 

Since most cities have a Main St, we have to establish scope in our conversation first. The scope is NYC, the street is Main St. The Knot is a_knot_about_stitches, the Stitch is first_stitch. 

We can have a Stitch in THIS Knot titled first_stitch and it won't conflict with the same Stitch title in THAT Knot. Just like Main St in both cities. 

* Go to the first_stitch in this Knot. 
-> first_stitch

= first_stitch

We went to the "local" first_stitch. 

If we want to go the first_stitch in THAT Knot, we have to establish the scope. Just like saying "Main St in NYC" we say a_knot_about_stitches.first_knot, with the period separating the Knot and its Stitch. 

* Go to the first_stitch in a_knot_about_stitches. -> a_knot_with_stitches.first_stitch 

=== a_final_knot ===

Congrats! You made it to the end of the lesson. We learned about the following:

Choices 
Sub-Choices / Nested Choices / Branching Choices 
Gathers 
Hiding and showing Choice text
Knots 
Diverts 
Stitches 
Scope 

Please now complete the homework assignment in Canvas. Good luck!

-> DONE