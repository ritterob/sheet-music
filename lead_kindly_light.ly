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
	c'4 bes aes aes4. aes8^\markup {\italic "rit."} g f ees4( aes4.) g8 
	\set Timing.measurePosition = #(ly:make-moment -3/8)
	g4( aes8)\fermata
	\bar "|."
	\omit Score.TimeSignature
	\time 4/4
	aes2 aes
	\bar ".."
}


alto = \relative c' {
	\global
	ees8 ees ees ees8. c16 des8 ees ees des des4( ees2)
	ees4 ees ees8( c) des4.
	ees8 ees ees ees8. c16 des8 ees ees des des4( c2)
	c4 ees4. ees8 ees2.
	ees4 d ees f2 ees4 ees8 ees d4 d ees( c des!)
	c des ees8( e) f4. f8 ees des c4( ees4.) des8 des4( c8)
	des2 c
}


tenor = \relative c' {
	\global
	\clef "bass"
	c8 c des c8. aes16 aes8 aes aes aes aes4( c des)
	ees c c8( aes) aes4( g8)
	des' des des c8. aes16 aes8 aes aes aes aes2.
	aes4 c4. bes8 des4( c2)
	bes4 aes g8( c) bes4( aes) g g8 g aes4 aes g( aes bes)
	aes f8( g) aes4 aes4. f8 g aes aes4( c4.) bes8 bes4( aes8)\fermata
	f2 ees
}


bass = \relative c {
	\global
	\clef "bass"
	aes'8 aes aes aes8. aes,16 bes8 c des f aes2( bes4)
	c bes aes ees4.
	ees8 f g aes8. aes,16 bes8 c des f aes4( aes, c)
	ees ees4. ees8 ees4( aes2)
	g4 f ees d2 ees4 bes8 bes bes4 bes ees2.
	aes,4 bes c des4. des8 des des ees2 ees4 ees( aes,8)
	des2 aes
}


% Some useful characters: – — “ ” ‘ ’


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
	I was not ev -- er thus, nor prayed that Thou
	Should’st lead me on;
	I loved to choose and see my path; but now
	Lead Thou me on.
	I loved the gar -- ish day, and spite of fears,
	Pride ruled my will; Re -- mem -- ber not past years.
}


verseThree = \lyricmode {
	\set stanza = "3."
	So long Thy pow’r has blest me, sure it still
	Will lead me on
	O’er moor and fen, o’er crag and tor -- rent, till
	The night is gone.
	And with the morn, those an -- gel– fac -- es smile,
	Which I have loved long since, and lost a -- while.
	A -- men.
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
