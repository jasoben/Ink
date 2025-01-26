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

 

-> start

=== local_variables ===

So, surprise, we've already used these in this script. 

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
