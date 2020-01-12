unit
class Thing
    export setX, setY, setCol, getCentreX, getCentreY, getWidth, getHeight, getColour, draw, erase, setSpeed, getSpeed
    var centreX, centreY, width, height, col, speed: int
    centreX := 100
    centreY := 100
    width := 20
    height := 30
    col := 5
    speed := 30
    
    proc setSpeed (spd : int)
	speed := spd
    end setSpeed
    
    fcn getSpeed : int
	result speed
    end getSpeed
    
    proc setX (x : int)
	centreX := x
    end setX
    
    proc setY (y : int)
	centreY := y
    end setY
    
    proc setCol (colr : int)
	col := colr
    end setCol
    
    fcn getCentreX : int
	result centreX
    end getCentreX

    fcn getCentreY : int
	result centreY
    end getCentreY

    fcn getWidth : int
	result width
    end getWidth

    fcn getHeight : int
	result height
    end getHeight

    fcn getColour : int
	result col
    end getColour

    deferred proc draw

    proc erase
	var lastCol : int := getColour
	col := 0
	draw
	col := lastCol
    end erase
end Thing

