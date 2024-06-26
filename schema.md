Here is the schema of various entities:

First the player:

```json
{
  "type": "player",
  "id": "player",
  "inventory": ["item1", "item2"],
  "location": "foo",
  "prior_location": "foo",
  "lamp_on": true
}
```

Locations:

```json
{
  "type": "location",
  "id": "end_of_road",
  "name": "End of Road",
  "description": "You are standing at the end of a road before a small brick building. Around you is a forest. A small stream flows out of the building and down a gully.",
  "short_description": "You're at End of Road again.",
  "connections": [
    {
      "direction": "west",
      "location": "hill_in_the_road"
    },
    {
      // Note you can have multiple terms for a direction
      "direction": "east,building,enter",
      "location": "building"
    }
  ],
  "properties": {
    "dark": false
  }
}
```

Objects:

```json
{
  "type": "object",
  "id": "keys",
  "name": "Keys",
  "location": "building", // "inventory" if with the player
  "description": "Old worn skeleton keys",
  // Optional implementation notes:
  "notes": "",
  "properties": {}
}
```

```json
{
  "type": "object",
  "id": "nugget_of_gold",
  "name": "Nugget of Gold",
  "location": "nugget_of_gold_room",
  "description": "A sparkling nugget of gold",
  "notes": [
    "If holding the [nugget_of_gold] when climbing to the [hall_of_mists], say \"The dome is unclimbable.\"",
    "If holding the [nugget of gold] when going down from [top_of_small], say \"You're at the bottom of the _pit_ with a broken neck\" and end_game()"
  ]
}
```

Doors:

```json
{
  "type": "door",
  "id": "grate",
  "name": "Grate",
  // Note this can also be a list, especially when it is between two locations and visible in each:
  "location": "streams_end",
  "properties": {
    "open": false,
    "locked": true,
    "key": "keys"
  },
  "notes": "Can be unlocked with [keys]"
}
```

Special entities:

```json
{
  "type": "creature",
  "id": "dwarf",
  "name": "Dwarf",
  "location": "foo",
  "properties": {
    "curious": false,
    "angry": false,
    "victorious": false,
    "killed": false
  }
}
```

```json
{
  "type": "creature",
  "id": "snake",
  "name": "Green snake",
  "location": "hall_of_the_mountain_king",
  "properties": {
    "killed": false
  },
  "notes": [
    "If the [bird] is dropped, then say \"The little bird attacks the green snake, and in an astounding flurry drives the snake away.\" then destroy(\"snake\")",
    "If the player tries to kill the snake directly, tell the user \"You can't kill the snake, or drive it away, or avoid it, or anything like that. But there is a way to get by.\""
  ]
}
```

Algorithms are like notes that are conditional and instructive, and applicable in certain situations:

```json
{
  "type": "algorithm",
  "id": "randomly_lost",
  "relevant": [
    // If *any* item in this list matches the current state, then this algorithm is relevant
    {
      // ALL the conditions in an object must be true
      // When it's relevant given a certain location or list of locations:
      "location": "foo",
      "player": {
        // Has all these items:
        "inventory": ["item1", "item2"],
        // Or any of these items:
        "any inventory": ["item3", "item4"],
        // And does not have these:
        "not inventory": ["item5"],
        "property": {
          "lamp_on": true
        }
      },
      "entities": [
        // Similar matches for any entity, like:
        {
          "type": "object",
          "id": "lamp",
          "property": {
            "lit": false
          }
        }
      ]
    }
  ],
  "notes": ["Instructions for the game engine."]
}
```

When translating text decriptions, translate [roman type] to italics, like "you are in a vast hall[roman type]" to "you are in a vast _hall_".

When referring to an entity with an id inside other text, enclose the entity with brackets, like "Can be unlocked with [key]" refers to the object with id "key".

When referring to a specific action phrase it as a function call. For example "end_game()" refers to ending the game.

Every entity can have notes. Notes are intended for the game engine and are not directly shown to the user.

You can respond with this schema to move:

```json
{
  "name": "move_to",
  "location": "location_id",
  "description": "Text to show the user",
  // Use user_input: false if there are more actions that should immediately follow:
  "user_input": true
}
```

Other actions:

```json
{
  "name": "actions",
  // Move to the inventory:
  "take_object": ["id"],
  // Remove from the game entirely:
  "destroy": ["id"],
  // Move from inventory to current location:
  "drop_object": ["id"],
  "change_entities": [
    // Use null to delete/nullfiy a field
    // Only the fields included will be changed, other fields are unedited
    {
      "type": "entity_type",
      "id": "id",
      "properties": {
        "locked": false
      }
    }
  ]
}
```

For example:

```
> Turn on the lamp

{
  "name": actions",
  "change_entities": [
    {
      "type": "object",
      "id": "lamp",
      "properties": {
        "lit": true
      }
    }
  ]
}
```

If you want to add to a list you can use:

```json
{
  "change_entities": [
    {
      "type": "room",
      "id": "building",
      "append notes": "Another note",
      "properties": {
        "increment gold": 5
      }
    }
  ]
}
```

This will add "Another note" to the list of "notes". It will add 5 to "gold".

If you need to make a random choice, emit this function:

```json
{
  "name": "random",
  "pick_one": ["first", "second"],
  "pick_several": {
    "quantity": 2,
    "sample": ["first", "second", "third"]
  },
  "pick_weighted": {
    "item1": 0.33,
    "item2": 0.66
  }
}
```
