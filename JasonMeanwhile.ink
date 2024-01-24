Go get ice cream
// These are "non-trivial" choices, so they divert to different knots
* Chocolate -> chocolate 
* Vanilla -> vanilla

== vanilla ==

You go home and life continues

-> END

== chocolate ==

To the factory, where you get sick and ask to use the bathroom.

// This is a trivial choice in that both lead to the same "gather" point below; we don't need diverts for them.
* Leave bathroom 
    You leave and wander around.
* Look in medicine cabinet
    You look and find some band aids, but the box is empty.
    
// Below with the hypen is the "gather" point for the previous trivial choices. Both of them will return here after showing their text. NOTE it doesn't NEED a label (professor), but we use one so we can divert to this gather point in the future. We use a Gather instead of a Knot because we'd need to write Diverts for each choice above to the Knot, and that would get hella cumbersome if we had tons of trivial choices all with -> professor written after them. Knots and Diverts are only for non-trivial choices.
-  (professor) Return to professor. 

Talk to professor and play with toys:

* Time machine -> time_machine
* Killitron -> killitron
* SQUID -> squid

// Now we can switch to using "stiches" from within the professor's room. These maintain scope so that we can go back to the (professor) label / gather point from within. If we used Knots instead for each machine, we'd have to address that Knot and then the label. Still ok, but Stitches make more sense to me here since we're still in the same room.
= time_machine 
Do you want to play with time machine?

* yes -> time_machine_madness // Now some totally new stuff can happen, so we Divert to a new Knot
* no -> professor // Note that within a Knot, Stitches and Labels don't need to be addressed by their Knot, whereas outside a Knot, you have to write -> chocolate.professor to access it because everything in the == chocolate == Knot is outside scope for other Knots

- You proceed to play with the time machine
-> professor // Back to the (professor) label on the Gather

= killitron 
The killitron -> professor
= squid 
The SQUID -> professor

== time_machine_madness == // Here's the new Knot we went to from above. 

All sorts of random things happen when we go back in time.

Our old self approaches, where do we hide?

* Time machine -> time_machine // note that this WON'T find the "stitch" for time_machine above, if we wanted to go there we'd use chocolate.time_machine; it might be better practice to use a different Stitch name, unless maybe we have similar Stitches in multiple different Knots, and it makes sense to have them all the same name so we can address them easily. For now, though, we're just addressing the Stitches in THIS Knot, which are different than the Stiches in the previous Knot (since we're hiding in them, not playing with them, I guess?)
* killitron -> killitron
* run to exit -> run_to_exit

= time_machine

Hide in the time machine -> END

= killitron 

Hide in killitron -> END

= run_to_exit

Run to exit 
-> END

