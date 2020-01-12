unit
class Deck
    import Card in "Card.t"
    export getDeckSize, discardCard, drawCard, getCard, shuffleDeck
    var deck : flexible array 1 .. 0 of ^Card

    %%% Loop Through Suits %%%
    for j : 1 .. 4
	%%% Loop Through Values %%%
	for i : 1 .. 13
	    %%% Extend the Flexible Array %%%
	    new deck, (j - 1) * 13 + i
	    %%% Create a Card Object at Array Position (j-1)*13 + i %%%
	    new deck ((j - 1) * 13 + i)
	    %%% Set the Cards %%%
	    ^ (deck ((j - 1) * 13 + i)).setCard (j, intstr (i))
	end for
    end for

    fcn getDeckSize : int
	result upper (deck)
    end getDeckSize

    proc discardCard
	new deck, upper (deck) - 1
    end discardCard

    fcn drawCard : ^Card
	var tempCard : ^Card := deck (getDeckSize)
	discardCard
	result tempCard
    end drawCard

    fcn getCard (x : int) : ^Card
	result deck (x)
    end getCard

    proc shuffleDeck
	for i : 1 .. 5000
	    var tempFirstCard : int := Rand.Int (1, getDeckSize)
	    var tempSecondCard : int := Rand.Int (1, getDeckSize)
	    var firstCard : ^Card := deck (tempFirstCard)
	    deck (tempFirstCard) := deck (tempSecondCard)
	    deck (tempSecondCard) := firstCard
	end for
    end shuffleDeck
end Deck
