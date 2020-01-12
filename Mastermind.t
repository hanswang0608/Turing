setscreen ("graphics:200,560,nocursor")

%%%%% GLOBAL VARIABLES %%%%%
var col : int := 0
var layer : int := 1
var win : boolean

var grid : array 1 .. 10 of array 1 .. 4 of int
for i : 1 .. 10
    for n : 1 .. 4
	grid (i) (n) := 0
    end for
end for

var unknownCol : array 1 .. 4 of int
unknownCol (1) := Rand.Int (1, 8)
for i : 2 .. 4
    unknownCol (i) := Rand.Int (1, 8)
    var unique : boolean := true
    loop
	for n : 1 .. i - 1
	    if unknownCol (i) = unknownCol (n) then
		unique := false
	    end if
	end for
	exit when unique = true
	if unique = false then
	    unknownCol (i) := Rand.Int (1, 8)
	    unique := true
	end if
    end loop
end for

for i : 1 .. 4
    if unknownCol (i) = 1 then
	unknownCol (i) := 7
    elsif unknownCol (i) = 2 then
	unknownCol (i) := 15
    elsif unknownCol (i) = 3 then
	unknownCol (i) := 13
    elsif unknownCol (i) = 4 then
	unknownCol (i) := 5
    elsif unknownCol (i) = 5 then
	unknownCol (i) := 12
    elsif unknownCol (i) = 6 then
	unknownCol (i) := 9
    elsif unknownCol (i) = 7 then
	unknownCol (i) := 2
    elsif unknownCol (i) = 8 then
	unknownCol (i) := 14
    end if
end for

var resultarr : array 1 .. 10 of array 1 .. 4 of int
for i : 1 .. 10
    for n : 1 .. 4
	resultarr (i) (n) := 0
    end for
end for



%%%%% HEADS UP DISPLAY (HUD) %%%%%

% Starting Screen %
Draw.FillBox (0, 0, 200, 560, 30)
Text.ColourBack (30)
locatexy (60, 500)
for i : 1 .. 10
    Text.Colour (i)
    put "Mastermind" (i) ..
end for
Text.Colour (black)
locatexy (0, 460)
put "How to play"
locatexy (0, 440)
put "1. You have 8 colours."
locatexy (0, 420)
put "2. Guess the 4 colours."
locatexy (0, 400)
put "3. When you are done,"
locatexy (0, 390)
put "   click red button."
locatexy (0, 370)
put "4. You will get a hint"
locatexy (0, 360)
put "   on what you got right."
locatexy (0, 340)
put "5. " ..
Text.Colour (12)
Text.ColourBack (30)
put "Red" ..
Text.Colour (black)
Text.ColourBack (30)
put " means right colour" ..
locatexy (0, 330)
put "   AND right position."
locatexy (0, 310)
put "6. " ..
Text.Colour (9)
Text.ColourBack (30)
put "Blue" ..
Text.Colour (black)
Text.ColourBack (30)
put " means right " ..
locatexy (0, 300)
put "   colour." ..
locatexy (20, 200)
Text.Colour (12)
put "Press any key to play"
Text.Colour (black)

var waiting : string (1)
getch (waiting)


% General HUD %
Draw.FillBox (0, 0, 200, 100, 113)  %Red Box
Draw.FillBox (20, 15, 180, 85, 10)  %Green Box
Draw.FillBox (0, 100, 200, 560, 30) %Grey Background
Draw.FillBox (75, 90, 125, 110, 24) %Check Button Border
Draw.FillBox (77, 92, 123, 108, 12) %Check Button Red
Draw.FillBox (0, 120, 200, 160, 20) %Dark Grey Bar

%  Border %
Draw.ThickLine (0, 0, 200, 0, 10, 1)
Draw.ThickLine (200, 0, 200, 560, 10, 1)
Draw.ThickLine (200, 560, 0, 560, 10, 1)
Draw.ThickLine (0, 560, 0, 0, 10, 1)

% Colour Palette %
Draw.FillOval (40, 30, 10, 10, 7)   %black
Draw.FillOval (80, 30, 10, 10, 15)  %grey
Draw.FillOval (120, 30, 10, 10, 13) %pink
Draw.FillOval (160, 30, 10, 10, 5)  %purple
Draw.FillOval (40, 70, 10, 10, 12)  %red
Draw.FillOval (80, 70, 10, 10, 9)   %blue
Draw.FillOval (120, 70, 10, 10, 2)  %green
Draw.FillOval (160, 70, 10, 10, 14) %yellow

% Main Game %

for i : 1 .. 10
    Draw.FillOval (20, 100 + 40 * i, 10, 10, 0)
    Draw.FillOval (60, 100 + 40 * i, 10, 10, 0)
    Draw.FillOval (100, 100 + 40 * i, 10, 10, 0)
    Draw.FillOval (140, 100 + 40 * i, 10, 10, 0)
    Draw.FillOval (170, 95 + 40 * i, 4, 4, 0)
    Draw.FillOval (180, 95 + 40 * i, 4, 4, 0)
    Draw.FillOval (170, 105 + 40 * i, 4, 4, 0)
    Draw.FillOval (180, 105 + 40 * i, 4, 4, 0)
end for

Draw.FillOval (20, 540, 10, 10, unknownCol (1))
Draw.FillOval (60, 540, 10, 10, unknownCol (2))
Draw.FillOval (100, 540, 10, 10, unknownCol (3))
Draw.FillOval (140, 540, 10, 10, unknownCol (4))
Draw.FillBox (0,560, 200, 520, 7)


%%%%% PROCEDURES AND FUNCTIONS %%%%%

procedure drawHUD (layer : int)
    Draw.FillBox (0, 100, 200, 560, 30)
    Draw.FillBox (75, 90, 125, 110, 24)
    Draw.FillBox (77, 92, 123, 108, 12)
    Draw.FillBox (0, 120 + 40 * layer, 200, 160 + 40 * layer, 20)
    Draw.ThickLine (0, 0, 200, 0, 10, 1)
    Draw.ThickLine (200, 0, 200, 560, 10, 1)
    Draw.ThickLine (200, 560, 0, 560, 10, 1)
    Draw.ThickLine (0, 560, 0, 0, 10, 1)

    for i : 1 .. 10
	Draw.FillOval (20, 100 + 40 * i, 10, 10, grid (i) (1))
	Draw.FillOval (60, 100 + 40 * i, 10, 10, grid (i) (2))
	Draw.FillOval (100, 100 + 40 * i, 10, 10, grid (i) (3))
	Draw.FillOval (140, 100 + 40 * i, 10, 10, grid (i) (4))
	Draw.FillOval (170, 95 + 40 * i, 4, 4, resultarr (i) (3))
	Draw.FillOval (180, 95 + 40 * i, 4, 4, resultarr (i) (4))
	Draw.FillOval (170, 105 + 40 * i, 4, 4, resultarr (i) (1))
	Draw.FillOval (180, 105 + 40 * i, 4, 4, resultarr (i) (2))
    end for

    Draw.FillOval (20, 540, 10, 10, unknownCol (1))
    Draw.FillOval (60, 540, 10, 10, unknownCol (2))
    Draw.FillOval (100, 540, 10, 10, unknownCol (3))
    Draw.FillOval (140, 540, 10, 10, unknownCol (4))
    Draw.FillBox (0,560, 200, 520, 7)
end drawHUD

procedure cursor (x, y, col : int)
    loop
	Draw.FillOval (x, y, 10, 10, col)
    end loop
end cursor

function correct (arr1, arr2 : array 1 .. * of int) : int
    var count : int := 0
    for i : 1 .. 4
	if arr2 (i) = arr1 (i) then
	    count += 1
	end if
    end for
    result count
end correct

function rightCol (arr1, arr2 : array 1 .. * of int) : int
    var count : int := 0
    for i : 1 .. 4
	for n : 1 .. 4
	    if arr2 (n) = arr1 (i) then
		count += 1
		exit
	    end if
	end for
    end for
    result count
end rightCol



%%%%% MAIN CODE %%%%%

loop
    var x, y, butNum, butUp : int
    Mouse.ButtonWait ("down", x, y, butNum, butUp)

    %Selecting colours
    if x > 20 & x < 60 & y > 10 & y < 50 then
	col := 7    %black
    elsif x > 60 & x < 100 & y > 10 & y < 50 then
	col := 15   %grey
    elsif x > 100 & x < 140 & y > 10 & y < 50 then
	col := 13   %pink
    elsif x > 140 & x < 180 & y > 10 & y < 50 then
	col := 5    %purple
    elsif x > 20 & x < 60 & y > 50 & y < 90 then
	col := 12   %red
    elsif x > 60 & x < 100 & y > 50 & y < 90 then
	col := 9    %blue
    elsif x > 100 & x < 140 & y > 50 & y < 90 then
	col := 2    %green
    elsif x > 140 & x < 180 & y > 50 & y < 90 then
	col := 14   %yellow
    end if


    if x > 0 & x < 40 & y > 80 + 40 * layer & y < 120 + 40 * layer & col ~= 0 then
	Draw.FillOval (20, 100 + 40 * layer, 10, 10, col)
	grid (layer) (1) := col
    elsif x > 40 & x < 80 & y > 80 + 40 * layer & y < 120 + 40 * layer & col ~= 0 then
	Draw.FillOval (60, 100 + 40 * layer, 10, 10, col)
	grid (layer) (2) := col
    elsif x > 80 & x < 120 & y > 80 + 40 * layer & y < 120 + 40 * layer & col ~= 0 then
	Draw.FillOval (100, 100 + 40 * layer, 10, 10, col)
	grid (layer) (3) := col
    elsif x > 120 & x < 160 & y > 80 + 40 * layer & y < 120 + 40 * layer & col ~= 0 then
	Draw.FillOval (140, 100 + 40 * layer, 10, 10, col)
	grid (layer) (4) := col
    end if

    if x > 75 & x < 125 & y > 90 & y < 110 & grid (layer) (1)
	    ~= 0 & grid (layer) (2) ~= 0 & grid (layer) (3) ~= 0 & grid (layer) (4) ~= 0 then

	for i : 1 .. correct (unknownCol, grid (layer))
	    resultarr (layer) (i) := 12
	end for

	for i : 1 .. rightCol (unknownCol, grid (layer))
	    if resultarr (layer) (i) = 0 then
		resultarr (layer) (i) := 9
	    end if
	end for

	if resultarr (layer) (1) = 12 & resultarr (layer) (2) = 12 & resultarr (layer) (3) = 12 & resultarr (layer) (4) = 12 then
	    win := true
	    exit
	end if

	drawHUD (layer)
	layer += 1

	if layer >= 11 then
	    win := false
	    exit
	end if
    end if

end loop

Draw.FillBox (0, 0, 200, 560, 0)
Draw.FillBox (0, 270, 200, 271, 12)
Draw.FillBox (0, 289, 200, 290, 12)
locatexy (75, 280)
Text.ColourBack (0)

if win = true then
    put "YOU WIN!"
else
    put "YOU LOST"
end if
