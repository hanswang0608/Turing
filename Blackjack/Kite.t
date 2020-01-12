unit
class Kite
    inherit Thing in "Thing.t"
    body proc draw
	Draw.Line (centreX - width div 2, centreY, centreX, centreY - height div 2, col)
	Draw.Line (centreX, centreY - height div 2, centreX + width div 2, centreY, col)
	Draw.Line (centreX + width div 2, centreY, centreX, centreY + height div 2, col)
	Draw.Line (centreX, centreY + height div 2, centreX - width div 2, centreY, col)
	Draw.Fill (centreX, centreY, col, col)
	Draw.Arc (centreX, centreY - height, width div 2, height div 2, 90, 270, col)
	Draw.Arc (centreX, centreY - height * 2, width div 2, height div 2, 270, 90, col)
    end draw
end Kite
