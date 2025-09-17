# Okay, so you want a microphone input system for a voice chat or interesting game mechanic? Lets set that up
# First lets set the project up properly. Open up the the project settings and look for the Audio catagory then in the Driver catagory click on "Enable input" Project -> Project settings -> Audio -> Driver -> Enable input = true
# Now that the editor has restarted lets finish the set up. Go to the audio tab at the bottom of your screen and create two new audio buses. First one called "Record2" and the second called "Record" or what ever names you'd like
# Now click on the "M" on Record2 to mute it. Then on Record one add an effect "Record" and on the drop down at the bottom of the Record audio bus select "Record2"

# That is the set up done, for the most part at least. Lets get to adding in the rest now!
# In your player scene add an AudioStreamPlayer. Change the Stream type to AudioStreamMicrophone. And change the bus to Record and ensure you have autoplay on (you can add a toggle system if you'd like and ill explain it later)

# Now in your player script we need to do a little set up.

extends CharacterBody3D

var volume

func _process(delta: float) -> void:
  volume = AudioServer.get_bus_peak_volume_left_db(AudioServer.get_bus_index("Record"), 0)

  # Thats it. now if you want a visual representation of it working we can do that!
  # add a sprite
  if volume > -50: # a value of -50 seems to work for me. but you could also get this to be configured by the player
    lerp($Sprite.position.y, volume, 1) # i placed my sprite at a position of x = 275.0 y = -200.0. Now when you talk you'll see it move.
  # if you wanted a system to detect when the player is shouting as loud as godot can register you would do this
  if volume > -15: # we use this as -10 to -15 is shouting any lower is unrealistic but again configure how you like and you could get the player to configure this too!
    print("SHOUTING DETECTED!") # logic example


# if you want the player to be able to mute themself then add the following

@onready var mic: AudioStreamPlayer = $AudioStreamPlayer
var muted: bool = false # or true depending on what you want the default to be

func _input(event: InputEvent) -> void: # or this could be under the process or physics process but to me it makes more sense to go here :D
  if Input.is_action_just_pressed("mute") and muted:
    muted = false
    mic.playing = true
  elif Input.is_action_just_pressed("mute") and !muted:
    muted = true
    mic.playing = false



# I AM GOING TO ADD MORE TO THIS OR MAKE A SECOND FILE TO RUN THROUGH MORE STUFF IN MORE DETAIL :D


