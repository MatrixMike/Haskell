-- http://www.lounge.se/wiki2/show/HaskellChess
main = display (InWindow "Hello World" (400, 150) (10, 10)) white picture

picture	= Translate (-170) (-20)   -- shift the text to the middle of the window
		  $ Scale 0.5 0.5		   -- display it half the original size
		  $ Text "Hello World"	   -- text to display
