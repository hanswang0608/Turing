unit
class Shape
    export setCentre, getCentreX, getCentreY, getWidth, getHeight, getColour
    var centreX, centreY, width, height, col : int
    centreX := 320
    centreY := 200
    width := 40
    height := 50
    col := red
    
    /*
    proc erase
        %% Temporarily store the objectâ??s colour (remember: we have a getter method)
        var oldcol : int := getColour
        %% Change the colour to the background colour
        col := 0
        %% Draw the object in the background colour
        draw
        %% Reset the colour back to the objectâ??s original colour
        col := oldcol
    end erase
    */
    proc setCentre(x,y : int)
        centreX := x
        centreY := y
    end setCentre
    
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
end Shape

