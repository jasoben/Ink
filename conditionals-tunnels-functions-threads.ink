<h3>Conditionals, Functions, Tunnels, Threads</h3>
<h4>A story of sorts</h4>

VAR hasKey = false 
VAR timer = 1
VAR hasPortalGun = false 
VAR garageIsOpen = false
VAR foyerDoorIsOpen = false

->start

== function advance_time(time_amount) ==
~ timer += time_amount

== function get_current_location(location) ==
~ return TURNS_SINCE(location)

== portal_choices ==
+ Pull the trigger on the portal gun -> DONE
+ Turn the knob on the portal gun -> DONE

== start ==
You close the door behind you. You know the PORTAL GUN is here somewhere, but you only have ten minutes before ANTAGONIST comes home.

-> Hallway

== Hallway ==

-> antagonist_is_home ->
The hallway has three doors. One on the left, one on the right, and one directly ahead. 

<- bedroom_choices
{hasPortalGun: <- portal_choices}

-> DONE

= bedroom_choices
+ [Left door] You open the left door and go in...
-> Bedroom
+ [Right door] You open the right door and go in...
-> Office
+ [Center door] You open the center door and go in...
-> Bathroom
+ Go back out front door 
-> exit


== Bedroom ==
~ advance_time(5)
-> antagonist_is_home ->
{Bedroom > 1: <em>You already searched here. You return to the hallway </em> -> Hallway }

Here is ANTANGONIST'S bedroom. It smells like them, unfortunately.

<- bedroom_choices
{hasPortalGun: <- portal_choices}

= bedroom_choices
-> antagonist_is_home ->
* Search the bed 
    You search the bed and find nothing. 
    ~ advance_time(1)
    -> bedroom_choices
* Search the dresser
    ~ advance_time(2)
    You search the dresser and find nothing. -> bedroom_choices
* Search the side table
    ~ advance_time(1)
    You search the side table and find a <b>key!</b>
    ~ hasKey = true
+ Go back to hallway -> Hallway

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
    - timer > 10 && !garageIsOpen:
        ~ garageIsOpen = true
        <b>Oh no! You hear the garage door opening! What will you do?</b>
        + Get the heck out of here! -> exit
        + Stick around and try to find what you're looking for You steel your heart and keep looking.. 
            ->->
    - timer > 11 && !foyerDoorIsOpen:
        ~ foyerDoorIsOpen = true
        <b>Oh no! You hear the foyer door opening! What will you do?</b>
        + Get the heck out of here! -> exit
        + Stick around and try to find what you're looking for You steel your heart and keep looking.. 
            ->->
    - timer > 12:
        <b>Oh no! You hear the hallway door open!</b>
        ~ temp is_in_hallway = get_current_location(-> Hallway)
        {
            - is_in_hallway == 0: ANTAGONIST sees you and pulls their pistol. BLAM! You die! -> DONE
            - else: 
                Try to hide? 
                * Yes! 
                ->->
                * No!
                ->->
        }
    - else: 
        ->->
}

== exit ==

-> DONE