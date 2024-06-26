"Adventure" by William Crowther, ported by Chris Conley

[This is intended to be a faithful Inform 7 port of Crowther's original Colossal Cave, the game that inspired Woods to make a version of his own.]

The story headline is "Colossal Cave". 
The story genre is "Fantasy". 
The story creation year is 1976. 
The release number is 2.
The release subnumber is a number that varies. The release subnumber is 22.

[In this version: a number of bug fixes and oversight corrections, and some code refactoring.]

Include Locksmith by Emily Short, Plurality by Emily Short.  
Include Default Messages by Ron Newcomb. Use library message alerts.

Use no deprecated features. Use BRIEF room descriptions. Use no scoring. [Use memory economy.]
[The game will fit into a .z5 file if this last option is uncommented.]
Release along with a website and the source text.

Book One - Alterations

Part I - Directions

Chapter 1 - New

upstream is a direction. The opposite of upstream is downstream.
downstream is a direction. The opposite of downstream is upstream.

forward is a direction. The opposite of forward is back. Understand "continue/onward/onwards/forwards" as forward.
back is a direction. The opposite of back is forward.

Chapter 2 - Old

Understand "inward/inwards" as inside. 

Understand the command "exit" as something new. Understand "exit/leave" as outside.

Understand "upward/upwards/above" as up.

Understand "downwards/downward" as down.

Part II - Verbs

Chapter 1 - Simplifying

Understand the command "enter" as something new. Understand "enter" as going. 
[Inform's default entering behavior unnecessarily complicates a simple movement keyword from the original.]

Understand the command "take" as something new. Understand "take [things]" as taking. 
	Understand "take inventory" as taking inventory.

Understand the commands "get", "carry", "wear" as something new. Understand "get [things]" as taking.
	Understand the commands "keep", "pickup", "carry", "catch", "steal", "capture", "find", "wear", "where" as "get".

Understand the command "drop" as something new. Understand "drop [things preferably held]" as dropping.
	Understand the command "discard" as something new.
	Understand the commands "discard", "release", "free", "dump" as "drop".

Understand the command "light" as something new. 	
	Understand "light [something]" as switching on. Understand the command "on" as "light". 
	
Understand the commands "look", "l", "z", "wait" as something new. [Waiting isn't original, but it might as well have the same function as >LOOK.]
	Understand "look" as looking. Understand the commands "l", "wait", "z" as "look".
	Understand "look at [something]", "l at [something]", "look [something]", "l [something]" as examining.

Understand the command "wave" as something new. Understand "wave [something]" as waving.
	Understand the commands "calm", "shake", "cleave" as "wave". 
	
Understand the command "touch" as something new. Understand the command "touch" as "examine".	

Understand the commands "open", "close" as something new.
	Understand "open [something]" as unlocking keylessly. 
	Understand "close [something]" as locking keylessly.
	Understand "open [something] with [something]" as unlocking it with. 
	Understand "close [something] with [something]" as locking it with.
	[The original made no distinction between locked and closed, nor between open and unlocked.] 
	
Understand the commands "nothing" and "hold" as something new. Understand "nothing", "hold" as thinking.
	Thinking about is an action applying to one thing. Understand "hold [something]" as thinking about. Instead of thinking about something, try thinking.
	[No, "hold" is not synonymous with "get". They have the same response, too. Very misleading.]

Understand the command "put" as something new. Understand "put down [things preferably held]" and "put [things preferably held] down" as dropping.
	[The other "put" syntax in Inform involves wearing, containers, and supporters, none of which exist in this version of ADVENT.]
	
Understand the command "turn" as something new.
	Understand "turn [something] on" and "turn on [something]" as switching on.
	Understand "turn [something] off" and "turn off [something]" as switching off.
	[These syntaxes are fine, but the actual turning action is unnecessary.]
	
Chapter 2 - Synonymizing

Understand "go to/towards/toward/by/along/through" or "goto" as "[goto]". 

Understand "[door]", "go [door]", "[goto] [door]" as entering.

Understand "extinguish [something]" as switching off. Understand the command "off" as "extinguish". 

Understand the command "stab" as "attack".

Understand the commands "travel" or "proceed" or "explore" or "follow" as "go".

Understand the command "lift" as "unlock". 

Chapter 3 - Unimplementing

Understand the commands "adjust", "answer", "ask", "attach", "awake", "awaken" as something new.
Understand the commands "burn", "buy" as something new.
Understand the commands "chop", "clear", "consult", "cross", "cut", "climb" as something new. [Advent only uses "climb" for movement between a couple of rooms, so there is no need for a general-purpose climbing verb; it only clutters up those simple cases.]
Understand the commands "display", "drag", "disrobe", "doff", "don" as something new.
Understand the command "embrace" as something new.
Understand the commands "fasten", "feed", "feel" as something new.
Understand the command "give" as something new.
Understand the commands "hear", "hug" as something new.
Understand the command "insert" as something new.
Understand the command "kiss" as something new.
Understand the command "listen" as something new.
Understand the command "move" as something new.
Understand the command "offer" as something new.
Understand the commands "pay", "present", "press", "prune", "pull", "purchase", "push" as something new.
Understand the commands "read", "remove", "rotate" as something new.
Understand the commands "say", "scale", "screw", "search", "set", "shift", "shout", "show", "sit", "slice", "sleep", "smell", "sniff", "sorry", "speak", "squash", "squeeze", "stand", "swing" as something new.
Understand the commands "taste", "tell", "think", "tie", "twist" as something new.
Understand the commands "uncover," "unscrew" as something new.
Understand the commands "wake", "wreck" as something new.
Understand the commands "y", "yes" as something new.

Chapter 4 - Extending

Section 4a - Looking
	
Look later is a truth state that varies.  [True when the display of a room description is pending for the end of the turn.]

When play begins: now look later is true.

Before going nowhere: now look later is true. 

After going, going by keyword, retreating: now look later is true.

Every turn when look later is true, try looking. [The room description should be displayed at the end of certain turns.]

The looking action has a truth state called looked intentionally. 

Setting action variables for looking: 
	if look later is true, now looked intentionally is false; 
	otherwise now looked intentionally is true.
	[By default, assume the looking action is player-intended; rules can indicate otherwise. There's no other way to tell the two situations apart.]

Before looking when looked intentionally is true:
	say "Sorry, but I am not allowed to give more detail. I will repeat the long description of your location."

After looking, now look later is false. [Reset the looking-related variables after the looking action is complete.]
	
Section 4b - Examining
		
Instead of examining: if the noun is not a backdrop, try looking; otherwise continue the action.
[The original did not allow examining things; there's no useful information to be gleaned from things in this simple world model anyway.]

Does the player mean doing something other than examining to a backdrop: it is unlikely.

Section the Last - Misc

After dropping something:
	now the noun is not handled;
	continue the action.
	[Crowther always displayed the initial appearance of everything.]

Part III - Kinds

A room is usually dark.

Every room has a number called the description print count. [Basically, the first time you enter a room, and every 5th round thereafter, Crowther prints the long description rather than the short one. This is that per-round count for each room.]

Every room has a text called the short description. Definition: a room is short-described if its short description is not "".

Part IV - Rules

Chapter 1 - Darkness and Light

Rule for printing the announcement of light: do nothing. [The player didn't look around after turning on the lamp in the original.]
	
Rule for printing the announcement of darkness: do nothing.

Chapter 2 - Hints

Error count is a number that varies.

The first after printing a parser error rule: 
	increment the error count. [A few hints are provided after failing to solve specific puzzles.]

Every turn:
	now the error count is 0.

To pose the question (parser's query - a text) with affirmative response (hint text - a text):
	if error count is 3:
		now error count is 0;
		say "[line break][parser's query][paragraph break]  ";
		if the player consents, say "[hint text][paragraph break]";
		otherwise say "OK."
	
Chapter 3 - Crowther's Messages
		
Table of custom library messages (continued)
library-action	library-message-id	library-message-text
--						10				"[confusion]"
--						11				"[bracket]There is nothing to undo![close bracket]"
--						13				"[bracket]Undoing the previous turn.[close bracket]"
--						16				"[bracket]'Oops' can only correct a single word.[close bracket]"
--						17				"It is now pitch black. If you proceed you will likely fall into a pit. "
--						23				"[confusion]"
--						24				"[confusion]"
--						28				"All I understood was you wanted to [ignore library line break]"
--						30				"[confusion]"
--						33				"You can only [library message verb] one thing at a time. "
--						38				"I don't know that word. "
--						40				"[confusion]"
--						44				"[dunno]"
--						49				"[library message verb] what? "
--						56				"."
--						67				"[dunno]"
--						71				"Darkness"
--						73				"[confusion]"
--						109				" (lit"
Taking action			1				"OK."
Taking action			3				"You can't be serious! "
Taking action			5				"You are already carrying it! "
Taking action			14				"[confusion]"
Dropping action			1				"You aren't carrying it!"
Dropping action			4				"OK."
Going action				2				"[if the noun is sixfold]There is no way to go that direction. [otherwise if the noun is inside or the noun is outside][infromout][otherwise][dunno][end if]"
Going action				7				"Where? "
Swearing obscenely action	1				"Watch it! "
Rubbing action			1				"Peculiar. Nothing unexpected happens. "
Unlocking it with action	1				"I don't know how to lock or unlock such a thing. "
Drinking action			1				"There is no drinkable water here. "
Exiting action			1				"[infromout]"
Jumping action			1				"[dunno] "
Singing action			1				"[nothinghap]"
Taking inventory action	1				"You are carrying nothing."
Taking inventory action	2				"You are carrying[ignore library line break]"
Thinking action			1				"OK."
Quitting the game action	1				"Please respond yes or no."
Waving action			2				"[nothinghap]"
	
Definition: a direction is sixfold if it is north or it is south or it is east or it is west or it is up or it is down.

To say confusion:
	if a random chance of 1 in 5 succeeds:
		say "I don't understand that! ";
	otherwise if a random chance of 1 in 5 succeeds:
		say "What? ";
	otherwise:
		say "I don't know that word. "

To say dunno: now look later is true; say "I don't know how to apply that word here."

To say infromout: say "I don't know in from out here. Use compass points or name something in the general direction you want to go. "

To say nothinghap: say "Nothing happens."

Chapter 4 - Room Headings and Descriptions 
	
[These next two rules obviously modify two rules from the Standard Rules, to change the way the looking action prints the name and description of a previously visited room in BRIEF mode only.]

Crowther's room description heading rule is listed instead of the room description heading rule in the carry out looking rulebook.

[Normally this first rule does nothing -- unless the game is in the default BRIEF mode, the room has a short description property, and the number of times the room has been described is not an even multiple of 5. In that case, it prints the short description.]
This is the Crowther's room description heading rule:
	say bold type;
	if the visibility level count is 0:
		begin the printing the name of a dark room activity;
		end the printing the name of a dark room activity;
	otherwise if the visibility ceiling is the location:
		if the description print count of the location is 5, now the description print count of the location is 0; [prevent overflow]
		if set to abbreviated room descriptions and looked intentionally is false:
			say "[visibility ceiling]";
		if set to sometimes abbreviated room descriptions:
			if looked intentionally is true or the description print count of the location is 0 or the location is not short-described:
				say "";
			otherwise if the location is short-described:
				say the short description of the location;
	let intermediate level be the visibility-holder of the actor;
	repeat with intermediate level count running from 2 to the visibility level count:
		issue library message looking action number 8 for the intermediate level;
		let the intermediate level be the visibility-holder of the intermediate level;
	unless looked intentionally is true or the description print count of the location is 0 or the location is not short-described, say line break;
	say run paragraph on with special look spacing.

Crowther's room description body text rule is listed instead of the room description body text rule in the carry out looking rulebook.

[If the above rule has printed the short description, this second rule does nothing; otherwise this rule prints the long description.]
This is the Crowther's room description body text rule:
	if the visibility level count is 0:
		begin the printing the description of a dark room activity;
		if handling the printing the description of a dark room activity,
			issue miscellaneous library message number 17;
		say roman type;
		end the printing the description of a dark room activity;
	otherwise if the visibility ceiling is the location:
		if looked intentionally is true:
			say "[description of the location][line break]";
			continue the action;
		if set to abbreviated room descriptions:
			say roman type;
			continue the action;
		if set to sometimes abbreviated	room descriptions and the location is visited:
			increment the description print count of the location;
			if the description print count of the location is 1:
				say "[description of the location][line break]";
				continue the action;
			unless the location is short-described: 
				say "[description of the location][line break]";
			otherwise: 
				say roman type;
			continue the action;
		increment the description print count of the location;
		say "[description of the location][line break]";

Chapter 5 - Closing, Locking, Opening, Unlocking

The closing doors before locking keylessly rule is not listed in the before rulebook. 
The closing doors before locking rule is not listed in the before rulebook. 
The can't lock what's already locked rule is not listed in the check locking it with rulebook.  
The can't unlock what's already unlocked rule is not listed in the check unlocking it with rulebook. 
The can't lock what's open rule is not listed in the check locking it with rulebook.

Chapter 6 - Switching on, switching off

The can't switch on what's already on rule is not listed in the check switching on rulebook.
The can't switch off what's already off rule is not listed in the check switching off rulebook.

Chapter 7 - Going west

The full west count is a number that varies.
After reading a command when the player's command matches the regular expression "west":
	if the full west count is less than 11, increment the full west count;
	if the full west count is 10, say "If you prefer, simply type w rather than west.";
	continue the action.

Book Two - Locations

Part I - Outdoors

Sylvan relates one room to various rooms. The verb to be forestwise from implies the sylvan relation. The verb to lead forestwise to (he leads forestwise to) implies the reversed sylvan relation.
Depressive relates one room to various rooms. The verb to be depressive from implies the depressive relation.
Buildwise relates one room to various rooms. The verb to be buildwise from implies the buildwise relation. The verb to lead buildwise to (he leads buildwise to) implies the reversed buildwise relation.
 
A keyword is a kind of value. The keywords are defined by the Table of Keywords.

Table of Keywords
Name		Relevant relation
fores		the sylvan relation
depression	the depressive relation
bld			the buildwise relation

Understand "depressed" as depression. Understand "build/building/house" as bld. Understand "forest" as fores.

Chapter 1 - Road

End of Road is a room. "You are standing at the end of a road[roman type] before a small brick building. Around you is a forest. A small stream flows out of the building and down a gully." The short description is "You're at End of Road again."

Hill in Road is west from End of Road. "You have walked up a hill,[roman type] still in the forest. The road now slopes back down the other side of the hill. There is a building in the distance." The short description is "You're at Hill in Road."
	Forward is End of Road.
	End of Road is buildwise from Hill in Road.
	Down from Hill in Road, north from Hill in Road, back from Hill in Road are west from End of Road.
	[North, down, and back in Hill in Road are non-symmetrical map connections: south, up, and forward in End of Road do not lead back to Hill in Road.]
	Understand "road" as east when the location is Hill in Road. Understand "road" as west when the location is End of Road.
	
Chapter 2 - Building

The Building is east from End of Road. "You are inside a building,[roman type] a well house for a large spring." 
	The short description is "You're inside Building."
	Outside is End of Road.
	Building is buildwise from End of Road.
	Instead of going downstream in the Building, say "The stream flows out through a pair of 1 foot diameter sewer pipes. It would be advisable to use the door."
	Understand "outdoor/outdoors" as outside when the location is the Building. [The only time "outdo" is recognized in the original.]
	Understand "door/gate" as west when the location is the Building. Understand "stream" as downstream when the location is the Building.
	Understand "door/gate" as east when the location is End of Road. 
		
	Rule for supplying a missing noun when going and the player's command includes "enter":
		if the location is End of Road, now the noun is east instead;
		if the location is Building, now the noun is west instead;
		continue the action.
		[Allows the one-word command "enter" to travel between End of Road and Building, and otherwise to act as a synonym for "go".]

	Some keys are in the building. "There are some keys on the ground here."
		To say nokeys: say "You have no keys!"
		The first check locking keylessly rule: if the location does not enclose the keys, say nokeys instead. 
		The first check unlocking keylessly rule: if the location does not enclose the keys, say nokeys instead.
		This is the Crowther's printing key lack rule: say nokeys. 
			Crowther's printing key lack rule is listed instead of the standard printing key lack rule in the for refusing keys rulebook.
		Before unlocking keylessly the keys, say "You can't unlock the keys." instead.
		Rule for supplying a missing second noun when unlocking something with, locking something with: now the second noun is the keys.

	The lamp is a device in the building. "There is a shiny brass lantern nearby." 
		Understand "lantern" as the lamp. 
		After switching on the lamp: now the lamp is lit; say "Your lamp is now on." 
		After switching off the lamp: now the lamp is not lit; say "Your lamp is now off." 
		Instead of rubbing the lamp, say "Rubbing the electric lamp is not particularly rewarding. Anyway, nothing exciting happens." 
		Does the player mean switching on the lamp: it is very likely. 
		Does the player mean switching off the lamp: it is very likely. 
		After reading a command when the player's command matches "light" and the location does not enclose the lamp:
			say "You have no source of light."; stop the action.

	Some food is an edible, ambiguously plural thing in the Building. "There is food here."
		Understand "ration/rations" as the food. 
		
	A bottle of water is in the Building. "There is a[if the bottle is empty]n[end if] [bottle] here."
		The bottle can be empty or full. 
		Instead of drinking the full bottle, empty the bottle saying "The bottle of water is now empty." 
		Instead of pouring the bottle, empty the bottle saying "Your bottle is empty and the ground is wet." 
		[No, pouring the bottle doesn't fail if it's already empty. Anyway, the message is applicable in either case.] 
		
		To empty the bottle saying (T - a text): 
			now the bottle is empty; 
			now the printed name of the bottle is "empty bottle";
			say T.
			
Chapter 3 - Valley

The Valley is south from End of Road. "You are in a valley[roman type] in the forest beside a stream tumbling along a rocky bed."
	The short description is "You're in Valley."
	Upstream is End of Road.
	Downstream from End of Road, down from End of Road are north from Valley.
	Understand "gully/stream" as south when the location is End of Road. 
	
Chapter 4 - Forests

A forest is a kind of room. A forest is usually privately-named. 
	The printed name of a forest is usually "Forest". The short description of a forest is usually "You're in Forest."
	Understand "valley" as down when the location is a forest.

Forest 1 is a forest, south from Hill in Road. "You are in open forest,[roman type] with a deep valley to one side." 
	East, down is Valley. West, south is Forest 1. 
	Forest 1 is north from End of Road, forestwise from Valley, forestwise from End of Road, forestwise from Hill in Road.
	East from Valley is east from Forest 1.
	Instead of going west in Forest 1, now look later is true. Instead of going south in Forest 1, now look later is true.

Forest 2 is a forest, north of Forest 1. "You are in open forest[roman type] near both a gorge and a road." 
	North is the End of Road. East, west, down is the Valley.
	Forest 2 is forestwise from Forest 1, forestwise from Forest 2.
	Forward from Forest 1, back from Forest 1 are south from Forest 2.
	Instead of going to Forest 2 from Forest 1 when a random chance of 1 in 2 succeeds, now look later is true.
	
Chapter 5 - Slit in Streambed

The Slit in Streambed is south of the Valley. "At your feet all the water of the stream[roman type] splashes into a 2 inch slit in the rock. Downstream the streambed is bare rock." The short description is "You're at Slit in Streambed."
	North, upstream is the Valley. West, east is Forest 1. 
	Streambed is below the Valley. Up is nowhere.
	Streambed leads forestwise to Forest 1. It leads buildwise to End of Road.
	Before going down in Streambed: now look later is true; say "You don't fit down a two inch hole!" instead.
	Understand "stream/slit" as down when the location is Streambed. Understand "bed/rock/streambed" as south when the location is Streambed.
	[The original would parse "streambed" as "strea" and so print the "two inch hole" error message, but considering the word appears in the room description, allowing it seems fair.]
	
Chapter 6 - Outside Grate
	
The Stream's End is south from Streambed.  "You are in a 20 foot depression[roman type] floored with bare dirt. Set into the dirt is a strong steel grate mounted in concrete. A dry streambed leads into the depression."
	The short description is "You're Outside Grate." The printed name is "Outside Grate".
	North and upstream is Streambed. South, east, west is Forest 1. 
	Down from Streambed is north from Stream's End.
	Stream's End leads forestwise to Forest 1. It leads buildwise to End of Road.
	Stream's End is depressive from End of Road and depressive from Valley.
	Understand "outside/grate" as the Stream's End. Understand "gully" as north when the location is Stream's End. 
	
	Rule for supplying a missing noun when going and the player's command includes "enter" and the location is Stream's End: 
		now the noun is down instead.

	The grate is a locked, closed, lockable door unlocked by the keys. The grate is down from Stream's End. "The grate is [if open]open.[otherwise]locked." 
		Before going inside in Stream's End, try going down instead. Before going downstream in Stream's End, try going down instead. 
		Before going through the locked grate: now look later is true; say "You can't go [if the location is Stream's End]in [end if]through a locked steel grate!" instead. 
		[Per the original; I may use Emily Short's Locksmith extension for simplicity, but opening the grate should require more than >DOWN.] 
		
		Unlocking keylessly the locked grate is unlocky behavior. Unlocking the locked grate with is unlocky behavior. 
		Before unlocky behavior when the location encloses the keys: 
			now the grate is open; now the grate is unlocked; say "[The grate] is now unlocked." instead.
		
		Locking keylessly the unlocked grate is locky behavior. Locking the unlocked grate with is locky behavior. 
		Before locky behavior when the location encloses the keys: 
			now the grate is closed; now the grate is locked; say "[The grate] is now locked." instead.
		
		Unlocking keylessly the unlocked grate is ungrateful behavior. Unlocking the unlocked grate with is ungrateful behavior. Locking keylessly the locked grate is ungrateful behavior. Locking the locked grate with is ungrateful behavior. Before ungrateful behavior when the location encloses the keys: say "The grate was already [if the grate is unlocked]un[end if]locked." instead.
		
		Does the player mean unlocking keylessly the grate: it is likely. Does the player mean locking keylessly the grate: it is likely.

		Rule for supplying a missing noun when locking keylessly, unlocking keylessly, locking something with, unlocking something with:
			if the grate is in the location, now the noun is the grate;
			otherwise say "There is nothing here with a lock!" instead.

		After printing a parser error when the locked grate is in the location, pose the question "Are you trying to get into the cave? " with affirmative response "The grate is very solid and has a hardened steel lock. You cannot enter without a key, and there are no keys nearby. I would recommend looking elsewhere for the keys."

Part II - Cave Preamble

Xyzzyness relates one room to another. The verb to be xyzzy with implies the xyzzyness relation.
Pitwise relates one room to various rooms. The verb to be pitwise from implies the pitwise relation.
Debrisness relates one room to various rooms. The verb to be towards debrisroom from implies the debrisness relation.

Table of Keywords (continued)
Name		Relevant relation
xyzzy		the xyzzyness relation
pit-keyword	the pitwise relation
debrisroom	the debrisness relation

Understand "debris" or "debris room" as debrisroom. Understand "pit" as pit-keyword.

Chapter 1 - Below the Grate

The Entryway is a privately-named room, inside from the grate. The description is "You are in a small chamber[roman type] beneath a 3x3 steel grate to the surface. A low crawl over cobbles leads inward to the west."
	The short description is "You're Below the Grate." The printed name is "Below the Grate".
	Instead of going by keyword bld in Entryway, try going outside.
	
Chapter 2- Cobble Crawl

Cobble Crawl is west of Entryway. "You are crawling over cobbles[roman type] in a low passage. There is a dim light at the east end of the passage." The short description is "You're in Cobble Crawl."
	Outside is Entryway. 
	Understand "surface/null/nowhere" as outside when the location is Cobble Crawl.
	Understand "cobble/crawl" and "cobble crawl" as west when the location is Entryway.

	The small wicker cage is in the Cobble Crawl. "There is a small wicker cage discarded nearby."
	
Chapter 3 - Debris Room

The Debris Room is inside from Cobble Crawl. "You are in a debris room,[roman type] filled with stuff washed in from the surface. A low wide passage with cobbles becomes plugged with mud and debris here, but an awkward canyon leads upward and west.[paragraph break]A note on the wall says [']Magic word XYZZY[']." The short description is "You're in Debris Room."
	East is Cobble Crawl. Outside is nowhere.
	Building is xyzzy with Debris Room. Stream's End is depressive from Debris Room. Debris Room is towards debrisroom from Entryway, towards debrisroom from Cobble Crawl.
	Understand "passage/passageway" as "[passa]". Understand "[passa]" and "low/crawl/cobble" and "cobble crawl" as east when the location is Debris Room. 
	Understand "dark" as inside when the location is Cobble Crawl. 

	A black rod is in Debris room. "A three foot black rod with a rusty star on an end lies nearby."
	
Chapter 4 - Awkward Sloping Canyon

The Awkward Sloping East/West Canyon is west of Debris Room. "You are in an awkward sloping east/west canyon.[roman type]".
	Down is Debris Room. 
	Inside from Debris Room is east from Awkward Sloping.
	Stream's End is depressive from Awkward Canyon. Debris Room is towards debrisroom from Awkward Canyon.
	Understand "canyon" as west when the location is Debris Room.
	
Chapter 5 - Bird Chamber

The Bird Chamber is west of the Awkward Canyon. "You are in a splendid chamber[roman type] thirty feet high. The walls are frozen rivers of orange stone. An awkward canyon and a good passage exit from east and west sides of the chamber." The short description is "You're in Bird Chamber."
	Inside from Awkward Canyon, up from Awkward Canyon are east from Bird Chamber.
	Stream's End is depressive from Bird Chamber. Debris Room is towards debrisroom from Bird Chamber.
	Understand "canyon" as east when the location is Bird Chamber.

	A little bird is a thing in the Chamber. "A cheerful little bird is sitting here singing."
		Check taking the little bird when the little bird is not held: 
			if the player carries the rod, say "The bird was unafraid when you entered, but as you approach it becomes disturbed and you cannot catch it." instead;
			if the player does not carry the cage, say "You can catch the bird, but you cannot carry it." instead;

		After printing a parser error when the little bird is in the location and the rod is carried, pose the question "Are you trying to catch the bird? " with affirmative response "The bird is frightened right now and you cannot catch it no matter what you try. Perhaps you might try later."

		Before attacking the little bird:
			say "The little bird is now dead. Its body disappears.";
			remove the little bird from play;
			stop the action.
			
Chapter 6 - Top of Small Pit

The Top of Small is west of the Bird Chamber. "At your feet is a small pit[roman type] breathing traces of white mist. An east passage ends here except for a small crack leading on." The short description is "You're at Top of Small Pit." The printed name is "Top of Small Pit".
	Stream's End is depressive from Top of Small. Debris Room is towards debrisroom from Top of Small.
	Top of Small is pitwise from Entryway, pitwise from Cobble Crawl, pitwise from Debris Room, pitwise from Awkward, pitwise from Bird Chamber. 
	Instead of going west in Top of Small, say "The crack is far too small for you to follow." 
	Understand "[passa]" as east when the location is Top of Small. Understand "crack" as west when the location is Top of Small.
	Understand "[passa]" as west when the location is Bird Chamber.
	
	The rough stone steps are an open unopenable door, below the Top of Small. "Rough stone steps lead [if the location is Top of Small]down into the pit[otherwise]up the dome[end if]." 
		Instead of going by keyword pit-keyword in Top of Small, try going down.

Part III - Hall of Mists, East

Chapter 1 - The Hall

The Hall of Mists is west from the steps. "You are at one end of a vast hall[roman type] stretching forward out of sight to the west. There are openings to either side. Nearby, a wide stone staircase leads downward. The hall is filled with wisps of white mist swaying to and fro almost as if alive. A cold wind blows up the staircase. There is a passage at the top of a dome behind you."  The short description is "You're in Hall of Mists."
	Instead of going by keyword pit-keyword in Hall of Mists, try going east. Instead of going up in Hall of Mists, try going east.
	Understand "dome" and "[passa]" as east when the location is Mists. 
	
Chapter 2 - Nugget of Gold Room

The Nugget of Gold Room is south from the Hall of Mists. "This is a low room[roman type] with a crude note on the wall. It says [']You won't get it up the steps[']." The short description is "You're in Nugget of Gold Room."
	Outside from Nugget Room, back from Nugget Room are south from Hall of Mists.
	Understand "hall" as north when the location is Gold Room.
	Understand "left" as south when the location is the Hall of Mists. 

	The sparkling nugget of gold is in the Gold Room. "There is a sparkling nugget of gold here!"
		Before going through the steps when the sparkling nugget is carried:
			now look later is true;
			if the location is Hall of Mists, say "The dome is unclimbable." instead;
			if the location is Top of Small, say "[line break][bold type]You're at the bottom of the pit[roman type] with a broken neck.";
			end the story.
			[That death was bugged in the original: going down the steps with the nugget caused the printing of "I don't understand that!" in an endless loop.] 

Chapter 3 - East Bank of Fissure

The East Bank of Fissure is west from the Hall of Mists. "You are on the east bank of a fissure[roman type] slicing clear across the hall. The mist is quite thick here, and the fissure is too wide to jump." The short description is "You're on East Bank of Fissure."
	East Bank is forward from the Hall of Mists.
	Understand "hall" as east when the location is the East Bank. 
	Understand "hall" as west when the location is Hall of Mists. 

	The fissure-door is a privately-named, closed, unopenable scenery door, west from the East Bank. The initial appearance is "A crystal bridge now spans the fissure." The printed name is "fissure".
		Does the player mean doing something with the fissure-door: it is unlikely.
		Instead of jumping in East Bank, try going west. Instead of going inside in the East Bank, try going west. 
		Before going through the closed fissure-door: now look later is true; say "There is no way across the fissure." instead. 
		Instead of going forward in the East Bank, end the story saying "Game is over". 
		[Originally, "forward" killed the player here, even with the bridge. Might as well keep it; it's an obscure action anyway.] 
		Understand "fissure" as the fissure-door. Understand "bridge" as the fissure-door when the fissure-door is open. Understand "magic/over/across" as west when the location is the East Bank. 
		
		Instead of striking the fissure-door: 
			now the fissure-door is open;
			now the fissure-door is not scenery;
			say "[initial appearance of the fissure-door][line break]".
	
Part IV - Mountain King's Domain

Y2ness relates one room to one room. The verb to be towards Y2 from implies the Y2ness relation.
Plughness relates one room to another. The verb to be plugh with implies the plughness relation.

Table of Keywords (continued)
Name		Relevant Relation
plugh		the plughness relation
whytoo		the Y2ness relation

Understand "y2" as whytoo.

Chapter 1 - Hall of the Mountain King

The Hall of Mt King is below the Hall of Mists. "You are in the Hall of the Mountain King,[roman type] with passages off in all directions."
	The short description is "You're in Hall of Mt King."
	East from the Hall of Mt King is north from the Hall of Mists.
	Understand "stair/stairs/staircase" as "[stair]". Understand "[stair]" as east when the location is Mt King. 
	Understand "[stair]" as down when the location is Mists. 

	The huge green fierce snake is an animal in Mt King. "A huge green fierce snake bars the way!"
		Going north in Mt King is moving dangerously. Going west in Mt King is moving dangerously. Going south in Mt King is moving dangerously. Going forward in Mt King is moving dangerously. Before moving dangerously when the snake is obvious: now look later is true; say "You can't get by the snake." instead.
		Instead of attacking the snake: say "Attacking the snake both doesn't work and is very dangerous." 
		Instead of dropping the little bird when the snake is obvious:
			say "The little bird attacks the green snake, and in an astounding flurry drives the snake away."; 
			remove the snake from play; 
			now the little bird is in Mt King;
			now the little bird is not handled.

	After printing a parser error when the snake is in the location, pose the question "Are you trying to attack or avoid the snake? " with affirmative response "You can't kill the snake, or drive it away, or avoid it, or anything like that. There is a way to get by, but you don't have the necessary resources right now."
	
Chapter 2 - Low Passage

The Low N/S Passage is north from Mt King. "You are in a low N/S passage[roman type] at a hole in the floor." 
	Outside from the Low Passage is north from Mt King. 
	Understand "hall" as south when the location is Low Passage. Understand "hole" as down when the location is Low Passage.
	Understand "left" as north when the location is Mt King. 

	Some bars of silver are in the Low Passage. "There are bars of silver here!"
	
Chapter 3 - Side Chambers

The South Side Chamber is south from Mt King. "You are in the south side chamber.[roman type]".
	Outside from South Side Chamber is south from Mt King. 
	Understand "hall" as north when the location is South Chamber.
	Understand "right" as south when the location is Mt King. 

	Some precious jewelry is in the South Chamber. "There is precious jewelry here!"

The West Side Chamber is west from Mt King. "You are in the west side chamber[roman type] of Hall of Mt King. A passage continues west and up here."
	Outside from West Side Chamber is west from Mt King. Forward from Mt King is east from West Side Chamber.
	Understand "hall" as east when the location is West Chamber.

	Some coins are in the West Chamber. "There are many coins here!"	
	
Chapter 4 - Y2 area

Y2 is north from N/S Passage. "You are in a large room,[roman type] with a passage to the south, a passage to the west, and a wall of broken rock to the east. There is a large [']Y-2['] on a rock in rooms center." The short description is "You're at Y2."
	Y2 is plugh with Building.
	After looking in Y2: if a random chance of 1 in 4 succeeds, say "A hollow voice says 'Plugh'." 

Down from Jumble of Rock is east from Y2. "You are in a jumble of rock,[roman type] with cracks everywhere."
	Above is Hall of Mists.
	Jumble of Rock is towards Y2 from Hall of Mists.
	Understand "wall/broken/broke" as east when the location is Y2. 

Window on Pit is west from Y2. "You are at a window on a huge pit,[roman type] which goes up and down out of sight. A floor is indistinctly visible over 50 feet below. Directly opposite you and 25 feet away there is a similar window." The short description is "You're at Window on Pit."
	Instead of going by keyword whytoo in Window on Pit, try going east.

Chapter 5 - Rough Tunnels

The Dirty Passage is below Low N/S Passage. "You are in a dirty broken passage.[roman type] To the east is a crawl. To the west is a large passage. Above you is a hole to another passage." The short description is "You're in Dirty Passage."
	Understand "hole" as up when the location is Dirty Passage.

The Pit Ledge is east from the Dirty Passage. "You are on the brink of a small clean climbable pit.[roman type] A crawl leads west."
	Understand "crawl" as west when the location is Pit Ledge.
	Understand "crawl" as east when the location is the Dirty Passage. 

Bottom of Pit is below the Pit Ledge. "You are on the bottom of a small pit[roman type] with a little stream, which enters and exits through tiny slits."
	Instead of going by keyword pit-keyword in Pit Ledge, try going down.
	Understand "climb" as up when the location is Bottom of Pit. 
	Understand "climb" as down when the location is Pit Ledge.

The Dusty Rock Room is west from the Dirty Passage. "You are in a large room full of dusty rocks.[roman type] There is a big hole in the floor. There are cracks everywhere, and a passage leading east." The short description is "You're in Dusty Rock Room."
	Understand "hole/floor" as down when the location is Dusty Room.

Part V - Hall of Mists, West

Chapter 1 - West Side of Mists

The West Side of the Fissure is inside from the fissure-door. "You are on the west side of the fissure[roman type] in the Hall of Mists." 
	Instead of retreating in West of Fissure: try going outside.
	Understand "hall" as outside when the location is West Fissure. [For some reason, "east" never leads across from the West Side.]

	Rule for choosing notable locale objects for West of Fissure: 
		set the locale priority of the fissure-door to 0; continue the activity. [The original doesn't mention the bridge when on the west side.]
	
	There are some diamonds in West of Fissure. "There are diamonds here!"

West End of Hall of Mists is west from West Fissure. "You are at the west end of Hall of Mists.[roman type] A low wide crawl continues west and another goes north. To the south is a little passage 6 feet off the floor." The short description is "You're at West End of Hall of Mists."

Chapter 2 - Low Wide Passages

[Surprisingly enough, Crowther implemented the low wide passage as two different rooms, each north of a different room.]

A low wide passage is a kind of room. The printed name of a low wide passage is usually "Low Wide Passage". The description of a low wide passage is usually "You have crawled through a very low wide passage[roman type] parallel to and north of the Hall of Mists." 
	Every low wide passage has a room called the connected room.
	
	Instead of going, going by keyword, retreating in a low wide passage (called the venue):
		move the player to the connected room of the venue, without printing a room description;
		now look later is true.

Low Wide Passage 1 is a low wide passage, north from West End of Mists. 
	The connected room is West Side of the Fissure.

Low Wide Passage 2 is a low wide passage, north from West Side of the Fissure. 
	The connected room is West End of Mists.
		
Chapter 3 - Long Hall

East End of Long Hall is west from West End of Mists. "You are at the east end of a very long hall[roman type] apparently without side chambers. To the east a low wide crawl slants up. To the north a round two foot hole slants down." The short description is "You're at East End of Long Hall."
	Up is West End of Mists.
	Understand "crawl" as west when the location is West End of Mists. 

West End of Long Hall is west from East End of Long. "You are at the west end of a very long featureless hall."
	Outside from West of Long is west from East of Long.

Part VI - A-mazing

A mazing room is a kind of room. 
	The printed name of a mazing room is usually "Maze". The description of a mazing room is usually "You are in a maze[roman type] of twisty little passages, all alike."

A dead end is a kind of room. 
	The printed name of a dead end is usually "Dead End". The description of a dead end is usually "Dead End[roman type]".
	
Chapter 1 - Main Maze

Maze 1 is a mazing room. West from Maze 1 is up from West End of Mists. 
	Instead of going south in West End of Mists, try going up. 
	[Mapping Maze 1 south from West End of Mists wrecks the Inform 7 index map. Mapping Maze 1 up, instead, places the whole maze on a level above the rest of the game world, a much more readable arrangement. This has no effect in game, so we might as well.]
	Understand "climb" and "[passa]" as up when the location is West End of Hall of Mists. 

Maze 2 is a mazing room, east of Maze 1.

Maze 3 is a mazing room, south of Maze 1.
	North is Maze 1. 
	East from Maze 3 is south from Maze 2.

East from Maze 2 is north from a mazing room called Maze 4.
	Index map with Maze 4 mapped southeast from Maze 2.
	
Deadend 1 is a dead end, east from Maze 4. Outside from Deadend 1 is east from Maze 4.
Deadend 2 is a dead end, south from Maze 4. Outside from Deadend 2 is south from Maze 4.	
Deadend 3 is a dead end, below Maze 3. Outside from Deadend 3 is below Maze 3.

Maze 5 is a mazing room.

Maze 6 is a mazing room, below Maze 5.
	West is Maze 5.
	East of Maze 6 is south of Maze 3. 
	Index map with Maze 6 mapped southwest of Maze 3.

West from Maze 5 is west from a mazing room called Maze 7.

Maze 8 is a mazing room, south of Maze 6. 
	West is Maze 7.

Above Maze 8 is north from a mazing room called Maze 9.  West from Maze 9 is south from Maze 7.

Deadend 4 is a dead end, south of Maze 9. Outside from Deadend 4 is south of Maze 9.

Maze A is a mazing room, east of Maze 8.

Deadend 5 is a dead end, below Maze A. Outside from Deadend 5 is below Maze A.

Chapter 2 - End of Maze

Brink of Pit is east of Maze A. "You are on the brink of a thirty foot pit[roman type] with a massive orange column down one wall. You could climb down here but you could not get back up. The maze continues at this level." The short description is "You're at Brink of Pit."
	Down is Bird Chamber. Up from Bird Chamber is nowhere.
	Understand "climb" as down when the location is Brink of Pit.

Deadend 6 is a dead end. West of Deadend 6 is south of Brink of Pit.
	Outside from Deadend 6 is south of Brink of Pit.
	Index map with Deadend 6 mapped southeast of Brink of Pit.

Part VII - Under Construction

Crossness relates one room to one room. The verb to be towards crossover from implies the crossness relation.
Bedquiltness relates one room to one room. The verb to be towards bedquilt from implies the bedquiltness relation.
Slabness relates one room to one room. The verb to be towards slabroom from implies the slabness relation.

Table of Keywords (continued)
Name		Relevant Relation
cross		the crossness relation
bedqu		the bedquiltness relation
slabroom	the slabness relation

Understand "slab" or "slab room" as slabroom. Understand "bedquilt" as bedqu. Understand "crossover" as cross.

To transport the player randomly to (main place - a room) with likelihood (MN - a number) or to (second place - a room):
	let destinations be MN copies of the main place;
	add the second place to destinations;
	go to a room at random from destinations.
	
To transport the player randomly to (main place - a room) with likelihood (MN - a number) or to (second place - a room) with likelihood (SN - a number) or to (third place - a room):
	let destinations be MN copies of the main place;
	add SN copies of the second place to destinations;
	add the third place to destinations;
	go to a room at random from destinations.
	
To decide what list of rooms is (N - a number) copies of (R - a room):
	let L be a list of rooms;
	repeat with X running from 1 to N:
		add R to L;
	decide on L.
		
To go to a room at random from (LR - a list of rooms):
	sort LR in random order;
	if entry 1 in LR is the location, say "You have crawled around in some little holes and wound up back in the main passage.";
	move the player to entry 1 in LR, without printing a room description;
	now look later is true.
	
Chapter 1 - Crossover

The Crossover is west of the West Chamber. "You are at a crossover[roman type] of a high N/S passage and a low E/W one."
	South is the Hall of Mists. 
	Crossover is below West Chamber. Up is nowhere.
	West from Crossover is down from East End of Long Hall, north from the East End of Long Hall. 
	Crossover is towards crossover from Hall of Mists.
	
Deadend 7 is a dead end, north from Crossover. Outside from Deadend 7 is north from Crossover.
	
Chapter 2 - Complex Junction

Complex Junction is below Dusty Rock Room. "You are at a complex junction.[roman type] A low hands and knees passage from the north joins a higher crawl from the east to make a walking passage going west. There is also a large room above. The air is damp here.

A sign in midair here says [']Cave under construction beyond this point. Proceed at own risk.[']". 
	Understand "climb/room" as up when the location is Complex Junction.
	
Chapter 3 - Bedquilt

Bedquilt is west from Complex Junction. "You are in Bedquilt,[roman type] a long east/west passage with holes everywhere. To explore at random select north, south, up, or down." 
	Bedquilt is towards bedquilt from Dusty Rock Room.
	Instead of going south in Bedquilt: transport the player randomly to Bedquilt with likelihood 4 or to Slab Room; rule succeeds.
	Instead of going up in Bedquilt: transport the player randomly to Bedquilt with likelihood 8 or to Secret N/S Canyon with likelihood 1 or to Dusty Room; rule succeeds.
	
Chapter 4 - Swiss Room

Northeast from Swiss Cheese Room is west from Bedquilt. "You are in a room whose walls resemble swiss cheese.[roman type] Obvious passages go west, east, ne, and nw. Part of the room is occupied by a large bedrock block." The short description is "You're in Swiss Cheese Room."
	Instead of going north in Swiss Cheese: transport the player randomly to Swiss Cheese with likelihood 6 or to Junction Canyon with likelihood 3 or to Large Low; rule succeeds.
	Instead of going south in Swiss Cheese: transport the player randomly to Swiss Cheese with likelihood 4 or to Tall Canyon; rule succeeds. 
	[This last line actually existed in the original, but could never execute; due to a buggy GOTO statement, going south in Swiss crashed the program.]
	
Chapter 5 - Twopit Area

The Twopit Room is west from Swiss Cheese. "You are in the Twopit Room.[roman type] The floor here is littered with thin rock slabs, which make it easy to descend the pits. There is a path here bypassing the the pits to connect passages from east and west. There are holes all over, but the only big one is on the wall directly over the east pit where you can't get to it." The short description is "You're in Twopit Room."

The Large Low Room is northeast from Twopit. "You are in a large low room.[roman type] Crawls lead N, SE, and SW."

Dead End Crawl is north from Large Low. "Dead End Crawl.[roman type]".

Chapter 6 - Slab Room

The Slab Room is north from Swiss Cheese. "You are in a large low circular chamber[roman type] whose floor is an immense slab fallen from the ceiling (slab room). East and west there once were large passages, but they are now filled with boulders. Low small passages go north and south, and the south one quickly bends west around the boulders." The short description is "You're in Slab Room."
	Slab Room is towards slabroom from Bedquilt.

Part VIII - Secretions

Secretness relates one room to one room. The verb to be towards secret from implies the secretness relation.
Canyonness relates one room to one room. The verb to be towards canyon from implies the canyonness relation.

Table of Keywords (continued)
Name		Relevant Relation
secret		the secretness relation
canyo		the canyonness relation

Understand "canyon" as canyo. 

Chapter 1 - Secret NS Canyon

Secret NS Canyon is above the Slab Room. "You are in a secret NS canyon[roman type] above a large room." 
	Index map with Secret NS Canyon mapped southwest of West Side Chamber.
	
Chapter 2 - E/W Canyon

West from E/W Canyon is south from Secret NS Canyon. "You are in Secret Canyon[roman type] which here runs E/W. It crosses over a very tight canyon 15 feet below. If you go down you may not be able to get back up." The printed name is "Secret Canyon".
	East is Hall of Mt King.
	E/W Canyon is towards secret from the Hall of Mt King.
	Index map with E/W Canyon mapped southeast from Secret NS Canyon.
	
Chapter 3 - Secret Canyon

The Junction Canyon is a room. "You are in Secret Canyon[roman type] at a junction of three canyons, bearing north, south, and se. The north one is as tall as the other two combined." The printed name is "Secret Canyon".
	Up is Dusty Room. Southeast is Bedquilt. Northwest from Bedquilt is nowhere.
	
Chapter 4 - Secret N/S Canyon

The Secret N/S Canyon is south from Junction Canyon. "You are in a secret N/S canyon[roman type] above a sizable passage."

Chapter 5 - Wide Place

The Wide Place is below E/W Canyon. "You are at a wide place[roman type] in a very tight N/S canyon."
	Up is nowhere.
[	Index map with Wide Place mapped southeast from Tall.]

Too Tight is south from Wide Place. "The canyon here becomes too tight[roman type] to go further south." 

Chapter 6 - Tall E/W Canyon

East from Tall E/W Canyon is north from the Wide Place. "You are in a tall E/W canyon.[roman type] A low tight crawl goes 3 feet north and seems to open up." 
	North is Swiss Cheese Room. 
	Tall Canyon is towards canyon from Swiss Cheese.
[	Index map with Tall mapped southeast from Boulders.]

South from Boulders is west from Tall Canyon. "The canyon runs into a mass of boulders[roman type] - dead end."
	Index map with Boulders mapped southwest from Swiss.

Part IX - Multi-room Handling

Chapter 1 - Backdrops

The trees are a backdrop. They are in End of Road, Hill in Road, Forest 1, Forest 2, Valley, Streambed, and Stream's End. The description is "The trees of the forest are large hardwood oak and maple, with an occasional grove of pine or spruce. There is quite a bit of undergrowth, largely birch and ash saplings plus nondescript bushes of various sorts. This time of year visibility is quite restricted by all the leaves, but travel is quite easy if you detour around the spruce and berry bushes." 

The mistiness is a privately-named backdrop. It is in the Top of Small, Hall of Mists, East Fissure, and West Fissure. The description is "Mist is a white vapor, usually water, seen from time to time in caverns. It can be found anywhere but is frequently a sign of a deep pit leading down to water." 
	Understand "mist" as the mistiness.

Understand "[trees]" and "[mistiness]" as examining.
[To allow >TREES and >MIST to simply print a block of text, as in the original.]
	
The crawlability marker is a privately-named backdrop. It is in West End of Mists, Dirty Passage, Pit Ledge, Entryway, and Debris Room.
[To allow "crawl" to work as a movement keyword in certain areas, and otherwise to be a synonym for "go".]

Chapter 2 - Regions

Outdoors is a region. End of Road, Hill in Road, Valley, Streambed, Stream's End, Forest 1, and Forest 2 are in Outdoors. 
	End of Road, Hill in Road, Forest 1, Forest 2, Valley, Streambed, Stream's End, Building, Entryway, and Cobble Crawl are lighted.

Preliminary Cave is a region. Cobble Crawl, Bird Chamber, Awkward Canyon, Debris Room, Top of Small, and Entryway are in Preliminary Cave.

Deep Cave is a region.

	Misty Area is a region in Deep Cave. Hall of Mists, East Bank of Fissure, Gold Room, West Fissure, West End of Mists, Low Wide 1, Low Wide 2, East of Long, and West of Long are in Misty Area.

	Mountain King's Domain is a region in Deep Cave. Hall of Mt King, Low N/S, Y2, West Chamber, South Chamber, Crossover, Jumble of Rock, Window on Pit, and Deadend 7 are in King's Domain.

		Rough Tunnels is a region in Mountain King's Domain. Dirty Passage, Pit Ledge, Dusty Room, and Bottom of Pit are in Rough Tunnels.

	Mazy is a region in Deep Cave. Maze 1, Maze 2, Maze 3, Maze 4, Maze 5, Maze 6, Maze 7, Maze 8, Maze 9, Maze A, Deadend 1, Deadend 2, Deadend 3, Deadend 4, Deadend 5, Deadend 6, and Brink of Pit are in Mazy.

	Construction is a region in Deep Cave. Complex Junction, Bedquilt, Swiss Cheese, Twopit Room, Large Low, Dead End Crawl, and Slab Room are in Construction.

	Secrets is a region in Deep Cave. Secret NS Canyon, E/W Canyon, Junction Canyon, Secret N/S Canyon, Wide Place, Too Tight, Tall Canyon, and Boulders are in Secrets.

Book Three - Frustrations

Part I - Definitions

Woken dwarves is a truth state that varies. Dwarf clock is a number that varies.

The little axe is a thing. "There is a little axe here."
			
Breakroom is a room.

A dwarf is a kind of person. There are 3 dwarves.
	A dwarf has a room called old location. A dwarf has a number called patrol position. The printed name of a dwarf is always "dwarf".
	A dwarf can be curious. [Following the player.]
	A dwarf can be angry. [Attacking this turn.]
	A dwarf can be victorious. [Successfully hit the player with a knife.]
	A dwarf can be killed. 
	The dwarf patrol route is a list of rooms that varies. The dwarf patrol route is {Dirty Passage, Low N/S Passage, Hall of Mt King, West Side Chamber, Crossover, East End of Long Hall, West End of Mists, West of Fissure, East of Fissure, Hall of Mists, Hall of Mt King, Low N/S Passage, Dirty Passage, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom, Breakroom}.
	[Surprisingly enough, the dwarves walk along a preset pattern, rather than appearing randomly as in later versions.]

When play begins: 
	let N be 2;
	repeat with D running through dwarves:
		now the patrol position of D is 2 plus N;
		increase N by 2.
	
Part II - Behavior

Chapter 1 - of Dwarves

To decide if the dwarves are awake:
	if the player has been in the Hall of Mists, decide yes;
	decide no.

Before looking: [Showing the room description serves as Crowther's "Every turn" rule: all game logic is contained within one big loop.]
	if the dwarves are awake and the axe is off-stage and the player is in Deep Cave: 
		if a random chance of 1 in 20 succeeds:
			move the little axe to the location;
			say "A little dwarf just walked around a corner, saw you, threw a little axe at you which missed, cursed, and ran away.";
			now dwarf clock is 2;
		continue the action;
	otherwise:
		if the axe is on-stage, update dwarf status.

The new location is a room that varies.
	Setting action variables for going:
		if the noun is a direction, now the new location is the room noun from the location;
		if the noun is a door, now the new location is the other side of the noun.
		
	Every turn: now the new location is the location.

To update dwarf status: [This complex code block is basically lifted wholesale from Crowther's FORTRAN implementation.]
	increment dwarf clock;
	repeat with D running through not killed dwarves:
		now D is not angry;
		if (patrol position of D + dwarf clock) is less than 9, next; [Dwarves don't appear right away after being awakened.]
		if (patrol position of D + dwarf clock) is greater than 23 and D is not curious, next; [Disable incurious dwarves after a while.]
		now the old location of D is the location of D;
		if D is not curious or the new location is not regionally in Deep Cave: 
			[The dwarf follows the patrol route if not following player or if player leaves main cave.]
			move D to entry (patrol position of D + dwarf clock - 8) of dwarf patrol route;
			now D is not curious;
			if D is not in the location and the old location of D is not the location, next; [Hasn't found player, so process the next dwarf.]
		now D is curious; [This dwarf has found the player; time to start following!]
		move D to the location;
		if the old location of D is the location of D: [The dwarf hasn't moved this turn, and so decides to attack.]
			now D is angry;
			if a random chance of 1 in 10 succeeds, now D is victorious;
	if there is a curious dwarf:
		say "There [if there is exactly one curious dwarf]is a threatening little dwarf[otherwise]are [number of curious dwarves] threatening little dwarves[end if] in the room with you!";
		if there is an angry dwarf:
			if there is exactly one angry dwarf, say "One sharp nasty knife is thrown at you!";
			otherwise say "[number of angry dwarves] of them throw knives at you!";
			if there is a victorious dwarf:
				if there is exactly one angry dwarf, say "He gets you!";
				otherwise say "[number of victorious dwarves] of them get you.";
				end the story saying "Games over";
			otherwise:
				if there is exactly one angry dwarf, say "It misses!";
				otherwise say "None of them hit you!";
	continue the action.

Rule for writing a paragraph about a dwarf: 
	repeat with D running through dwarves in the location: 
		set the locale priority of D to 0. [The preceding rule has already printed the dwarf presence and action lines.]
	
Before going:
	if the noun is a direction, let dest be the room noun from the location;
	if the noun is a door, let dest be the other side of the noun;
	repeat with D running through curious dwarves:
		if the dest is the old location of D:
			now look later is true;
			say "A little dwarf with a big knife blocks your way." instead.
		
Chapter 2 - towards Dwarves

Does the player mean taking a dwarf: it is very unlikely.
Does the player mean attacking a dwarf: it is very likely.

The block attacking rule is not listed in any rulebook.

Check attacking: if the noun is not a curious dwarf, say "There is nothing here to attack." instead.

Rule for supplying a missing noun when attacking:
	if a dwarf is curious, now the noun is a random curious dwarf;
	if a dwarf is in the location and the noun is nothing, now the noun is a random dwarf in the location.
	[This way, typing "attack" alone will work.]

Instead of attacking a dwarf (called the target):
	if a random chance of 6 in 10 succeeds:
		say "You killed a little dwarf.";
		now the target is killed;
		now the target is not curious;
		now the target is not angry;
		remove the target from play;
	otherwise:
		say "You attack a little dwarf, but he dodges out of the way.";
	now look later is true.
	
Book Four - Augmentations

Part I - Text

Chapter 1 - Introduction

Intro printed is a truth state that varies.

After printing the banner text when intro printed is false: 
	now intro printed is true; 
	say "[line break]Welcome to Adventure!! Would you like instructions?[paragraph break]  "; 
	if the player consents:
		say line break;
		say "Somewhere nearby is Colossal Cave, where others have found fortunes in treasure and gold, though it is rumored that some who enter are never seen again. Magic is said to work in the cave. I will be your eyes and hands. Direct me with commands of 1 or 2 words.";
		say "(Errors, suggestions, complaints to Crowther)[line break](If stuck type HELP for some hints)";
		say paragraph break;
	otherwise:
		say line break;
	say "(Type ABOUT for details about this specific Inform 7 implementation.)";

Chapter 2 - Help

Understand the commands "help", "what" as something new. Understand "help" or "what" as requesting help. 
	Requesting help is an action out of world applying to nothing. Carry out requesting help: say "I know of places, actions, and things. Most of my vocabulary describes places and is used to move you there. To move try words like forest, building, downstream, enter, east, west, north, south, up, or down. I know about a few special objects, like a black rod hidden in the cave. These objects can be manipulated using one of the action words that I know. Usually you will need to give both the object and action words (in either order), but sometimes I can infer the object from the verb alone. The objects have side effects - for instance, the rod scares the bird.
	[paragraph break]Usually people having trouble moving just need to try a few more words. Usually people trying to manipulate an object are attempting something beyond their (or my!) capabilities and should try a completely different tack.
	[paragraph break]To speed the game you can sometimes move long distances with a single word. For instance, [']building['] usually gets you to the building from anywhere above ground except when lost in the forest. Also, note that cave passages turn a lot, and that leaving a room to the north does not guarantee entering the next from the south. Good luck!"

	After reading a command: 
		let T be indexed text; 
		let T be the player's command; 
		replace the regular expression "^\s*\?" in T with "help";
		change the text of the player's command to T. 
		[All this just to parse ">?" as ">HELP".]
		
Chapter 3 - About

Understand the command "about" as something new. Understand "about" as requesting the about info. 
	Requesting the about info is an action out of world applying to nothing. Carry out requesting the about info: say "This is release [no line break][release number].[no line break][release subnumber] of the Inform 7 version of Will Crowther's Adventure, ported by Chris Conley.  

Source taken from IF Archive http://ifarchive.smallwhitehouse.org/indexes/if-archiveXgamesXsourceXinform.html
	
I started this project for two reasons: first, to learn Inform 7; second, to create a source text that could serve as a useful reference for future learners. It kind of grew much larger than I'd originally planned, but I've finally gotten to a point at which I'm really happy with it. 

My main design goal was to reproduce the output text and functional world model of Crowther's original program as closely as feasible, while still keeping most of the helpful features of a modern IF engine. So, features that don't detract from the core gameplay of the original, such as commands like UNDO and INVENTORY and a parser capable of understanding commands more complex than >VERB NOUN, remain implemented by default in this Inform version.
	
Credit is owed to Will Crowther and Don Woods, for obvious reasons; to Graham Nelson and Emily Short, for making this possible; to Dennis G. Jerz, for the original inspiration; to my testers, Cheryl Lewis, Paul Laroquod, Finn Rosenloev, Laura Still, Kelly Belz, and Chelsea Donahue; and to Owen Williams and Oskat Forest Park for facilitating much of the initial work on this project."

Part II - Going

Chapter 1 - in Darkness

Before going, going by keyword, retreating when in darkness:
	if a random chance of 1 in 4 succeeds, end the story saying "You fell into a pit and broke every bone in your body!" instead. 
	[Actually dying in darkness is surprisingly not guaranteed. And yes, even traveling via magic words or into lighted rooms can kill the player.]

Chapter 2 - by Keyword

Going by keyword is an action applying to one value. Understand "[goto] [keyword]" or "[keyword]" or "enter [keyword]" or "go [keyword]" as going by keyword. 

The cave-keyword is a keyword. Understand "cave" as cave-keyword.

Check going by keyword:
	if the keyword understood is the cave-keyword:
		if the location is in Outdoors or the location is Building and the location is not Stream's End:
			instead say "I don't know where the cave is, but hereabouts no stream can run on the surface for long. I would try the stream.";
		otherwise:
			instead say "I need more detailed instructions to do that.";
	otherwise:
		choose the row with the name of the keyword understood from the Table of Keywords;
		unless the location relates to a room by the Relevant Relation entry:
			if the keyword understood is xyzzy: 
				now look later is true; 
				say nothinghap instead; [Xyzzy gets its own special error message.]
			say "[dunno]" instead;
		otherwise:
			now the new location is the room which the location relates to by the Relevant Relation entry;
			continue the action.

Carry out going by keyword:
	choose the row with name of the keyword understood from the Table of Keywords;
	if the keyword understood is depression and the location is in preliminary cave and the grate is closed:
		move the player to Entryway, without printing a room description;
	otherwise:
		let new area be the room which the location relates to by the Relevant Relation entry;
		move the player to the new area, without printing a room description.

Chapter 3 - Back

Retreating is an action applying to nothing. 
	Understand the commands "back", "return", "retreat" as something new. 
	Understand "retreat" as retreating. Understand "go back" as retreating. Understand the commands "back", "return" as "retreat".

The prior location is a room that varies. 
	Setting action variables for going: now the prior location is the location. 
	Setting action variables for going by keyword: now the prior location is the location.
	Setting action variables for retreating: now the new location is the prior location.

Check retreating:
	if the room back from the location is a room, try going back instead; [So that rooms that have a "back" direction defined use it properly.]
	if the number of visited rooms is one, say "You haven't gone anywhere yet!" instead. 
	[Not authentic; going "back" on the first turn was bugged, with terrible thrashing-about-in-darkness results.]

Carry out retreating:
	let the temp location be the location; [To properly account for >GO BACK >GO BACK]
	move the player to the prior location, without printing a room description;
	now the prior location is the temp location.

Part III - Other Verbs

Consuming is an action applying to one thing. [We don't need to hold something to try to eat it.]
	Understand the command "eat" as something new. Understand "eat [something]" as consuming. 
	Check consuming a thing which is not edible: say "There is nothing here to eat." instead.
	Carry out consuming: remove the noun from play.
	Report consuming: say "Eaten!"

Striking is an action applying to one thing. 
	Understand "strike [something]" as striking. 
	Carry out striking: say nothinghap instead.
	
Understand the command "pour" as something new. Understand "pour [something preferably held]" as pouring. 
	Pouring is an action applying to one thing. 
	Carry out pouring: say "You can't pour that." instead.

Understand the command "throw" as something new. Understand "throw [text]" and "throw" as a mistake ("I have trouble with the word [']throw['] because you can throw a thing or throw at a thing. Please use drop or attack instead.").

Understand "dig [text]" and "dig" and "excavate [text]" and "excavate" as a mistake ("Digging without a shovel is quite impractical: even with a shovel progress is unlikely."). [The secondary keyword in the original was spelled "EXCIV", but I assume that was a typo.]

Understand "blast [text]" and "blast" as a mistake ("Blasting requires dynamite.").

Understand "lost [text]" and "lost" as a mistake ("I'm as confused as you are.").

Understand "enter stream/streambed/water" as a mistake ("Your feet are now wet.").

Understand "opensesame" and "open sesame" as a mistake ("Good try, but that is an old worn-out magic word.")

To say unsure facing: say "I am unsure how you are facing. Use compass points or nearby objects." 
	Understand "turn" as a mistake ("[unsure facing]").
	Understand "right" and "[goto] right" and "go right" as a mistake ("[unsure facing]") when the location is not Mt King.
	Understand "left" and "[goto] left" and "go left" as a mistake ("[unsure facing]") when the location is not Hall of Mists and the location is not Mt King.
	Check going forward when the room forward from the location is nowhere: say unsure facing instead.

After deciding the scope of the player: repeat with R running through portable things begin; place R in scope; end repeat.
[The original had a different "you can't see that" error message if the parser knew of the noun.]

	The knife is a thing. Understand "knives/boulder/weapon" as the knife. [The player could refer to this thing but not manipulate it.]
	
After reading a command when the player's command includes "[something distant]" and the player's command does not include " all/it/him/her/them":
	say "I see no [matched text] here." instead; 
		
	Definition: a thing is distant:
		if it is a dwarf and there is a curious dwarf, decide no;
		if it is enclosed by the location, decide no;
		decide yes.
		[The parser should not print this special "can't see that" message for things held in inventory, for instance.]
		
After reading a command when the player's command matches "[something obvious]":
	say "What do you want to do with the [player's command]?" instead.
	
	Definition: a thing is obvious if it is not scenery and it is not distant and it is not a door.

After reading a command when the player's command includes "[yourself]" and the player's command does not include " all":
	replace the matched text with "gibberish". [The original featured no "me/myself" object.]
	
After reading a command when the player's command includes " [direction] " and the player's command does not include " all":
	let M be indexed text;
	let M be the matched text;
	if M is "down" and the player's command includes "put", continue the action; 
	[>PUT IT DOWN and >PUT DOWN IT should not be parsed as movement.]
	if M is "up" and the player's command includes "cover/pick", continue the action;
	change the text of the player's command to M.
	[The original allowed typing any verb+direction, like >CRAWL W or even >E ATTACK, to move. "Go" was effectively a dummy verb.]
	
After reading a command when the player's command matches the regular expression "crawl" and the location is uncrawlable: 
	now look later is true; 
	say "Which way?" instead. ["Crawl" gets its own special disambiguation message, possibly because in some areas it can refer to specific rooms or directions, and otherwise it is a sensible synonym for "go".]
			
	To decide if the location is uncrawlable:
		if the crawlability marker is in the location, decide no;
		decide yes.
	
The floor is a backdrop. The floor is everywhere. Understand "room/rock" as the floor.
	Before taking the floor:
		now look later is true;
		say "I can only tell you what you see as you move about and manipulate things. I cannot tell you where remote things are." instead.

Part the Last - Miscellany

Test cave with "e / get all / west / south / south / south / open / down".

Test puzzle with "e / get lamp / xyzzy / light / e / get cage / w / get rod / w / w / drop rod / get bird, rod / w / d / d".

Test canyon with "e / get lamp / plugh / light / e / up / d / secret / w / d / s".

Test battle with "e / get lamp / xyzzy / light / w / w / w / d / abstract axe to mists".