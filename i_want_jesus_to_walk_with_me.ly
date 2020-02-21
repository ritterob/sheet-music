\version "2.18.2"

\header {
 	title = "I Want Jesus to Walk with Me"
 	composer = "African-American Spiritual"
 	poet = ""
	%meter = ""
	copyright = "Public Domain"
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key f \major
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
	d,4 f a2 a2~ a4 d, f e d1~ d2
	f4 a c2 c~ c4 a4 d8( c) a4 a1~ a2
	a4 cis d2 f~ f4 d(~ d8 c) a( g) f2 d~ d4
	d'~ d8 c a( g) f2 d~ d4 d f e d1~ d2
	\bar "|."
}


alto = \relative c' {
	\global
	d4 f d2 cis( d4) d d cis a2( bes a)
	f'4 a f2( e f4) a a f e2( f g)
	a4 e d2 d2~ d4 g2 e4 d2 d2~ d4 r4
	r2 d2 a2~ a4 a d cis a2( bes a)
}


tenor = \relative c' {
	\global
	\clef "bass"
	d,4 f f2 g( a4) a a g f2( g f)
	f4 a a2 bes( c4) a a d cis2( d cis)
	a4 a a2 a~ a4 bes2 bes4 a2 f~ f4 s4
	s2 a f~ f4 f a g f2( g f)
}


bass = \relative c {
	\global
	\clef "bass"
	d4 f d2 e( f4) a a, a d1~ d2
	f4 a f2 g( a4) a f d a1( a'2)
	a4 g f2 d~ d4 e2 c4 d2 c( bes4) d\rest
	d2\rest a a~ a4 a a a d1~ d2
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	I want Je -- sus to walk with me;
	I want Je -- sus to walk with me;
	all a -- long my pil -- grim jour -- ney,
	Lord, I want Je -- sus to walk with me.
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
		\tempo 4 = 92
	}
}
