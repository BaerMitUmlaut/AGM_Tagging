AGM_Tagging
===========

An addition to AGM that provides spray paint cans with which you can tag buildings.

## Usage
By default 10 spray paint cans are added to the AGM Miscellaneous Box, alternativley you can add it to a unit's inventory by using `unit addItem "AGM_Spraypaint"` and similar functions. You need to have at least one spray paint can in your inventory to be able to tag buildings.

To tag a building simply approach a building you want to tag and press your interaction key. If you have a spray paint can in your inventory an option will show up to tag the building. Click on that option or simply hit T and a tag will appear on the wall.

## Requirements
You need to have AGM_Core and AGM_Interaction running to use this addon as it is directly integrated in the AGM interaction menu.

## Known issues
* You can only tag buildings and not walls or fences. This is a limitation within Arma as it is hard for a script to detect those objects (for example, cursorTarget returns NULL if you are pointing at a wall that is not part of a building).

* In some cases, the tag won't be visible or appears to be hovering in front of a wall. This is often the case if the hitbox of a building is not accurate enough. Often you can tag a different spot of the building though.

* You can tag doors but the tag will not attach to them and it will float in the air if you open the door. This is an engine limitation because the texture of the building does not actually get changed; instead the tag is a seperate object that tries to line up with a wall.
