<h3>Conditionals, Functions, Tunnels, Threads</h3>
<h4>A story of sorts</h4>

VAR has_key = false 
VAR timer = 0
VAR has_portal_gun = false 
VAR garage_open = false
VAR foyer_door_is_open = false
VAR current_location = "house"

->start

== function advance_time(time_amount) == // used to advance time as we search the house
~ timer += time_amount

== function is_in_location(location) == // check where we are
{ current_location == location: 
    ~ return true
    - else: 
    ~ return false
}

== portal_choices == // these choices will be used as a thread because they will appear alongside very choice after we've found the portal gun
* [Pull the trigger on the portal gun] -> portal_opens(false)
* [Turn the knob on the portal gun, then pull the trigger] -> portal_opens(true)

== start ==
You close the door behind you. You know the PORTAL GUN is here somewhere, but you only have ten minutes before ANTAGONIST comes home.

-> Hallway

== Hallway ==
~ advance_time(1) // we advance time when we move around 
~ current_location = "hallway" // set the current location for conditional checks later
-> antagonist_is_home -> // we jump down this "Tunnel" at regular intervals to check if the antagonist has come home, then return from whence we came 

The hallway has three doors. One on the left, one on the right, and one directly ahead. 

{has_portal_gun: <- portal_choices} // show this Thread of choices if we have the portal gun
+ [Left door] You open the left door and go in...
-> Bathroom
+ [Right door] You open the right door and go in...
-> Office
+ [Center door] You open the center door and go in...
-> Bedroom
+ Go back out front door 
-> exit(foyer_door_is_open) // our exit is different if the antagonist is in the foyer


== Bedroom ==
~ current_location = "bedroom"
{Bedroom > 1 && !foyer_door_is_open: <em>You already searched here. You return to the hallway </em> -> Hallway } // Check whether we've been here before and if the foyer door isn't open (if it is, then we may want to run back in here!)

{ 
- foyer_door_is_open: You rush back into the bedroom.
- else: Here is ANTANGONIST'S bedroom. It smells like them, unfortunately.
}


- (bedroom_choices)
-> antagonist_is_home -> // we jump down this "Tunnel" at regular intervals to check if the antagonist has come home, then return from whence we came 
{has_portal_gun: <- portal_choices} // show this Thread of choices if we have the portal gun
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
~ current_location = "bathroom"
{Bathroom > 1 && !foyer_door_is_open: <em>You already searched here. You return to the hallway </em> -> Hallway } // Check whether we've been here before and if the foyer door isn't open (if it is, then we may want to run back in here!)
{ 
- foyer_door_is_open: You rush back into the bathroom.
- else: Here is ANTANGONIST'S bathroom. They need to clean it.
}

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
~ current_location = "office"
{office_choices && !foyer_door_is_open: <em>You already searched here. You return to the hallway </em> -> Hallway } // Check whether we've been here before and if the foyer door isn't open (if it is, then we may want to run back in here!); NOTE we need to visit "office_choices", which requires we have the key! Otherwise we can come back as much as we like.

{ 
    - has_key && !foyer_door_is_open:
    The key works! You open the door. This is ANTAGONIST'S office, where they plan all their horrible deeds.
    - foyer_door_is_open && has_key: 
         You rush back into the office.
    - else:
        The door is locked.
         -> Hallway
}


- (office_choices)
-> antagonist_is_home -> // we jump down this "Tunnel" at regular intervals to check if the antagonist has come home, then return from whence we came 
{has_portal_gun: <- portal_choices} // show this Thread of choices if we have the portal gun
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
    - timer > 10 && !garage_open: // We only show this when the timer is greater than 10 AND the garage door hasn't already been open (otherwise the condition would trigger constantly when the timer is over 10)
        ~ garage_open = true
        <b>Oh no! You hear the garage door opening! What will you do?</b>
        + Get the heck out of here! -> exit(false)
        + [Stick around and try to find what you're looking for] You steel your heart and keep looking.. 
            ->->
    - timer > 11 && !foyer_door_is_open: // Ditto as above
        ~ foyer_door_is_open = true
        <b>Oh no! You hear the foyer door opening! What will you do?</b>
        + Get the heck out of here! -> exit(true)
        + [Stick around and try to find what you're looking for] You steel your heart and keep looking.. 
            ->->
    - timer > 12:
        <b>Oh no! You hear the hallway door open!</b>
        {
            - is_in_location("hallway"): ANTAGONIST sees you! -> confrontation // If we're in the hallway, immediate confrontation
                
            - else: 
                { has_portal_gun:
                  Fortunately you have the <h1>PORTAL GUN!</h1>
                <- portal_choices
                }
                {has_portal_gun: Use the portal gun or} try to hide? 
                * Hide! 
                -> hide
                * Don't hide!
                 * * Make a dash for it! 
                    You meet ANTAGONIST in the hallway!
                    -> confrontation
                 * * Prepare to fight! 
                    You enter the hallway confidently. 
                    * * * "Have a knuckle sandwich!" 
                    -> confrontation
                    * * * Say nothing and rush them.
                    -> confrontation
                { 
                    - is_in_location("office"): 
                    * * Continue searching 
                    -> Office
                }
                    
                    
        }
    - else: 
        ->->
}

== confrontation ==
You square yourself for combat. 

Fade to black. 

Stay tuned for Chapter 2...

-> DONE

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
~ temp antagonist_is_in_office = false // if we wait a beat, they'll go into their office...
- (choices)
{
- is_in_location("bedroom") || is_in_location("bathroom"): // if we're not in the office, we can hide and wait...
    You hunker down in the {current_location}...
    * Wait 
    ~ antagonist_is_in_office = true
    You wait and after a while hear the office door open and close.  -> choices
    * Make a dash for it! 
    -> dash_options(antagonist_is_in_office)
- else: // if we are in the office, immediate confrontation!
    ANTAGONIST opens the door to the office and walks in on you! Prepare to fight! 
    -> confrontation
}

-> DONE
== dash(is_safe_to_dash) ==
{ is_safe_to_dash: 
     -> exit(foyer_door_is_open)
    - else:
    You meet ANTANGONIST in the hallway! 
}

== exit(antagonist_sees_you) ==

You dash out of there and burst through the hallway door...
{antagonist_sees_you: ANTAGONIST sees you as they are in the foyer, but doesn't have time to react!}
You continue out the front door, and run down the street!
{ 
- has_portal_gun: You found what you were looking for. The PORTAL GUN is now yours forever! A whole universe awaits...
- else:
    Maybe you can come back another time for the PORTAL GUN...
}

-> DONE

== portal_opens(turned_knob) ==
{turned_knob: You turn the knob. The gun makes a low whirr and some clicks.}

You pull the trigger and a bluish portal opens in front of you. You step through...

Stay tuned for Chapter 2

-> DONE

