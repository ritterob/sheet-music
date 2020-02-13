\version "2.18.2"

\header {
 	title = "Amazing Grace"
 	composer = "R.R."
 	poet = "Rob Ritter"
	copyright= \markup { "Copyright" \char ##x00A9 "2004 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key g \major
 	\time 4/4
	\aikenHeads
  	\large
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	%\partial 4
}


soprano = \relative c'' {
 	\global
	g4 a b a8 b c4 b b( a) g a b a8 g fis4 g a2
	g4 a b a8 b c4 b b( a) b a8 g fis( g) a4 g4.
	\bar "||"

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
	Steeped in sin, in my shame un -- clean
	To Your al -- tar my gift I bring.
	Then You come and lift up my face,
	Shine on my with Your grace.
	A -- maz -- ing grace, how sweet the sound
	When You de -- clare me ho -- ly!
	My life is yours, for I have found
	The mean -- ing of a -- maz -- ing grace!
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
