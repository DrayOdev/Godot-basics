# THIS WAS CREATED IN GODOT 4.2.2 AND MAY NOT WORK IN LATER OR PREVIOUS VERSIONS ALL CODE WAS DONE BY DRAYODEV 
# welocme in the code below will be marked with information explaining what it does and why its there 
extends CharacterBody3D


var item = null

@onready var arm = $twist_pivot/pitch_pivot/arm                                            # you can quickly create @onready variables by dragging the node from the hierarchy and holding ctrl before releasing your mouse button within the code window!
@onready var hand = $twist_pivot/pitch_pivot/hand 


#.... movement code and variables

func _process(delta):
	if Input.is_action_pressed("left_click"):
			if arm.is_colliding():                                                               # arm is our raycast and we are detecting collisions so we can later set the collider to the position of the hand 
				item = arm.get_collider()                                                          # sets the var item to the collider this allows us to move the item anywhere withing the provided 3D space
				if item.is_in_group("col"):                                                        # this is to pervent the player from being able to pick up things you dont want them to pick up. Groups can be assigned via the node tab in the top right of the godot window
					item.global_position = lerp(item.global_position, hand.global_position, 0.7)     # were using a lerp to smooth the movement

# we have done this under the process func to remove the jitter effect if this was under physics_process it would jitter and glitch about

# your hierarchy must include  twist_piviot(node3D) > pitch_pivot(node3D) > arm(RayCast3D) and hand(Marker3D) 
# pitch_pivot should be 0.5 on the Y axis 
# Ray cast target position should be -3 on the Z
# Marker should be -2 on the z
# any item/object you would like the player to interact with must be in the chosen group in my case col but it could be anything
# let me know if you have any issues with this or require assistance feel free to contact me via my discord!
# https://discord.com/invite/dBSz63xNhN
# objects currents can faze through wall i will update with a fix shortly
