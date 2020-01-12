unit
class Pillar
    inherit GameObject in "GameObject.t"
    export setMoving, getMoving
    var moving : boolean := true
    dx := -2;
    width := 50
    height := 1000
    cwidth := 50
    cheight := 110

    body proc update
	if moving then
	    x += dx
	end if
    end update

    body proc draw
	Draw.FillBox (round (x - width div 2), round (y + cheight div 2), round (x + width div 2), round (y + height div 2), black)
	Draw.FillBox (round (x - width div 2), round (y - cheight div 2), round (x + width div 2), 0, black)
    end draw
    
    proc setMoving(b : boolean)
	moving := b
    end setMoving
    
    fcn getMoving : boolean
	result moving
    end getMoving
end Pillar
