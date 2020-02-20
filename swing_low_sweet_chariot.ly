\version "2.18.2"

\header {
 	title = "Swing Low, Sweet Chariot"
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
 	\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	a4 \mark "Refrain" f2. a4 f4. f8 d( c4.) f8 f f f a a c4 c2.
	d8( c) a2. c4 f,4. f8 d( c4.) f8 f f g a a g4 f2.
	\bar "|."
	a4 c f,8(d) f( f4) d8 f( f) f4 d8( c4.)
	f8 f f f a a c4 c2.
	c4 d8( c) a4 a8( g) f4 f8 f( f)( f) d( c4.)
	f8 f f g a a g4 f2.
	\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
	\mark \markup {\italic "To Refrain"}
	\bar "||"
}


alto = \relative c' {
	\global
	e4 c2. c4 d4. d8 bes( a4.) c8 c d d f f f4 e( f g)
	e f2( ees4) ees d4. d8 d( c4.) d8 d f f f f e4 d( c2) ^\markup {\italic "Fine"}
	f4 f c8( d) d( d4) d8 d( d) d4 d8( c4.)
	c8 c d d f f f4 e( f g)
	e f f ees ees d8 d( d)( d) d( c4.)
	d8 d f f f f e4 c2.
}


tenor = \relative c' {
	\global
	\clef "bass"
	c4 a2. f4 f4. f8 f2 a8 a bes bes c c a4 g2.
	bes4 c2. a4 bes4. bes8 bes( a4.) a8 a bes bes c c bes4 bes( a2)
	c4 a a8( a) a( a4) a8 bes8( bes) bes4 bes8( a4.)
	a8 a bes bes c c a4 g2.
	bes4 bes8( a) c4 c8( bes) a4 bes8 bes( bes)( bes) bes(a4.)
	a8 a bes bes c c bes4 a2.
}


bass = \relative c {
	\global
	\clef "bass"
	c4 f2. a4, bes4. bes8 f2 f'8 f f f f f f4 c( d e)
	
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	Swing low, sweet char -- i -- ot, com -- ing for to car -- ry me home;
	swing low, sweet char -- i -- ot, com -- ing for to car -- ry me home.
	\set stanza = "1."
	I looked o-ver Jor-dan, and what_did I see,
	com -- ing for to car -- ry me home?
	A band of an -- gels com -- ing_af-ter me,
	com -- ing for to car -- ry me home.
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
		\tempo 4 = 88
	}
}
