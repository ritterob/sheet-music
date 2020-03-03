\version "2.18.2"

\header {
 	title = "Rise Up, O Men of God"
 	composer = "William H. Walter"
 	poet = "William Pierson Merrill"
	%meter = ""
	%copyright = \markup { "Copyright" \char ##x00A9 "1988 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key bes \major
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
	f,4 bes f d f g2.
	f4 g8( a) bes4 a g f2.
	c'4 d c8( d) ees4 d c bes a
	f g8( a) bes4 bes a bes2. \bar "|."
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
	\set stanza = "1."
	Rise up, O men of God!
	Have done with less -- er things;
	Give heart and soul and mind and strength
	To serve the King of kings.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Rise up, O men of God!
	His king -- dom tar -- ries long;
	Bring in the day of broth -- er -- hood
	And end the night of wrong.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Rise up, O men of God!
	The church for you doth wait;
	Her strength un -- e -- qual to her task,
	Rise up and make her great!
}


verseFour = \lyricmode {
	\set stanza = "4."
	Lift high the cross of Christ!
	Tread where his feet have trod;
	As broth -- ers of the Son of Man,
	Rise up, O men of God.
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
		\tempo 2 = 52
	}
}
