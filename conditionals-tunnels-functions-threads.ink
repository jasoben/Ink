<h3>Conditionals, Functions, Tunnels, Threads</h3>
<h4>A story of sorts</h4>

VAR has_key = false 
VAR timer = 1
VAR has_portal_gun = false 
VAR garage_open = false
VAR foyer_door_is_open = false

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
~ advance_time(1)
-> antagonist_is_home ->

The hallway has three doors. One on the left, one on the right, and one directly ahead. 

{has_portal_gun: <- portal_choices}
+ [Left door] You open the left door and go in...
-> Bathroom
+ [Right door] You open the right door and go in...
-> Office
+ [Center door] You open the center door and go in...
-> Bedroom
+ Go back out front door 
-> exit


== Bedroom ==
{Bedroom > 1: <em>You already searched here. You return to the hallway </em> -> Hallway }

Here is ANTANGONIST'S bedroom. It smells like them, unfortunately.

- (bedroom_choices)
-> antagonist_is_home ->
{has_portal_gun: <- portal_choices}
* [Search the bed]
    You search the bed and find nothing. 
    ~ advance_time(1)
    -> bedroom_choices
* [Search the dresser]
    ~ advance_time(2)
    You search the dresser and find nothing. -> bedroom_choices
* [Search the side table]
    ~ advance_time(1)
    You search the side table and find a <b>key!</b>
    ~ has_key = true 
    -> bedroom_choices
+ [Go back to hallway] You return to the hallway 
-> Hallway

- You finish searching the bedroom and return to the hallway.

-> Hallway


== Bathroom ==
{Bathroom > 1: <em>You already searched here. You return to the hallway </em> -> Hallway }
Here is ANTANGONIST'S bathroom. They need to clean it.

- (bathroom_choices)
-> antagonist_is_home ->
{has_portal_gun: <- portal_choices}
* [Search the medicine cabinet]
    ~ advance_time(2)
    You search the medicine cabinet and find nothing. -> bathroom_choices
* [Search the trash can] 
    ~ advance_time(1)
    You search the trash can and find nothing -> bathroom_choices
+ [Go back to hallway] You return to the hallway 
-> Hallway

- You finish searching the bathroom and return to the hallway.

-> Hallway

== Office ==
{Office > 1 && has_key: <em>You already searched here. You return to the hallway </em> -> Hallway }

{ has_key:
    The key works! You open the door. This is ANTAGONIST'S office, where they plan all their horrible deeds.
- else:
    The door is locked.
    -> Hallway
}


- (office_choices)
-> antagonist_is_home ->
{has_portal_gun: <- portal_choices}
* [Search the desk] 
~ advance_time(2)
    You search the desk and find the portal gun!
    This opens up some new options...
    ~ has_portal_gun = true
    -> office_choices
* [Search waste basket]
   ~ advance_time(1)
   You search the waste basket and find nothing.
   -> office_choices
* [Search filing cabinet]
    ~ advance_time(2)
    You search the filing cabinet and find nothing.
    -> office_choices
+ [Go back to hallway] You return to the hallway 
-> Hallway

- You finish searching the office and return to the hallway. 
-> Hallway

== antagonist_is_home ==
{
    - timer > 10 && !garage_open:
        ~ garage_open = true
        <b>Oh no! You hear the garage door opening! What will you do?</b>
        + Get the heck out of here! -> exit
        + Stick around and try to find what you're looking for You steel your heart and keep looking.. 
            ->->
    - timer > 11 && !foyer_door_is_open:
        ~ foyer_door_is_open = true
        <b>Oh no! You hear the foyer door opening! What will you do?</b>
        + Get the heck out of here! -> exit
        + Stick around and try to find what you're looking for You steel your heart and keep looking.. 
            ->->
    - timer > 12:
        <b>Oh no! You hear the hallway door open!</b>
        {
            - get_current_location(-> Hallway) == 0: ANTAGONIST sees you and pulls their pistol. BLAM! You die! -> DONE
            - else: 
                Try to hide? 
                * Yes! 
                -> hide
                * No!
                 * * Make a dash for it! -> DONE
                 * * Prepare to fight! -> DONE
        }
    - else: 
        ->->
}



== hide ==
-> hiding_options

= dash_options(is_in_office) 
{ 
        - is_in_office: 
        -> dash(true)
        - else:
        -> dash(false)
}

= hiding_options
~ temp antagonist_is_in_office = false
- (choices)
{
- get_current_location(-> Bedroom) == 0:
    You hunker down in the bedroom...
    * Wait 
    ~ antagonist_is_in_office = true
    You wait and after a while hear the office door open and close.  -> choices
    * Make a dash for it! 
    -> dash_options(antagonist_is_in_office)
}

-> DONE
== dash(is_safe_to_dash) ==
{ is_safe_to_dash: 
     -> exit
    - else:
    You meet ANTANGONIST in the hallway! 
}

== exit ==
You dash out of there and burst through the hallway door, then the front door, and run down the street!
{ 
- has_portal_gun: You found what you were looking for. The PORTAL GUN is now yours forever! A whole universe awaits...
- else:
    Maybe you can come back another time for the PORTAL GUN...
}

-> DONE