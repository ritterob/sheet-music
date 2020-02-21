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
	ragged-bottom = true
	indent = 0
  	%page-count = #1
}


global = {
 	\key g \major
 	\time 4/4
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
	g4 a b a8 b c4 b b( a) g a b a8 g fis4 g a2
	g4 a b a8 b c4 b b( a) b a8 g fis( g) a4 g4.
	\bar "||"
	d8 \mark Chorus b'4 a g4. d8 b'4 a g4. e8 b'4 a g4. d8 b'4.( c16 b) a4.
	d,8 b'4 a g4. d8 b'4 a g4. e8 b'4 a g4. g8 fis( g) a4 g1
	\bar "|."
}


alto = \relative c' {
	\global
	d4 fis g g8 g g4 g g( fis) d fis g fis8 e d4 e fis2
	d4 fis g g8 g g4 g g( fis) g e8 e d4 d d4.
	d8 g4 fis d4. d8 g4 fis e4. e8 g4 fis d4. d8 g2 fis4.
	d8 g4 fis d4. d8 g4 fis e4. e8 g4 fis e4. e8 d4 d d1
}


tenor = \relative c' {
	\global
	\clef "bass"
	%\lead
	b4 d d d8 d e4 d d( c) b d d d8 d d4 cis d2
	b4 d d d8 d e4 d d( c) b c8 b c4 c b4.
	b8 d4 c b4. b8 d4 d c4. c8 b4 c b4. b8 d2 d4.
	d8 d4 c b4. b8 d4 d c4. c8 b4 c b4. b8 c4 c b1
}


bass = \relative c {
	\global
	\clef "bass"
	%\lead
	g4 d' g, g8 g c4 d d2 g,4 d' g, g8 g a4 a d2
	g,4 d' g, g8 g c4 d d2 e4 c8 e d4 d g,4.
	g8 d'4 d g,4. g8 g4 b c4. c8 d4 d g,4. g8 b4( c) d4.
	d8 d4 d g,4. g8 g4 b c4. c8 d4 d e4. c8 d4 d <g g,>1
}


verseOne = \lyricmode {
	\set stanza = "1."
	Steeped in sin, in my shame un -- clean
	To Your al -- tar my gift I bring.
	Then You come and lift up my face,
	Shine on me with Your grace.
	A -- maz -- ing grace, how sweet the sound
	When You de -- clare me ho -- ly!
	My life is yours, for I have found
	The mean -- ing of a -- maz -- ing grace!
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Far from God, lost and all a -- lone,
	I can't cleanse my -- self on my own,
	I need You, Lord, to make me whole,
	Bright -- en my sin- stained soul.
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
