\version "2.18.2"

\header {
 	title = "Give Me Jesus"
 	composer = "African-American Spritual"
 	poet = ""
	%meter = ""
	copyright = \markup "Public Domain"
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
 	\partial 2
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	a4.( g8) g4 e g8 a4. c,2
	e4.( c8) d4 c e8 g4. g2
	a4.( g8) g4 e g8 a4. c,2
	e4 d c1 c2
	\bar "||"
	e4 \mark "Refrain" g g2.( a4) b2
	a4 g c2.( d4) e2
	e4 d c a2 c4 c,2
	e4 d c1 c2
	\bar "|."
}


alto = \relative c' {
	\global
	d4.( d8) e4 c d8 d4. c2
	b4.( b8) a4 a a8 b4. c2
	d4.( d8) c4 c c8 b4. a2
	b4 b g2( a) g
	e'4 g f2( e) d
	f4 d e2.( f4) g2
	gis4 gis e e2 c4 a2
	b4 b g2( a) g 
}


tenor = \relative c' {
	\global
	\clef "bass"
	f,4( g) g g g8 g4. e2
	e4( e) d d f8 f4. e2
	f4( f) e e e8 e4. e4( d)
	g f! e2.( d4) e2
	e4 g c2( b) b
	c4 b c2( b) bes b4 b
	c b( a) g fis2
	g4 f e2.( d4) e2
}


bass = \relative c {
	\global
	\clef "bass"
	b4( b) c c b8 b4. a2
	g4( g) f f g8 g4. c2
	b4( g) a a g8 g4. fis2
	g4 g a( g f!2) c'
	e4 g a2( g) f4( g)
	a b a2( g) c,
	e4 e a g( f) e d2
	g,4 g a( g f2) c' 
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	In_the morn -- ing, when I rise,
	in_the morn -- ing, when I rise,
	in_the morn -- ing, when I rise,
	give me Je -- sus.

}


verseTwo = \lyricmode {
	\set stanza = "2."
	Dark mid -- night was my cry,
	dark mid -- night was my cry,
	dark mid -- night was my cry,
	give me Je -- sus.
	Give me Je -- sus,
	give me Je -- sus;
	you may have all this world;
	give me Je -- sus.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Oh, when I come to die,
	oh, when I come to die,
	oh, when I come to die,
	give me Je -- sus.
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
		\tempo 4 = 88
	}
}
