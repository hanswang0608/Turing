%%%%% Importation %%%%%
import Dice in "Dice.t"
%%%%% Global Variables %%%%%
var dice : ^Dice
var userinput1 : string (1)
var userinput2 : int
var userinput3 : int
%%%%% Main Code %%%%%
setscreen ("nocursor")
locatexy (155, 210)
put "In this program, we will test out the Dice"
locatexy (150, 190)
put "class and some of the methods we h ave written"
locatexy (230, 100)
put "Press Any Key to Begin"
var a : string (1)
getch (a)
cls
setscreen ("cursor")
new dice
loop
    ^dice.draw
    put "What would you like to do with the die?"
    put "Press 1 to set centre coordinates"
    put "Press 2 to set die colour"
    put "Press 3 to set die value"
    put "Press 4 to set die size"
    put "Press 5 to roll dice"
    put "Press 6 to randomize"
    getch (userinput1)
    if userinput1 = "1" then
	put "Please enter new centre x coordinates: " ..
	
	get userinput2
	put "Please enter new centre y coordinates: " ..
	get userinput3
	^dice.setCentre (userinput2, userinput3)
    elsif userinput1 = "2" then
	put "Please enter new colour code: " ..
	get userinput2
	^dice.setColour (userinput2)
    elsif userinput1 = "3" then
	put "Please enter new die value: " ..
	get userinput2
	^dice.setValue (userinput2)
    elsif userinput1 = "4" then
	put "Please enter new size: " ..
	get userinput2
	^dice.setSize (userinput2)
    elsif userinput1 = "5" then
	^dice.setValue (Rand.Int(1,6))
    elsif userinput1 = "6" then
	^dice.setCentre (Rand.Int(0,500), Rand.Int (0,300))
	^dice.setColour (Rand.Int(0,103))
	^dice.setValue (Rand.Int(1,6))
	^dice.setSize (Rand.Int(20,200))
    end if
    cls
end loop
