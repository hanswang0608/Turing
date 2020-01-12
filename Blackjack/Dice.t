unit
class Dice
    inherit Shape in "Shape.t"
    export setSize, setColour, getValue, setValue, draw
    var dieValue : int
    dieValue := 1
    width := height
    col := black

    proc setSize (size : int)
	height := size
	width := size
    end setSize

    proc setColour (c : int)
	col := c
	if col < 0 then
	    col := black
	elsif col > 255 then
	    col := black
	end if
    end setColour

    fcn getValue : int
	result dieValue
    end getValue

    proc setValue (val : int)
	dieValue := val
	if dieValue < 1 then
	    dieValue := 1
	elsif dieValue > 6 then
	    dieValue := 1
	end if
    end setValue

    proc draw
	var r : int := height div 9
	if dieValue = 1 then
	    Draw.FillOval (centreX, centreY, r, r, col)
	elsif dieValue = 2 then
	    Draw.FillOval (centreX - height div 3, centreY - height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY + height div 3, r,
		r, col)
	elsif dieValue = 3 then
	    Draw.FillOval (centreX, centreY, r, r, col)
	    Draw.FillOval (centreX - height div 3, centreY - height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY + height div 3, r,
		r, col)
	elsif dieValue = 4 then
	    Draw.FillOval (centreX - height div 3, centreY - height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY + height div 3, r,
		r, col)
	    Draw.FillOval (centreX - height div 3, centreY + height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY - height div 3, r,
		r, col)
	elsif dieValue = 5 then
	    Draw.FillOval (centreX, centreY, r, r, col)
	    Draw.FillOval (centreX - height div 3, centreY - height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY + height div 3, r,
		r, col)
	    Draw.FillOval (centreX - height div 3, centreY + height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY - height div 3, r,
		r, col)
	elsif dieValue = 6 then
	    Draw.FillOval (centreX - height div 3, centreY - height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY + height div 3, r,
		r, col)
	    Draw.FillOval (centreX - height div 3, centreY + height div 3, r,
		r, col)
	    Draw.FillOval (centreX + height div 3, centreY - height div 3, r,
		r, col)
	    Draw.FillOval (centreX - height div 3, centreY, r, r, col)
	    Draw.FillOval (centreX + height div 3, centreY, r, r, col)
	end if
	Draw.Box (centreX - height div 2, centreY - height div 2,
	    centreX + height div 2, centreY + height div 2, col)
    end draw
end Dice

