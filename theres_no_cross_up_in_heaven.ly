\version "2.18.2"

\header {
 	title = "There’s No Cross Up In Heaven"
 	composer = "R.R."
 	poet = "Rob Ritter"
	%meter = ""
	%copyright = \markup { "Copyright" \char ##x00A9 "2002 by Rob Ritter" }
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
 	\time 9/8
	\aikenHeads
  	\huge
	\set Timing.beamExceptions = #'()
	\set Timing.baseMoment = #(ly:make-moment 1/4)
	\set Timing.beatStructure = #'(1 1 1 1)
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	\partial 4.
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	ees,4 f8 g4. ees ees4 aes8 g4. ees bes'4( c8) bes4. ees, aes g2.
	g4 aes8 g4. f g aes g f4( f8) ees4. ees f g2.
	ees4 f8 g4. ees ees4( aes8) g4. ees bes'4( c8) bes4. ees, aes g2.
	g4 aes8 g4. f f4( g8) aes4. g f4 f8 ees4. g f ees2.
	\bar "||"
	ees'4 \mark "Chorus" d8 c2. c4 d8 ees4. d c4 c8 c4. bes g bes2.
	ees4 d8 c2. c4 d8 ees4. d c4 c8 c4. bes g f2.
	ees4 f8 g4. ees ees4( aes8) g4. ees bes'4 c8 bes4. ees, aes g2.
	g4 aes8 g4. f f4 g8 aes4. g f ees g f ees2
	\bar "|."
}


alto = \relative c' {
	\global
	ees4 d8 ees4. bes c4 d8 ees4. bes ees4( ees8) ees4. bes d ees2.
	ees4 ees8 d4. d d d d d4( d8) c4. c d ees2.
	c4 d8 ees4. bes c4( d8) ees4. bes ees4( ees8) ees4. bes d ees2.
	ees4 ees8 d4. d d4( d8) d4. d d4 d8 bes4. ees d bes2.
	g'4 bes8 aes2. aes4 bes8 c4. bes aes4 aes8 aes4. g ees g2.
	g4 bes8 aes2. aes4 bes8 c4. bes aes4 aes8 aes4. g ees d2.
	c4 d8 ees4. bes c4( d8) ees4. bes ees4 ees8 ees4. bes d ees2.
	ees4 ees8 d4. d d4 d8 d4. d d bes ees d bes2
}


tenor = \relative c' {
	\global
	\clef "bass"
	g4 aes8 bes4. g aes4 aes8 bes4. g g4( g8) g4. g bes bes2.
	bes4 bes8 bes4. bes bes bes bes aes4( aes8) aes4. aes bes bes2.
	aes4 aes8 bes4. g aes4( aes8) bes4. g g4( g8) g4. g bes bes2.
	bes4 bes8 bes4. bes bes bes bes aes4 aes8 g4. bes aes g2.
	g4 g8 aes2. c4 aes8 c4. d ees4 ees8 ees4. bes bes bes2.
	bes4 g8 aes2. c4 aes8 c4. d ees4 ees8 ees4. bes bes bes2.
	aes4 aes8 bes4. g aes bes g g4 g8 g4. g bes bes2.
	bes4 bes8 bes4. bes bes4 bes8 bes4. bes aes g bes aes g2
}


bass = \relative c {
	\global
	\clef "bass"
	ees4 bes8 ees4. ees ees4 bes8 ees4. ees ees4( ees8) ees4. ees bes ees2.
	ees4 ees8 bes4. bes bes bes bes bes4( bes8) ees4. ees bes ees2.
	bes4 bes8 ees4. ees bes4( bes8) ees4. ees ees4( ees8) ees4. ees bes ees2.
	ees4 ees8 bes4. bes bes bes bes bes4 bes8 ees4. ees bes ees2.
	ees,8( f) g aes2. aes4 aes8 aes4. bes c4 d8 ees4. ees bes ees2.
	ees,8( f) g aes2. aes4 aes8 aes4. bes c4 d8 ees4. ees ees bes2.
	bes4 bes8 ees4. ees bes ees ees ees4 ees8 ees4. ees bes ees2.
	ees4 ees8 bes4. bes bes4 bes8 bes4. bes bes ees4. ees bes ees2
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	There’s a cross up -- on a hill -- top where Je -- sus was led,
	Where the nails pierced His hands and the thorns tore His head,
	Where the noon -- tide brought_the dark -- ness that cov -- ered the sky,
	Where the cru -- el crowds ga -- thered just to watch a Man die.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	There’s a tomb with -- in a gar -- den where Je -- sus did lay,
	Where the si -- lence of death seemed to hold its dark sway,
	Where the stone was rolled back -- ward and_the an -- gel ap -- peared
	Say -- ing “He is now ri -- sen, He is no long -- er here.”
	There’s no cross up in Hea -- ven, for the vic -- t’ry’s been won,
	There’s no death o -- ver Jor -- dan, on -- ly life in the Son,
	There’s no dark -- ness in Glo -- ry where the Light e -- ver shines,
	There’s no trou -- ble in my spi -- rit, for Je -- sus is mine.
}


verseThree = \lyricmode {
	\set stanza = "3."
	There’s a ta -- ble in His pre -- sence that_is spread for a feast,
	Where the bless -- ed saints ga -- ther, from_the great -- est to least
	To re -- mem -- ber the Sav -- ior and_the suff -- ’ring He bore
	’Til He comes back to take us to that beau -- ti -- ful shore.
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
		\tempo 4. = 88
	}
}
