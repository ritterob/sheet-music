\version "2.18.2"

\header {
 	title = "If I Had the Wings of a Dove"
 	composer = "African-American Spiritual, Arr. R.R."
 	poet = "Stanzas 3 & 4 by Rob Ritter"
	%meter = ""
	copyright = \markup { "Arrangement Copyright" \char ##x00A9 "2004 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key g \major
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


soprano = \transpose g g {
	\relative c'' {
 		\global
		g \mark "Refrain" g g g b a8 a g4 b8(a16 g)
		a4 a8( g) a4 b8( d) e4 d8 d b( a) b( a16 g)
		g4 g8( e) g4 g b a8 a g4\fermata
		d8( e) g4. g8 b4\fermata d,8( e) g g4. g2^\markup {\italic "Fine"}
		\bar "|."
		b4 b b8( a) g4 a b a8( g) d8( e) g4. g8 b4 d,8( e) g g4. g2
		b4 b b8( a) g4 a b a8( g) d8( e) g4. g8 b4 d,8( e) g g4. g2
		\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
		\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
		\mark \markup {\italic "To Refrain"}
		\bar "||"
	}
}


alto = \transpose g g {
	\relative c' {
 		\global
		b4 c b b d c8 c b4 b8( d)
		fis4 fis fis e8( fis) g4 g8 g d4 c
		b4 c b b d d8( d) e4
		d8( c) b4. b8 d4 d4 c8 c4. b2		
	}
}


tenor = \transpose g g {
	\relative c, {
 		\global
		\clef bass
		d'4 e d d8( e) g4 e8 g g4 b
		d a8( b) d4 d8( b) c4 b8 b a4 d,8( e)
		g4 e d d8( e) g4 g8 fis e4
		g4 b8( d4) e8 d4 b8( a) g e4. d2		
	}
}


bass = \transpose g g {
	\relative c {
 		\global
		\clef bass
		g4 c b a b d8 d g,4 g8( b)
		d4 d d e8( d) g4 g8 g fis4 d4
		g, c b a b a8 a b4\fermata
		d g,4. a8 g4 g8( b) c a4. g2
	}
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	If I had the wings of a dove, o
	If I had the wings of a dove, o 
	If I had the wings of a dove
	I’d fly a -- way and be at rest.
	\set stanza = "1."
	Ma -- ry had a ho -- ly Son.
	(I’d fly a -- way and be at rest.)
	On the cross they had Him hung.
	(I’d fly a -- way and be at rest.)
}


verseTwo = \lyricmode {
	\repeat unfold 34{\skip 1}
	\set stanza = "2."
	Ju -- dah’s daugh -- ters wept and moaned
	(I’d fly a -- way and be at rest.)
	When their dying sav -- ior groaned.
	(I’d fly a -- way and be at rest.)
}


verseThree = \lyricmode {
	\repeat unfold 34{\skip 1}
	\set stanza = "3."
	Chil -- dren, let your voic -- es sing
	(I’d fly a -- way and be at rest.)
	Praise to God, the ris -- en King!
	(I’d fly a -- way and be at rest.)
}


verseFour = \lyricmode {
	\repeat unfold 34{\skip 1}
	\set stanza = "4."
	Soon I’ll tell this world good- bye.
	(I’ll fly a -- way and be at rest.)
	Wings I’ll spread and home I’ll fly! 
	(I’ll fly a -- way and be at rest.)
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
		\tempo 4 = 66
	}
}
