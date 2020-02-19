\version "2.18.2"

\header {
 	title = "Be Thou My Vision"
 	composer = "Traditional Irish Melody"
 	poet = "Ancient Irish Poem, Tr. Mary E. Byrne"
	meter = "Stanza 3 by Eleanor H. Hull"
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
	\set Timing.beamExceptions = #'()
	\set Timing.baseMoment = #(ly:make-moment 1/4)
	\set Timing.beatStructure = #'(1 1 1)
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
	bes4 bes bes aes bes c bes c d ees2.
	d4 d ees f ees ees ees ees ees f2.
	aes4 ees ees ees( ees) f ees c bes aes2( bes4)
	bes ees f ees ees d c c aes bes2.
}


tenor = \relative c' {
	\global
	\clef "bass"
	g4 g ees ees d ees ees g bes bes2.
	bes4 bes a bes bes bes aes bes c d2.
	ees4 c8( bes) aes4 aes( g) bes g g f ees2( f4)
	g bes bes g bes bes aes aes f g2.
}


bass = \relative c {
	\global
	\clef "bass"
	ees4 ees g, aes bes aes g c bes ees2.
	bes4  bes c d ees g aes g c, bes2.
	aes4 aes c ees( ees) d c c g aes( c d)
	ees ees d c bes g aes aes f <ees ees'>2.
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
	Be Thou my wis -- dom, and Thou my true word;
	I ev -- er with Thee and Thou with me, Lord;
	Thou my great Fa -- ther, I Thy true son;
	Thou in me dwell -- ing, and I with Thee, one.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Be Thou my bat -- tle shield, sword for my fight;
	Be Thou my dig -- ni -- ty, Thou my de -- light,
	Thou my soul’s shel -- ter, Thou my high tow’r;
	Raise Thou me heav’n -- ward, O Pow’r of my pow’r.
}


verseFour = \lyricmode {
	\set stanza = "4."
	Rich -- es I heed not, nor man’s emp -- ty praise,
	Thou mine in -- her -- i -- tance, now and al -- ways;
	Thou and Thou on -- ly, first in my heart,
	High King of heav -- en, my trea -- sure Thou art.
}


verseFive = \lyricmode {
	\set stanza = "5."
	High King of heav -- en, my vic -- to -- ry won,
	My I reach heav -- en’s joys, O bright heav’n’s Sun!
	Heart of my own_heart, what -- ev -- er be -- fall,
	Still be my vi -- sion, O Rul -- er of all.
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
		\new Lyrics {
			\lyricsto "soprano" \verseFive
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
