\version "2.18.2"

\header {
 	title = "Bringing in the Sheaves"
 	composer = "George A. Minor"
 	poet = "Knowles Shaw"
	%meter = ""
	copyright = "Public Domain"
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key c \major
 	\time 4/4
	\aikenHeads
  	\huge
	\set Timing.beamExceptions = #'()
	\set Timing.baseMoment = #(ly:make-moment 1/4)
	\set Timing.beatStructure = #'(1 1 1 1)
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global 
	g8 g g8. a16 g4 e c'8 c c8. d16 c4 a g8
	g g8. a16 g4 e e8 e d cis d2
	g8 g g8. a16 g4 e c'8 c c8. d16 c4 a g8
	g c d e4 c d8 c e8. d16 c2
	\bar "||"
	e,8 g g8. a16 g2 a8 c c8. a16 g2
	g8 g c d e4 c e8 e d8. c16 d2
	e,8 g g8. a16 g2 a8 c c8. a16 g2
	g8 g c d e4 c d8 c e8. d16 c2
	\bar "|."
}


alto = \relative c' {
	\global
	e8 e e8. f16 e4 c e8 e e8. e16 f4 f
	e8 e e8. f16 e4 c c8 c b ais b2
	c8 e e8. f16 e4 c e8 e e8. e16 f4 f
	e8 e e f g4 g f8 e g8. f16 e2
	c8 e e8. f16 e2 f8 a a8. f16 e2
	e8 e e f g4 e g8 g g8. fis16 g2
	c,8 e e8. f16 e2 f8 a a8. f16 e2
	e8 e e f g4 g f8 e g8. f16 e2
}


tenor = \relative c' {
	\global
	\clef "bass"
	c8 c c8. c16 c4 g g8 g g8. g16 a4 c
	c8 c c8. c16 c4 g g8 g g g g2
	g8 c c8. c16 c4 g g8 g g8. g16 a4 c
	c8 c g g c4 c b8 c c8. g16 g2
	g8 c c8. c16 c2 c8 c c8. c16 c2
	c8 c g g c4 g c8 c d8. d16 b2
	g8 c c8. c16 c2 c8 c c8. c16 c2
	c8 c g g c4 c b8 c c8. g16 g2
}


bass = \relative c {
	\global
	\clef "bass"
	c8 c c8. c16 c4 c c8 c c8. c16 f4 f
	c8 c c8. c16 c4 c g8 g g g g2
	c8 c c8. c16 c4 c c8 c c8. c16 f4 f
	c8 c c c c4 e g8 g g8. g16 c,2
	c8 c c8. c16 c2 f8 f f8. f16 c2
	c8 c c c c4 c c8 c' b8. a16 g2
	c,8 c c8. c16 c2 f8 f f8. f16 c2
	c8 c c c c4 e g8 g g8. g16 c,2
}


% Some useful characters: — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	Sow -- ing in the morin -- ing, sow -- ing seeds of kind -- ness,
	Sow -- ing in the noon -- tide and the dew -- y eves;
	Wait -- ing for the har -- vest and the time of reap -- ing,
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Sow -- ing in the sun -- shine, sow -- ing in the shad -- ows,
	Fear -- ing nei -- ther clouds nor win -- ter’s chill -- ing breeze;
	By and by the har -- vest, and the la -- bor end -- ed,
	We shall come re -- joic -- ing, bring -- ing in the sheaves.
	Bring -- ing in the sheaves, bring -- ing in the sheaves,
	We shall come re -- joic -- ing, bring -- ing in the sheaves;
	Bring -- ing in the sheaves, bring -- ing in the sheaves,
	We shall come re -- joic -- ing, bring -- ing in the sheaves.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Go then e -- ven weep -- ing, sow -- ing for the Mas -- ter,
	Tho’ the loss sus -- tained our spir -- it oft -- en grieves;
	When our weep -- ing’s o -- ver, He will bid us wel -- come,
}


verseFour = \lyricmode {
	\set stanza = "4."
}


\score{
	\new ChoirStaff <<
		\new Staff \with {midiInstrument = #"acoustic grand"} <<
			\new Voice = "soprano" {\voiceOne \soprano}
			\new Voice = "alto" {\voiceTwo \alto}
		>>
		
		\new Lyrics {
			\lyricsto "soprano" \verseOne
		}
		\new Lyrics {
			\lyricsto "soprano" \verseTwo
		}
		\new Lyrics {
			\lyricsto "soprano" \verseThree
		}
		\new Lyrics {
			\lyricsto "soprano" \verseFour
		}
		
		\new Staff  \with {midiInstrument = #"acoustic grand"}<<
			\new Voice = "tenor" {\voiceThree \tenor}
			\new Voice = "bass" {\voiceFour \bass}
		>>
		
	>>
	
	\layout{}
	\midi{
		\tempo 4 = 76
	}
}
