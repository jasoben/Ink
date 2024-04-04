LIST students =
     (Owen),
     (Lily),
     (Samuel),
     (John),
     (Emily),
     (Jimmy),
     (Grace),
     (Jennifer),
     (Carly),
     (Alex),
     (Alexa),
     (Bryan),
     (Megan),
     (Margaret),
     (Benjamin),
     (Sarah),
     (Elliott),
     (Alexander),
     (Melanie),
     (Afia),
     (Hayley),
     (Sierra),
     (Ashley),
     (Jesse),
     (Varun),
     (Brad)
     
     
/*
	Takes a random element from a list, and returns it, modifying the list.

	Returns the empty list () if the source list is empty.

	Usage: 

	LIST fruitBowl = (apple), (banana), (melon)

	I eat the {pop_random(fruitBowl)}. Now the bowl contains {fruitBowl}.

*/

- (start)
The Randomathingy will randomly choose a student...

+ [Choose away!]
<h1>{pop_random(students)}</h1>
-> start

=== function pop_random(ref _list) 
    ~ temp el = LIST_RANDOM(_list) 
    ~ _list -= el
    ~ return el 