\version "2.18.2"

\header {
 	title = "O the Deep, Deep Love of Jesus"
 	composer = "Thomas J. Williams"
 	poet = "Samuel T. Francis"
	%copyright = \markup { "Copyright" \char ##x00A9 "2004 by Rob Ritter" }
	copyright = "Public Domain"
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key f \minor
 	\time 4/4
	\aikenHeads
  	\large
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	\lead
	f,4 \tuplet 3/4 {f8( g aes)}
}


alto = \relative c' {
	\global
	c4
}


tenor = \relative c' {
	\global
	\clef "bass"
	aes4
}


bass = \relative c {
	\global
	\clef "bass"
	f,4
}


verseOne = \lyricmode {
	\set stanza = "1."
	O the deep, deep love of Je -- sus,
	vast, un -- meas -- ured, bound -- less, free!
	Roll -- ing as a might -- y o -- cean
	in its full -- ness o -- ver me!
	Un -- der -- neath me, all a -- round me,
	is the cur -- rent of Thy love
	Lead -- ing on -- ward, lead -- ing home -- ward,
	to Thy glo -- rious rest a -- bove!
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
