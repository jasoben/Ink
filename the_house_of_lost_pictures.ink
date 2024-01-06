Margo arrived at her grandmother's house on a clear fall day. The tall pine trees swayed in the wind. -> intro

== intro ==

* [Examine the house] -> examine_house
* [Go inside] -> go_inside
* [Walk around the property] -> walk_around

== examine_house ==
Margo looks at the house. It is a gothic mansion with peeling paint and high turrets.
* [Examine the turrets] -> turrets 

= turrets
    The turret is cool.
    * [Look closer] -> turrets_closer
    = turrets_closer
-> intro

== walk_around ==
Margo walks around the property. The trees seem to go on forever. Grandma liked living here, far away from the world, where "she could think clearly and see the stars at night."
-> intro

== go_inside ==
The inside of the house smells musty, but has that familiar "grandma" scent. The living room has the old green velvet sofa, the pink glass table lamp, the collection of "bon apetit" magazines in a stack by the armchair. 

As you walk in, your cell phone rings. It's your mom. -> phone_rings

== phone_rings ==
* [Answer the phone] -> answer_the_call_from_mom
* [Don't answer the phone] -> do_not_answer_the_call_from_mom

== answer_the_call_from_mom ==
Hi mom! -> phone_rings

== do_not_answer_the_call_from_mom ==
{three|two|one} -> phone_rings

-> END
