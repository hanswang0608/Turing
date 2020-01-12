var key : array char of boolean
var mousex, mousey, mouseclick : int
var title : int := Pic.FileNew ("title.jpg")
var background : int := Pic.FileNew ("background.jpg")
var credits_title : int := Pic.FileNew ("credits_title.jpg")
var font : int := Font.New ("Palatino:15")
var font2 : int := Font.New ("Palatino:15:bold")
var x : int := 120
var y : int := 275
var size : int := 3
var bird_border : int := 19
var bird_yellow : int := 43
var bird_lightyellow : int := 68
var bird_white : int := 0
var bird_orange : int := 42
var grassX : array 1 .. 4 of int := init (0, 10, 24, 14)
var grassY : array 1 .. 4 of int := init (82, 93, 93, 82)
var hoverUp : boolean := true
var readyPlayer : boolean := false
var maxHeight : int := 300
var minHeight : int := 275

setscreen ("graphics: 450, 550, offscreenonly, nobuttonbar")
proc startButton
    Draw.FillBox (80, 142, 189, 181, 16)
    Draw.FillBox (83, 145, 186, 178, 0)
    Draw.FillBox (86, 148, 183, 175, 42)
    Font.Draw ("START", 103, 155, font, white)
end startButton
proc helpButton
    Draw.FillBox (256, 142, 365, 181, 16)
    Draw.FillBox (259, 145, 362, 178, 0)
    Draw.FillBox (262, 148, 359, 175, 42)
    Font.Draw ("HELP", 284, 155, font, white)
end helpButton
proc drawTitle
    Pic.Draw (title, 20, y + 70, picCopy)
end drawTitle
proc Background
    Pic.Draw (background, 0, 0, picCopy)
end Background
proc Ground
    Draw.FillBox (0, 0, maxx, 100, 67)
    Draw.FillBox (0, 75, maxx, 78, 66)
    Draw.FillBox (0, 78, maxx, 81, 119)
    Draw.FillBox (0, 95, maxx, 98, 68)
    Draw.FillBox (0, 97, maxx, 101, 16)
    Draw.FillBox (0, 81, maxx, 94, 46)
    for a : 1 .. 50
	Draw.FillPolygon (grassX, grassY, 4, 49)
	for b : 1 .. 4
	    grassX (b) += 25
	end for
    end for
    Draw.FillPolygon (grassX, grassY, 4, 49)
    for b : 1 .. 4
	grassX (b) -= 1250
    end for
    for b : 1 .. 4
	grassX (b) += -3
    end for
    if grassX (1) <= -450 then
	grassX (1) := 0
	grassX (2) := 10
	grassX (3) := 24
	grassX (4) := 14
    end if
end Ground
proc drawBird
    %body
    drawfillbox (x + size * 5, y + size, x + size * 10, y + size * 2, bird_yellow)
    drawfillbox (x + size * 3, y + size * 2, x + size * 9, y + size * 3, bird_yellow)
    drawfillbox (x + size * 5, y + size * 3, x + size * 8, y + size * 4, bird_yellow)
    drawfillbox (x + size * 6, y + size * 7, x + size * 7, y + size * 10, bird_lightyellow)
    drawfillbox (x + size * 7, y + size * 4, x + size * 8, y + size * 10, bird_lightyellow)
    drawfillbox (x + size * 8, y + size * 4, x + size * 9, y + size * 7, bird_lightyellow)
    drawfillbox (x + size * 6, y + size * 4, x + size * 8, y + size * 5, bird_lightyellow)
    drawfillbox (x + size * 9, y + size * 5, x + size * 10, y + size * 6, bird_lightyellow)
    drawfillbox (x + size * 5, y + size * 8, x + size * 6, y + size * 9, bird_lightyellow)
    drawfillbox (x + size * 6, y + size * 10, x + size * 9, y + size * 11, bird_white)
    drawfillbox (x + size * 4, y + size * 9, x + size * 5, y + size * 10, bird_white)
    drawfillbox (x + size * 5, y + size * 9, x + size * 6, y + size * 10, bird_white)
    %wing
    drawfillbox (x + size * 1, y + size * 5, x + size * 2, y + size * 6, bird_lightyellow)
    drawfillbox (x + size * 2, y + size * 4, x + size * 5, y + size * 5, bird_lightyellow)
    drawfillbox (x + size * 5, y + size * 5, x + size * 6, y + size * 6, bird_lightyellow)
    drawfillbox (x + size * 2, y + size * 5, x + size * 5, y + size * 6, bird_white)
    drawfillbox (x + size, y + size * 6, x + size * 7, y + size * 7, bird_white)
    drawfillbox (x + size, y + size * 7, x + size * 6, y + size * 8, bird_white)
    %lips
    drawfillbox (x + size * 16, y + size * 4, x + size * 10, y + size * 5, bird_orange)
    drawfillbox (x + size * 15, y + size * 2, x + size * 10, y + size * 3, bird_orange)
    drawfillbox (x + size * 9, y + size * 3, x + size * 10, y + size * 4, bird_orange)
    %eye white
    drawfillbox (x + size * 10, y + size * 7, x + size * 11, y + size * 11, bird_white)
    drawfillbox (x + size * 11, y + size * 6, x + size * 12, y + size * 11, bird_white)
    drawfillbox (x + size * 13, y + size * 6, x + size * 14, y + size * 9, bird_white)
    drawfillbox (x + size * 12, y + size * 6, x + size * 13, y + size * 7, bird_white)
    drawfillbox (x + size * 12, y + size * 9, x + size * 13, y + size * 10, bird_white)
    drawfillbox (x + size * 9, y + size * 9, x + size * 10, y + size * 10, bird_white)
    drawfillbox (x + size * 9, y + size * 8, x + size * 10, y + size * 9, bird_white)
    drawfillbox (x + size * 9, y + size * 7, x + size * 10, y + size * 8, bird_white)
    drawfillbox (x + size * 10, y + size * 6, x + size * 11, y + size * 7, bird_white)
    %border
    drawfillbox (x, y + size * 5, x + size, y + size * 8, bird_border)
    drawfillbox (x + size, y + size * 4, x + size * 2, y + size * 5, bird_border)
    drawfillbox (x + size * 2, y + size * 3, x + size * 3, y + size * 4, bird_border)
    drawfillbox (x + size * 2, y + size * 2, x + size * 3, y + size * 3, bird_border)
    drawfillbox (x + size * 3, y + size * 1, x + size * 4, y + size * 2, bird_border)
    drawfillbox (x + size * 4, y + size * 1, x + size * 5, y + size * 2, bird_border)
    drawfillbox (x + size * 5, y, x + size * 10, y + size, bird_border)
    drawfillbox (x + size * 10, y + size, x + size * 15, y + size * 2, bird_border)
    drawfillbox (x + size * 15, y + size * 2, x + size * 16, y + size * 3, bird_border)
    drawfillbox (x + size * 16, y + size * 3, x + size * 10, y + size * 4, bird_border)
    drawfillbox (x + size * 9, y + size * 2, x + size * 10, y + size * 3, bird_border)
    drawfillbox (x + size * 8, y + size * 3, x + size * 9, y + size * 4, bird_border)
    drawfillbox (x + size * 9, y + size * 4, x + size * 10, y + size * 5, bird_border)
    drawfillbox (x + size * 16, y + size * 5, x + size * 10, y + size * 6, bird_border)
    drawfillbox (x + size * 16, y + size * 4, x + size * 17, y + size * 5, bird_border)
    drawfillbox (x + size * 14, y + size * 6, x + size * 15, y + size * 9, bird_border)
    drawfillbox (x + size * 13, y + size * 9, x + size * 14, y + size * 10, bird_border)
    drawfillbox (x + size * 12, y + size * 8, x + size * 13, y + size * 9, bird_border)
    drawfillbox (x + size * 12, y + size * 7, x + size * 13, y + size * 8, bird_border)
    drawfillbox (x + size * 12, y + size * 10, x + size * 13, y + size * 11, bird_border)
    drawfillbox (x + size * 12, y + size * 11, x + size * 6, y + size * 12, bird_border)
    drawfillbox (x + size * 9, y + size * 10, x + size * 10, y + size * 11, bird_border)
    drawfillbox (x + size * 8, y + size * 10, x + size * 9, y + size * 7, bird_border)
    drawfillbox (x + size * 9, y + size * 6, x + size * 10, y + size * 7, bird_border)
    drawfillbox (x + size * 5, y + size * 10, x + size * 6, y + size * 11, bird_border)
    drawfillbox (x + size * 4, y + size * 10, x + size * 5, y + size * 11, bird_border)
    drawfillbox (x + size * 3, y + size * 9, x + size * 4, y + size * 10, bird_border)
    drawfillbox (x + size, y + size * 8, x + size * 5, y + size * 9, bird_border)
    drawfillbox (x + size * 5, y + size * 7, x + size * 6, y + size * 8, bird_border)
    drawfillbox (x + size * 6, y + size * 6, x + size * 7, y + size * 7, bird_border)
    drawfillbox (x + size * 6, y + size * 5, x + size * 7, y + size * 6, bird_border)
    drawfillbox (x + size * 5, y + size * 4, x + size * 6, y + size * 5, bird_border)
    drawfillbox (x + size * 4, y + size * 3, x + size * 5, y + size * 4, bird_border)
    drawfillbox (x + size * 3, y + size * 3, x + size * 4, y + size * 4, bird_border)         %border
    drawfillbox (x, y + size * 5, x + size, y + size * 8, bird_border)
    drawfillbox (x + size, y + size * 4, x + size * 2, y + size * 5, bird_border)
    drawfillbox (x + size * 2, y + size * 3, x + size * 3, y + size * 4, bird_border)
    drawfillbox (x + size * 2, y + size * 2, x + size * 3, y + size * 3, bird_border)
    drawfillbox (x + size * 3, y + size * 1, x + size * 4, y + size * 2, bird_border)
    drawfillbox (x + size * 4, y + size * 1, x + size * 5, y + size * 2, bird_border)
    drawfillbox (x + size * 5, y, x + size * 10, y + size, bird_border)
    drawfillbox (x + size * 10, y + size, x + size * 15, y + size * 2, bird_border)
    drawfillbox (x + size * 15, y + size * 2, x + size * 16, y + size * 3, bird_border)
    drawfillbox (x + size * 16, y + size * 3, x + size * 10, y + size * 4, bird_border)
    drawfillbox (x + size * 9, y + size * 2, x + size * 10, y + size * 3, bird_border)
    drawfillbox (x + size * 8, y + size * 3, x + size * 9, y + size * 4, bird_border)
    drawfillbox (x + size * 9, y + size * 4, x + size * 10, y + size * 5, bird_border)
    drawfillbox (x + size * 16, y + size * 5, x + size * 10, y + size * 6, bird_border)
    drawfillbox (x + size * 16, y + size * 4, x + size * 17, y + size * 5, bird_border)
    drawfillbox (x + size * 14, y + size * 6, x + size * 15, y + size * 9, bird_border)
    drawfillbox (x + size * 13, y + size * 9, x + size * 14, y + size * 10, bird_border)
    drawfillbox (x + size * 12, y + size * 8, x + size * 13, y + size * 9, bird_border)
    drawfillbox (x + size * 12, y + size * 7, x + size * 13, y + size * 8, bird_border)
    drawfillbox (x + size * 12, y + size * 10, x + size * 13, y + size * 11, bird_border)
    drawfillbox (x + size * 12, y + size * 11, x + size * 6, y + size * 12, bird_border)
    drawfillbox (x + size * 9, y + size * 10, x + size * 10, y + size * 11, bird_border)
    drawfillbox (x + size * 8, y + size * 10, x + size * 9, y + size * 7, bird_border)
    drawfillbox (x + size * 9, y + size * 6, x + size * 10, y + size * 7, bird_border)
    drawfillbox (x + size * 5, y + size * 10, x + size * 6, y + size * 11, bird_border)
    drawfillbox (x + size * 4, y + size * 10, x + size * 5, y + size * 11, bird_border)
    drawfillbox (x + size * 3, y + size * 9, x + size * 4, y + size * 10, bird_border)
    drawfillbox (x + size, y + size * 8, x + size * 5, y + size * 9, bird_border)
    drawfillbox (x + size * 5, y + size * 7, x + size * 6, y + size * 8, bird_border)
    drawfillbox (x + size * 6, y + size * 6, x + size * 7, y + size * 7, bird_border)
    drawfillbox (x + size * 6, y + size * 5, x + size * 7, y + size * 6, bird_border)
    drawfillbox (x + size * 5, y + size * 4, x + size * 6, y + size * 5, bird_border)
    drawfillbox (x + size * 4, y + size * 3, x + size * 5, y + size * 4, bird_border)
    drawfillbox (x + size * 3, y + size * 3, x + size * 4, y + size * 4, bird_border)
end drawBird

proc BirdHover (a : int)
    if readyPlayer = false and hoverUp = true then
	y := y + 1
	if y = maxHeight then
	    hoverUp := false
	end if
    elsif readyPlayer = false and hoverUp = false then
	y := y - 1
	if y = minHeight then
	    hoverUp := true
	end if
    end if
    drawBird
end BirdHover
proc gameStart
end gameStart
proc helpMenu
    Draw.FillBox (40, 225, 410, 375, 19)
    Draw.FillBox (45, 230, 405, 370, 67)
    Font.Draw ("ARE YOU KIDDING?", 130, 305, font2, 42)
    Font.Draw ("WHAT A SIMPLE GAME IT IS :)", 75, 280, font2, 42)
end helpMenu
proc mainMenu
    for a : 0 .. maxint
	cls
	Background
	drawTitle
	Ground
	startButton
	helpButton
	BirdHover (a)
	mousewhere (mousex, mousey, mouseclick)
	if mouseclick = 1 then
	    if mousex > 83 and mousex < 186 and mousey > 145 and mousey < 178 then
		gameStart
	    elsif mousex > 259 and mousex < 362 and mousey > 145 and mousey < 178 then
		helpMenu
	    end if
	end if
	delay (15)
	View.Update
    end for
end mainMenu


procedure begining
    Draw.FillBox (0, 0, 450, 550, black)
    Pic.Draw (credits_title, 20, 275, picCopy)
    delay (1000)
    mainMenu
    colorback (54)
end begining
begining
