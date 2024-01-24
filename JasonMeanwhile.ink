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
    
// This is the "gather" point for the previous trivial choices. Both of them will return here after showing their text. NOTE it doesn't NEED a label, but use one so we can divert to this gather point in the future. We use a Gather instead of a Knot because we'd need to write Diverts for each choice above to the Knot, and that would get hella cumbersome if we had tons of trivial choices.
-  (professor) Return to professor. 

Talk to professor and play with toys:

* Time machine -> time_machine
* Killitron -> killitron
* SQUID -> squid

// Now we can switch to using "stiches" from within the professor's room. These maintain scope so that we can go back to the (professor) label / gather point from within
= time_machine 
Do you want to play with time machine?

* yes -> time_machine_madness // lots can happen here, so we jump to a new knot
* no -> professor

- You proceed to play with the time machine
-> professor

= killitron 
The killitron -> professor
= squid 
The SQUID -> professor

== time_machine_madness ==

All sorts of random things happen when we go back in time.

Our old self approaches, where do we hide?

* Time machine -> time_machine // note that this can't find the "stitch" for time_machine above, if we wanted to go there we'd use chocolate.time_machine
* killitron -> killitron
* run to exit -> run_to_exit

= time_machine

Hide in the time machine -> END

= killitron 

Hide in killitron -> END

= run_to_exit

Run to exit 
-> END

