unit
class Diamond
    
    inherit Shape in "Shape.t"
    export draw
    proc draw
        Draw.Line (centreX - width div 2, centreY, centreX, centreY - height div 2, col)
        Draw.Line (centreX, centreY - height div 2, centreX + width div 2, centreY, col)
        Draw.Line (centreX + width div 2, centreY, centreX, centreY + height div 2, col)
        Draw.Line (centreX, centreY + height div 2, centreX - width div 2, centreY, col)
        Draw.Fill (centreX, centreY, col, col)
    end draw
end Diamond

