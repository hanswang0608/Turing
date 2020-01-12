%%%%% CLASS FILE IMPORT %%%%%
import Diamond in "Diamond.t", Heart in "Heart.t", Club in "Club.t", Spade in "Spade.t"

%%%%% GLOBAL VARIABLES & OBJECTS %%%%%
var Diamond1 : ^Diamond
var Heart1 : ^Heart
var Club1 : ^Club
var Spade1 : ^Spade

new Diamond1
new Heart1
new Club1
new Spade1

%%%%% MAIN CODE %%%%%   
^Diamond1.setCentre (540, 100)
^Diamond1.draw

^Heart1.setCentre(540,300)
^Heart1.draw

^Club1.setCentre (100, 100)
^Club1.draw

^Spade1.setCentre (100, 300)
^Spade1.draw