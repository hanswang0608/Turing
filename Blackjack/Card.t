unit
class Card
    %%%%% CLASS FILE IMPORT & EXPORT%%%%%
    import Spade in "Spade.t", Heart in "Heart.t",
	Club in "Club.t", Diamond in "Diamond.t"
    export getSuit, getValue, getFace, setCard, setCentre, setFace, draw, erase

    %%%%% GLOBAL VARIABLES & OBJECTS %%%%%
    var Spade2 : ^Spade
    var Heart2 : ^Heart
    var Club2 : ^Club
    var Diamond2 : ^Diamond
    new Spade2
    new Heart2
    new Club2
    new Diamond2

    var cardX : int := 320
    var cardY : int := 200
    var cardHeight : int := 200
    var font := Font.New ("serif:12")
    %%% Legend:
    %%% cardSuit: 1 = Spade, 2 = Heart, 3 = Club, 4 = Diamond
    %%% cardValue: 1 = "A", 2 = "2", ..., 10 = "10", 11 = "J", 12 = "Q", 13 = "K"
    %%% We will pre-set the card to be Ace of Spade
    var cardSuit : int := 1
    var cardValue : string := "1"
    var cardFace : boolean := false

    proc setCard (suit : int, num : string)
	cardSuit := suit
	if num = "1" then
	    cardValue := "A"
	elsif num = "11" then
	    cardValue := "J"
	elsif num = "12" then
	    cardValue := "Q"
	elsif num = "13" then
	    cardValue := "K"
	else
	    cardValue := num
	end if
    end setCard

    proc setCentre (x, y : int)
	cardX := x
	cardY := y
	^Spade2.setCentre (cardX, cardY)
	^Heart2.setCentre (cardX, cardY)
	^Club2.setCentre (cardX, cardY)
	^Diamond2.setCentre (cardX, cardY)
    end setCentre

    proc setFace (face : boolean)
	cardFace := face
    end setFace

    function getSuit : int
	result cardSuit
    end getSuit

    function getValue : string
	result cardValue
    end getValue

    function getFace : boolean
	result cardFace
    end getFace

    proc draw
	if cardFace = true then
	    Draw.FillBox (cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2),
		cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2),
		white)
	    Draw.Box (cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2),
		cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2),
		black)

	    if cardSuit = 1 then
		^Spade2.draw
		Draw.Text (cardValue, cardX - (cardHeight * 0.7 div 2 - 5),
		    cardY + (cardHeight div 2 - 15), font, black)
	    elsif cardSuit = 2 then
		^Heart2.draw
		Draw.Text (cardValue, cardX - (cardHeight * 0.7 div 2 - 5),
		    cardY + (cardHeight div 2 - 15), font, red)
	    elsif cardSuit = 3 then
		^Club2.draw
		Draw.Text (cardValue, cardX - (cardHeight * 0.7 div 2 - 5),
		    cardY + (cardHeight div 2 - 15), font, black)
	    elsif cardSuit = 4 then
		^Diamond2.draw
		Draw.Text (cardValue, cardX - (cardHeight * 0.7 div 2 - 5),
		    cardY + (cardHeight div 2 - 15), font, red)
	    end if
	else
	    %%% Card back
	    Draw.FillBox (cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2),
		cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2),
		blue)
	end if
    end draw

    proc erase
	Draw.FillBox (cardX - (cardHeight * 0.7 div 2), cardY - (cardHeight div 2),
	    cardX + (cardHeight * 0.7 div 2), cardY + (cardHeight div 2),
	    white)
    end erase
end Card
