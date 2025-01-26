Welcome back! Now that we've learned about Choices, Branching Choices, Gathers, Diverts, Knots, and Stitches, we'll round out our Ink knowledge with some final code statements. Feel free to approach these in any order. 

VAR visited_sections = 0
// What's this? Alas, a Global Variable already! Don't worry about it yet, but maybe you can puzzle out what it is doing as you explore this script, even before you read the section on it?

-> start

=== start ===
You've visited {visited_sections} sections already. Or, written with proper grammar, you've visited {turn_number_to_text(visited_sections)} section(s) already.
// Whoa whoa whoa. What is "turn_number_to_text"? First of all-- don't worry about it. It's beyond scope for this lesson. 

// If you're curious, though, it's a "function", which is a programming concept we will discuss later in the semester. The fuction logic is way at the bottom of this script.

// Anyway, back to the ACTUAL topics of this lesson

+ Sticky Choices 
    -> sticky_choices
+ Conditional Choices 
    -> conditional_choices
+ Fallback Choices 
    -> fallback_choices
+ Global Variables 
    -> global_variables
+ Local Variables 
    -> local_variables
+ Some introductory coding logic. 
    -> intro_to_logic

=== sticky_choices ===

STICKY CHOICES 

So, surprise, we've already used these in this script. If you look back at the primary menu, you'll see \+ signs where we had \* before. 
The \* Choice is a "normal" Choice, whereas the \+ Choice is a Sticky Choice. 

* [Ok, what's the difference?] 
    -> start_of_normal_choices_explanation

= start_of_normal_choices_explanation

When we use a normal Choice, that Choice no longer exists should we return to the same Knot or Stitch in our story. 
I'll demonstrate with a brief "behind door number..." scenario. Notice how each time you open a door, that choice disappears when we return to the three_doors Stitch. This models how we interact with the world. In the real world, you would not try to open door one again if it is already open, so Ink naturally eliminates that as a Choice once you have chosen it. 
One Choice-- the "how do I get out of here?" Choice, is Sticky, so it "sticks around" even after we visit the same Stitch multiple times. 

* Ok, take me to this door scenario...
    -> three_doors

= three_doors
Before you are three doors. Make your choice...

* I want to see what's behind door one
    -> door_one
* I want to see what's behind door two
    -> door_two
* I want to see what's behind door number three
    -> door_three
// Notice how the following Sticky Choice does not disappear like the normal Choices when we return to the three_doors stitch
+ Is there any way out of here?
    -> how_to_exit

= door_one 

There is nothing here but a wall. It was a fake door. 

* Ok, let's go back and see the others. 
    -> three_doors
    
= door_two

There is nothing here but a wall. It was a fake door. 

* Ok, let's go back and see the others. 
    -> three_doors
    
= door_three

There is nothing here but a wall. It was a fake door. 

* Ok, let's go back and see the others. 
    -> three_doors
    
= how_to_exit

// Conditional logic! If you jumped ahead and read the "intro to logic" section first, this will make sense, but if you are going in order and started with "Sticky Choices", ignore this for now-- we'll come back to it later.
{
- door_one and door_two and door_three: 
    With all three doors open, a secret passage appears.
+ Go through the secret passage 
    -> made_it_out
    
- not (door_one and door_two and door_three): 
You have to open all three doors. 
    -> three_doors
}


= made_it_out 

// Notice the use of Sticky Choices throughout the following section, due to the fact that you can backtrack multiple times. 

You go through a dark tunnel, lit by dim blue-purple arcane torches that sparkle gently with menacing energy. Behind the cold stone to your right you hear a perpetual scratching sound, as if someone, or something, were dragging a sharp object along the stones on the other side of the wall, keeping pace with your movement. 
+ Go further 
    You continue down the tunnel. For a while. And then another while. The scratching continues to match your progress. 
    When your ears pop, you realize you've been walking downhill, gradually. 
    Then, abruptly, the tunnel ends in a right angle turn to the right. 
    + + Go around the turn 
        There is an old stone door. 
        + + + Open the door. 
            The door open...
            * * * * And then?
            On the other side, the scratching stops...
                * * * * * AND THEN?
                Appearing slowly around the corner is...
                    * * * * * * YES????!!!!!
                    The main menu! You're back at the beginning. 
                    // Yikes more logic! All will be revealed eventually...
                    { sticky_choices < 2:
                      ~ visited_sections++
                    }
                    -> start
            
        + + + Turn back and retrace your steps. 
            After some time, you're back in the room with three doors. 
        -> three_doors
    + + Turn back and retrace your steps. 
        After some time, you're back in the room with three doors. 
        -> three_doors
+ Turn back 
    -> three_doors


-> start

=== conditional_choices ===

CONDITIONAL CHOICES 

Sometimes we don't want to give a player a Choice until they have done something else, gone somewhere else, or picked up an item.
If you already went through the Sticky Choices section, you'll have seem me using some (complex!) Conditional Choice logic in the door puzzle. 
The "simple" Conditional Choice just looks at whether a player has visited a Knot or Stitch ("sinple" compared to the "complex" logic I used in the door puzzle -- you may or may not experience the idea as "simple", depending on your familiarity with programming topics)
For instance, in the following we have two Sticky Choices, but you'll only see one in the Preview pane. 
-> two_choices

= two_choices

+ Choice One 
    -> choice_one 
+ {choice_one} Choice Two 
    -> choice_two 

= choice_one
Congrats! You visited the Stitch for Choice One. If you look back in the Editor, you'll see that Choice Two in the two_choices menu above had \{choice_one\} in front of it. That means it won't show up until we visit the choice_one Stitch. 

* Cool, since I have now visited choice_one, take me back so I can now choose Choice Two.
    -> two_choices

= choice_two 
Now you were able to visit Choice Two. And that's all for Conditional Choices (for now)! We'll get into a bit of the more complex conditional logic in the "intro to logic" section. 

// Slight preview for this piece of complex logic and Global Variables-- every time you visit a Knot or Stitch, Ink keeps tracks of how many times. This logic says, "On the first time we visit, increase the Global Variable "visited_sections" by one. This will be explained in depth in the other sections. 
{ conditional_choices < 2:
 ~ visited_sections++
}
* O.k. let's go back to the start
    -> start

=== fallback_choices ===

FALLBACK CHOICES 

You may have noticed already that if you run out of choices, Ink breaks. 
If not, here is a demo of it breaking. When it breaks, look for my comments below in the Editor.
-> three_choices

= three_choices 
* Choice One
    -> three_choices
* Choice Two 
    -> three_choices
* Choice Three 
    -> three_choices
// * -> my_awesome_fallback_choice_stitch
// Leave the above "commented out" for now! 
    
// Ok, so when it runs out of Choices, Ink doesn't know where to go. You can solve this by making one of the Choices into a Sticky Choice, but you won't always want a Sticky Choice. 
// So Ink gives us another statement: the Fallback Choice. This is not so much a "choice" as it is an exit condition. 
// Go back to the commented code for the fallback_choice above, and remove the double front slashes // to "un-comment" it, then restart the program with the restart arrow in the Preview Pane. 


= my_awesome_fallback_choice_stitch

With the "fallback choice" now active, Ink knows that once it runs out of choices it should just jump to the my_awesome_fallback_choice_stitch Stitch.
Notice that the Fallback Choice had no text, just a Divert to the Stitch. This tells Ink to choose it for us when we run out of Choices. 

* Cool, let's go back to the start. 
    -> start

=== global_variables ===

In coding, a variable is a container for information. It can hold many different types, which all have different uses. 
For the purposes of Ink in this HW, we'll only deal with three different variable types:
Boolean or "bool" values are either true or false. These are useful for knowing whether something has happened, whether a player has an object, whether the player knows something, etc. 

* Booleans, check. 

- String values are text strings, denoted with quotation marks such as "This is a text string." These are helpful for text that changes depending on circumstances. 

* Strings, check. 

- Integer values or "int" values are integer numbers like -1,0,1,2,3,etc. These can be added, subtracted, compared as greater than / less than, etc. Good for keeping track of how many of a thing or how many times a player has done something. 

Global Variables are set with the following syntax: 

\VAR my_variable_name_without_spaces = SOME VALUE
...where "SOME VALUE" can be a bool, string, or int (or others we won't talk about for now). 
Check out in the Editor as I define one of each type. 
VAR my_awesome_boolean = true 
VAR my_awesome_string = "so awesome"
VAR my_awesome_int = 100000

* Cool, so you defined some values. What can we do with them?

- Once you have values stored, you can either show them in text using curly brackets \{my_awesome_variable\} like this:
My awesome string variable is... {my_awesome_string}.
You can also change them by going into "code mode" with the tilda (~) in the Editor, like this: 
\~ my_awesome_string = "even more awesome"
~ my_awesome_string = "even more awesome"

* Nice, so how do we know it changed?
- If we "call" it again, we see it now has the new value. 
My awesome string variable is now... {my_awesome_string}.

* What about Integer and Boolean values?

They work the same way, but with some additional options. 
With a Boolean, you can "flip" it from true to false and vice versa with the "not" command.
\~ my_awesome_boolean = not my_awesome_boolean 
~ my_awesome_boolean = not my_awesome_boolean

It is {my_awesome_boolean} that we failed to change the value from true to false. 

And if we "not" it again...
~ my_awesome_boolean = not my_awesome_boolean

It is {my_awesome_boolean} that we changed the value from false to true.

* And integers?

- Integers can be added, subtracted, multiplied, etc.. 
\~ my_awesome_int = my_awesome_int * 5000

Originally my_awesome_int was {my_awesome_int}

~ my_awesome_int = my_awesome_int * 5000

Then I did some fancy math, and it is now {my_awesome_int}

* Gotcha. So what happens if I multiple a string times an integer?

- Ink breaks. (All coding languages would break, actually.) There are ways to get different variable types to interact, but that is beyond the scope of this lesson. 

// Slight preview for this piece of complex logic and Global Variables-- every time you visit a Knot or Stitch, Ink keeps tracks of how many times. This logic says, "On the first time we visit, increase the Global Variable "visited_sections" by one. This will be explained in depth in the other sections. 
{ global_variables < 2:
 ~ visited_sections++
}

* Ok. Back to the start with us!
    -> start

=== local_variables ===

LOCAL VARIABLES 

Though you can do these out of order,  I would recommend doing the Global Variables section prior to this one. 

+ Ok take me there
    -> global_variables
+ I'm good let's keep going 

- Local Variables, aka Temporary Variables operate the same way as Global Variables, except they have a limited scope. 
Remember scope from the last lesson? With the address of Main Street in Charlottesville and New York? 
Local Variables are like local restaurants. They only apply to the Main Street of the code. In this context, the Knot or Stitch where they are defined. 
Whereas Global Variables operate throughout the whole script (globally), local ones only operate inside their local context. 
* Ok, how do I define them?
- We defined Global Variables using the VAR code. Local Variables, aka Temporary Variables, use the temp code while in "code mode" via the tilda (\~). 
\~ temp my_awesome_temporary_variable = "so temporary"
~ temp my_awesome_temporary_variable = "so temporary" 

We can call on them the same way we did with Global Variables, using the \{curly brackets\}.
My temp variable says it is, {my_awesome_temporary_variable}.

Just beware, you can't access them outside their local scope. 

+ Go to a different Knot to test this out...
    -> a_different_knot
-> start

=== a_different_knot ===

In this Knot, if we try to access my_awesome_temporary_variable, we will get an error. Un-comment the code below to see the error.
//My temp variable says it is, {my_awesome_temporary_variable}.
* I've un-commented it in the Editor and seen the error.  

- 

* I see, so they only work within the scope of the Knot or Stitch they are in. 
- Correct! 
// Slight preview for this piece of complex logic and Global Variables-- every time you visit a Knot or Stitch, Ink keeps tracks of how many times. This logic says, "On the first time we visit, increase the Global Variable "visited_sections" by one. This will be explained in depth in the other sections. 
{ local_variables < 2:
 ~ visited_sections++
}
+ All right, let's go back to the start...
-> start
=== intro_to_logic ===

So, surprise, we've already used these in this script. 

-> start


=== function turn_number_to_text(num) ===

{ num: 
- 0: 
    ~ return "zero"
- 1: 
    ~ return "one"
- 2:  
    ~ return "two"
- 3:  
    ~ return "three"
- 4:  
    ~ return "four"
- 5:  
    ~ return "five"
- 6: 
    ~ return "six"
}