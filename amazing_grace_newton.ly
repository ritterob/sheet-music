\version "2.18.2"

\header {
 	title = "Amazing Grace"
 	composer = "Traditional"
 	poet = "John Newton"
	copyright= \markup { "Public Domain" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key g \major
 	\time 3/4
	\aikenHeads
  	\large
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	d,4 g2 b8( g) b2 a4 g2 e4 d2
	d4 g2 b8( g) b2 a4 d2.~ d2
	b4 d4.( b8) d( b) g2 d4 e4.( g8) g( e) d2
	d4 g2 b8( g) b2 a4 g2.~ g2
	\bar "|."
}


alto = \relative c' {
	\global
	b4 b2
}


tenor = \relative c' {
	\global
	\clef "bass"
	g4 d2
}


bass = \relative c {
	\global
	\clef "bass"
	g4 g2
}


verseOne = \lyricmode {
	\set stanza = "1."
	A -- maz -- ing grace! how sweet the sound,
	That saved a wretch like me!
	I once was lost, but now am found,
	Was blind, but now I see.
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
