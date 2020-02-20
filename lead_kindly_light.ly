\version "2.18.2"

\header {
 	title = "Lead, Kindly Light"
 	composer = "John Bacchus Dykes"
 	poet = "John Henry Newman"
	%meter = ""
	%copyright= \markup { "Copyright" \char ##x00A9 "2004 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key aes \major
 	\time 3/4
	\aikenHeads
  	\huge
	\set Timing.beamExceptions = #'()
	\set Timing.baseMoment = #(ly:make-moment 1/4)
	\set Timing.beatStructure = #'(1 1 1)
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	\partial 4.
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	ees,8 aes bes c8. c16 bes8 aes f aes f4( ees2)
	aes4 g aes bes4.
	ees,8 aes bes c8. c16 bes8 aes f aes f4( ees2)
	ees4 aes4.g8 g4( aes2)
	bes4 bes bes bes2 bes4 bes8 c bes( aes) g( f) ees2.
	c'4 bes aes aes4. aes8 g f ees4( aes4.) g8 g4( aes)\fermata
	\bar "|." 
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


% Some useful characters: — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	Lead, kind -- ly Light, a -- mid th’en -- cir -- cling gloom,
	Lead Thou me on;
	The night is dark, and I am far from home;
	Lead Thou me on.
	Keep Thou my feet; I do not ask to see
	The dis -- tant scene— one step e -- nough for me.
}


verseTwo = \lyricmode {
	\set stanza = "2."
}


verseThree = \lyricmode {
	\set stanza = "3."
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
		\tempo 4 = 70
	}
}
