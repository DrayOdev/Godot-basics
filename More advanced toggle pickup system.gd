# THIS WAS CREATED IN GODOT 4.2.2 AND MAY NOT WORK IN LATER OR PREVIOUS VERSIONS ALL CODE WAS DONE BY DRAYODEV
# Hey if you were looking for a more advanced yet still compact pickup system this is for you!
# In this short tutorial you we learn how to make a toggle system and you could add ontop of this with a throwing system or an inventory system!

extends CharacterBody3D

var item = null                                            # same as last time the changes occour in the main bit of code!
var holding = false

@onready var arm = $twist_pivot/pitch_pivot/arm
@onready var hand = $twist_pivot/pitch_pivot/hand

#..... movement code and variables


# First we will check for a collision for our ray cast!
# then we set the variable item to the object that our ray is colliding with!

func process(delta):
	if arm.is_colliding():
  	item = arm.get_collider()

# Next we will look for an input from the player only if we are detecting a collision and then that object colliding with the raycast and then if its in the group col

	if Input.is_action_just_pressed("left_click") and arm.is_colliding():
		if item.is_in_group("col"):
			holding = true

# Now we have a toggle system that allows you to pick items up but then your stuck holding it forever so lets allow the player to drop the item!

	if Input.is_action_just_pressed("drop"):
		holding = false

# In this case i set drop to Q but this is preferance and could be changed by the player if you add customisable controls to your game!

# Ok so were done right? well not quite we have all that and its a working toggle yes but we aren't actually doing anything with it so lets now implement what happens if we set holding to true

	if holding:
		item.global_position = lerp(item.global_position, hand.global_position, 0.7)

# Now we are done! I hope your happy with the out come of this and i will next go through a throwing mechanic!

# your hierarchy must include  twist_piviot(node3D) > pitch_pivot(node3D) > arm(RayCast3D) and hand(Marker3D) 
# pitch_pivot should be 0.5 on the Y axis 
# Ray cast target position should be -3 on the Z
# Marker should be -2 on the z
# any item/object you would like the player to interact with must be in the chosen group in my case col but it could be anything
# let me know if you have any issues with this or require assistance you can contact me via my discord server!
# https://discord.com/invite/dBSz63xNhN










