import Balloon in "Balloon.t", Kite in "Kite.t"

var balloon : array 1 .. 10 of ^Balloon
for i : 1..10
    new balloon(i)
end for

loop
    for i : 1..10
	^(balloon(i)).draw
	delay(1)
	^(balloon(i)).erase
	^(balloon(i)).setY(^(balloon(i)).getCentreY+^(balloon(i)).getSpeed)
	if ^(balloon(i)).getCentreY > 500 then
	^(balloon(i)).setY(0)
	^(balloon(i)).setX(Rand.Int(10,400))
	^(balloon(i)).setCol(Rand.Int(1,15))
	^(balloon(i)).setSpeed(Rand.Int(5,30))
    end if
    end for
end loop
/*
var Balloon1, Balloon2: ^Balloon
new Balloon1
new Balloon2
var Kite1 : ^Kite
new Kite1


^Kite1.setX(Rand.Int(10,400))
loop
    ^Balloon1.draw
    ^Balloon2.draw
    delay (200)
    ^Balloon1.erase
    ^Balloon2.erase
    ^Balloon1.setY(^Balloon1.getCentreY+^Balloon1.getSpeed)
    ^Balloon2.setY(^Balloon2.getCentreY+^Balloon2.getSpeed)
    if ^Balloon1.getCentreY > 500 then
	^Balloon1.setY(0)
	^Balloon1.setX(Rand.Int(10,400))
	^Balloon1.setCol(Rand.Int(1,15))
	^Balloon1.setSpeed(Rand.Int(5,30))
    end if
    if ^Balloon2.getCentreY > 500 then
	^Balloon2.setY(0)
	^Balloon2.setX(Rand.Int(10,400))
	^Balloon2.setCol(Rand.Int(1,15))
	^Balloon2.setSpeed(Rand.Int(5,30))
    end if
end loop

