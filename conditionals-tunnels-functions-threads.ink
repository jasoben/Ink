Conditionals, Functions, Tunnels, Threads

VAR hasKey = false 
VAR timer = 1
VAR hasPortalGun = false 

->start

== function advance_time(time_amount) ==
~ timer += time_amount

== function get_current_location(location) ==
~ return TURNS_SINCE(location)

== start ==
You close the door behind you. You know the IMPORTANT THING is here somewhere, but you only have ten minutes before ANTAGONIST comes home.

-> Hallway

== Hallway ==
-> antagonist_is_home ->
The hallway has three doors. One on the left, one on the right, and one directly ahead. 

+ You open the [Left door] and go in...
-> Bedroom
+ Right door 
-> Office
+ Center door 
-> Bathroom
+ Go back out front door 
-> exit


== Bedroom ==
{Bedroom > 1: You already searched here. -> Hallway }

Here is ANTANGONIST'S bedroom. It smells like them, unfortunately.

- (search_bedroom)
* Search the bed 
    You search the bed and find nothing. 
    ~ advance_time(1)
    -> search_bedroom
* Search the dresser
    ~ advance_time(2)
    You search the dresser and find nothing. -> search_bedroom
* Search the side table
    ~ advance_time(1)
    You search the side table and find a key! 
    ~ hasKey = true

- You finish searching the bedroom and return to the hallway.

-> Hallway


== Bathroom ==
Here is ANTANGONIST'S bathroom. They need to clean it.

- (search_bathroom)
* Search the medicine cabinet
    ~ advance_time(2)
    You search the medicine cabinet and find nothing. -> search_bathroom
* Search the trash can 
    ~ advance_time(1)
    You search the trash can and find nothing -> search_bathroom

- You finish searching the bathroom and return to the hallway.

-> Hallway

== Office ==
{ hasKey:
    The key works! You open the door. This is ANTAGONIST'S office, where they plan all their horrible deeds.
    -> search_office
- else:
    The door is locked.
    -> Hallway
}

= search_office 
    * Search desk 
    ~ advance_time(2)
        You search the desk and find the portal gun!
        This opens up some new options...
        ~ hasPortalGun = true
        -> search_office
    * Search waste basket
       ~ advance_time(1)
       You search the waste basket and find nothing.
       -> search_office
    * Search filing cabinet
        ~ advance_time(2)
        You search the filing cabinet and find nothing.
        -> search_office

== antagonist_is_home ==
{
    - timer > 8:
        Oh no! You hear the garage door opening! What will you do?
        + Get the heck out of here! -> exit
        + Stick around and try to find what you're looking for ->->
    - timer > 10:
        Oh no! You hear the hallway door open!
        ~ temp is_in_hallway = get_current_location(-> Hallway)
    - else: 
        ->->
}

== exit ==

-> DONE