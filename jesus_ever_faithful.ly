\version "2.18.2"

\header {
 	title = "Jesus, Ever Faithful"
 	composer = "R.R."
 	poet = "Robert Ritter"
	copyright= \markup { "Copyright" \char ##x00A9 "1994 by Robert Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key c \major
 	\time 4/4
	\aikenHeads
  	\large
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	%\partial 4
}


soprano = \relative c'' {
 	\global
	g4 aes bes ees d( c) bes2 g4 aes bes aes8( g) f1
	g4 aes bes ees d( c) bes g bes aes8( g) f4 f ees1 \bar "||"
	ees1 \bar "" ees
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


verseOne = \lyricmode {
	\set stanza = "1."
}


verseTwo = \lyricmode {
	\set stanza = "2."
}


verseThree = \lyricmode {
	\set stanza = "3."
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
