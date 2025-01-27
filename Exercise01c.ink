/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Variable types: integer, float, boolean
 - Variable assignment
 - Printing variables
 - Variable checking
 
 In the assignment:
 - Add four more knots
 - Assign at least TWO new variables through player choices
 - Print at least one of the variables to the player in a passage
 - Check the value of a variable and have it do something
*/

VAR keys = 0
VAR color = ""


-> cave_mouth

== cave_mouth ==
You are at the enterance to a cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.



+ [Take the east tunnel] -> east_tunnel
+ [Take the west tunnel] -> west_tunnel
* [Pick up the torch] -> torch_pickup

== east_tunnel ==
{east_tunnel_lit:
->east_tunnel_lit
-else:
You are in the east tunnel. It is very dark, you can't see anything.
* {torch_pickup} [Light Torch] -> east_tunnel_lit
+ [Go Back] -> cave_mouth
}


== west_tunnel ==
You are in the west tunnel. {west_key: |There's something shiny on the ground.}
* [Search the Ground] ->west_key
+ [Continue] ->grotto
+ [Go Back] -> cave_mouth


== grotto ==
The path opens up into a beautiful grotto. {fishing_minigame: |There's a fishing rod lying next to a small pool of water.}
*[Go fishing] ->fishing_minigame
+[Continue] ->dungeon
+[Go Back] ->west_tunnel


== dungeon ==
The dirt path changes to stone as you seem to enter some kind of dungeon. You're glad you're on this side of the bars. {dungeon_key: |There's a key on the wall.}
*[Take the Key] ->dungeon_key
+[Go Back] ->grotto


== dungeon_key ==
~ keys = keys + 1
You picked up the key! You now have {keys} keys.
*[Go Back] ->dungeon


== fishing_minigame ==
~ keys = keys + 1
You decide to take a break from exploring and go fishing. You fish up a key! You now have {keys} keys.
*[Go Back] ->grotto 


== west_key ==
~ keys = keys + 1
You found a key on the ground. You now have {keys} keys.
* [Go Back] ->west_tunnel


=== torch_pickup ===
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth


== east_tunnel_lit ==
The torch lights up the tunnel. You can now see a large wooden door in front of you with three key holes in the center.
+[Go Back] ->cave_mouth
{keys == 3} 
    *[Unlock] ->treasure


== treasure ==
The door swings open revealing the treasure! It's a pair of boots in your favorite color! What color are they?
*[Red]
    ~ color = "red"
    ->boots
*[Orange] 
    ~ color = "orange"
    ->boots
*[Yellow]
    ~ color = "yellow"
    ->boots
*[Green]
     ~ color = "green"
    ->boots
*[Blue]
     ~ color = "blue"
    ->boots
*[Purple]
     ~ color = "purple"
    ->boots


== boots ==
You now have a fancy pair of {color} boots!
->DONE  

