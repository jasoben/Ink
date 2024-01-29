Creating choices is the action of the author that gives players the option for action, i.e. interaction. Ink gives us a couple of options for creating choices. 

- (start)
* I am still a bit confused with the fundamentals we covered last week, could you go over them again?
    Certainly! In last week's assignment, we had two basic operations: the Choice and the Gather. 
    
    The Choice is denoted by an "\*" (note: we had to use the "escape" character on the code side, which is a backslash, to tell the code that we want to print the astericks instead of making a new choice in the code-- otherwise everything after the \* would turn into choice text!)
    
    Choices have hidden text inside them. Anything on a new line between two \* lines is considered hidden text that will only be revealed if the player chooses that Choice.
    
    After a choice is made, we want to "gather" the player back to the story. The Gather is denoted by an \- (again: we had to "escape" the character, because if we printed a hyphen it would create a gather point)
    
    * * One new-ish thing is that we can have nested choices. 
    
        Nested choices also have nested "hidden" text, but it doesn't need to be denoted in any way. It's a good idea to indent it, though, to make it cleaner to read. 
        
        * * * You can keep nesting.
        
            * * * * And nesting...
                
                * * * * * And nesting ad infinitum...
                
                    But it's a good idea not to go too deep. 
    
    * * This is also a nested choice, but choose the one above. 
    
    - - You can also nest Gathers to have the player gather to some story beats inside a nested choice, before making another nested choice.
    
    * * Yet another nested choice, but after the Gather!
    
    * * Choosing either of these will finish the nesting choices and lead to the "first level" Gather point below starting with "HERE..."
    
* I am good on the fundamentals, let's get to the new stuff. 
    Sounds good, but don't sleep on the discussion of nested choices above in the first choice "hidden text" 
    * * Oooo! Take me back I want to read that stuff "in game", not just on the code side. 
    -> start
    * * I'm good, let's learn about diverts 
    -> diverts_are_diverting

- HERE is where we now gather the player after they made their choice(s). 
If we only have basic Choices and Gathers, however, the choices will be either 1. inconsequential, or 2. hard to read as nested story lines. 

For instance, like this:

You walk up to the ice cream store counter. 

"Which flavor would you like?"

* Vanilla 
"Vanilla it is!"
* Chocolate 
"Chocolate it is!"

- And you lived happily ever after. 

... SCENE!

Or...

* Vanilla
You live happily ever after.
* Chocolate
A whole bunch of other stuff happens.
    * * Another choice!
    We have to continue the story inside this nested choice, which can become cumbersom.

To have choices with consequences and / or to keep our code readable, we need to easily divert the story away in a new direction. 

* Ok how do I divert? -> diverts_are_diverting
* Forget diverts, I'd like to play with the killotron. 
-> killotron

== diverts_are_diverting ==

You can divert the story with... Diverts! Diverts are written with a hyphen and a "greater than" symbol, like so \-\> 

You only put them after choices, and they divert to what Ink calls a "Knot". Knots are signified with double equal signs 
\=\= and_then_a_title_without_spaces 

Once you have created a Knot, you type it after the Divert symbols and it will divert the story. 

That's it! When you're done, you need to a special kind of Divert that let's Inky know you're at the story end. 
If you don't write \-\> END your story will throw an error!

-> END

== killotron ==

Everybody dies. 

* Whoops! Nothing to see here... let's go back and learn about diverts. 
-> diverts_are_diverting
