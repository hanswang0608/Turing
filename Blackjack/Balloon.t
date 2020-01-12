unit
class Balloon
    inherit Thing in "Thing.t"
    body proc draw
	Draw.FillOval (centreX, centreY, width div 2, height div 2, col)
	Draw.Arc (centreX, centreY - height, width div 2, height div 2 , 90, 270, col)
	Draw.Arc (centreX, centreY - height * 2, width div 2, height div 2, 270, 90, col)
    end draw
end Balloon
