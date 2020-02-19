\version "2.18.2"

\header {
 	title = "Be Thou My Vision"
 	composer = "Traditional Irish Melody"
 	poet = "Ancient Irish Poem, Tr. Mary E. Byrne"
	meter = "Verse 3 by Eleanor H. Hull"
	copyright= "Public Domain"
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key ees \major
 	\time 3/4
	\aikenHeads
  	\huge
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	ees,4 ees f8( ees) c4 bes c ees ees f g2.
	f4 f f f g bes c bes g bes2.
	c4 c8( d) ees( d) c4( bes) g bes ees, d c2( bes4)
	ees g bes c8( bes) g4 ees8( g) f4 ees ees ees2.
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
	Be Thou my vi -- sion, O Lord of my heart;
	Naught be all else to me, save that Thou art—
	Thou my best thought by day or by night,
	Wak -- ing or sleep -- ing, Thy pre -- sence my light.
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
