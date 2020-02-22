\version "2.18.2"

\header {
 	title = "If I Had the Wings of a Dove"
 	composer = "African-American Spiritual, Arr. R.R."
 	poet = "Traditional"
	meter = "Stanzas 3 & 4 by Rob Ritter"
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
 	\key c \major
 	\time 4/4
	\aikenHeads
  	\huge
	\set Timing.beamExceptions = #'()
	\set Timing.baseMoment = #(ly:make-moment 1/4)
	\set Timing.beatStructure = #'(1 1 1 1)
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	c
}


alto = \relative c' {
	\global
}


tenor = \relative c' {
	\global
	\clef "bass"
}


bass = \relative c {
	\global
	\clef "bass"
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
	\repeat unfold 28{\skip 1}
	\set stanza = "2."
	Ju -- dah’s daugh -- ters wept and moaned
	(I’d fly a -- way and be at rest.)
	When their dying sav -- ior groaned.
	(I’d fly a -- way and be at rest.)
}


verseThree = \lyricmode {
	\repeat unfold 28{\skip 1}
	\set stanza = "3."
	Chil -- dren, let your voic -- es sing
	(I’d fly a -- way and be at rest.)
	Praise to God, the ris -- en King!
	(I’d fly a -- way and be at rest.)
}


verseFour = \lyricmode {
	\repeat unfold 28{\skip 1}
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
		\tempo 4 = 88
	}
}
