# Don't run this whole script blindly, the commands here are examples.

# Importing the classes - verb is wrong but hey, it works
# and I can get stuff out of the class file.
#Import-Module ".\PoSHue.ps1"
Import-Module "$PSScriptRoot\PoSHue.ps1"

#####################
# [HueBridge] Class #
#####################

# OPTION 1

# Instantiate a Bridge class using just its IP address.
# Use this when you don't have a username to use with the
# [HueLight] class.
$Bridge = [HueBridge]::New($Endpoint)

# Get a new APIKey/username from the Bridge.
# Press the link button. If you don't, you'll get an error.
# Returns a [string]
$Bridge.GetNewAPIKey()

# If desired, you can now get a list of lights since the
# APIKey/username is set in the object now.
$Bridge.GetLightNames()

# OPTION 2

# Instantiate a Bridge class using its IP address and an
# APIKey/username.
# Use this when you have an APIKey/username and want a list
# of Hue Lights registered to the Bridge.
$Bridge = [HueBridge]::New($Endpoint, $UserID)

# Get a list of Hue Lights registered to the bridge.
# Returns an [array] object.
$Bridge.GetLightNames()

####################
# [HueLight] Class #
####################

# The Bridge IP address
$Endpoint = "192.168.1.12"

# The name of the light (obtained from [HueBridge]::GetLightNames())
$LightName = "Hue go 1"

# The APIKey/username created on the bridge
$UserID = "38cbd1cbcac542f9c26ad393739b7"

# Instantiate a Hue Light Object using one of the overloads
# Use this constructor to get a reference to an actual light.
$Light = [HueLight]::New($LightName, $Endpoint, $UserID)

# Just see what the HueLight object's properties are.
$Light

# Toggle the light on or off
$Light.SwitchHueLight()
$Light.SwitchHueLight("On")
$Light.SwitchHueLight("Off")

# Set the Brightness to 100, keep the existing hue and saturation
$Light.SetHueLight(100, $Light.Hue, $Light.Saturation)

# Set the Brightness to 50, keep the existing colour temp
$Light.SetHueLight(50, $Light.ColourTemperature)

# Set the Brightness to 100, set colour temp to 370
$Light.SetHueLight(100, 370)

# Just see what the object properties are.
$Light