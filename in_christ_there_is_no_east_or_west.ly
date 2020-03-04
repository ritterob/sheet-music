\version "2.18.2"

\header {
 	title = "In Christ There Is No East or West"
 	composer = "African-American Spiritual"
	arranger = "adapt. by Harry T. Burleigh"
 	poet = "John Oxenham"
	%meter = ""
	%copyright = \markup { "Copyright" \char ##x00A9 "1988 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key bes \major
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
	bes,8( d) f4 f f f8( g) aes4 aes g4.
	f8 g4 bes bes8( g) f( g) bes2.
	bes8( c) d4 bes bes g f ees d
	bes8( c) d( f4) g8 f( d) c4 bes2. 
}


alto = \relative c' {
	\global
	bes4 d c bes des c ees ees4.
	d!8 ees4 d ees ees d( ees d)
	d8( f) f4 d8( ees) f(d) c4 c8( bes) bes( a) bes4
	bes bes8( d4) d8 d8( bes) a4 f2.
}


tenor = \relative c' {
	\global
	\clef "bass"
	d,8( f) bes4 a bes g ees aes bes4.
	bes8 bes4 bes g8( bes) a!4 f( g f)
	bes8( a) bes4 bes8( c) d( bes) a4 f f f
	g f8( bes4) bes8 bes( f) ees!4 d2.
}


bass = \relative c {
	\global
	\clef "bass"
	bes4 bes ees d ees aes, c ees4.
	bes8 ees4 g c, f bes,2.
	g'8( f) bes( a) g4 f ees d c bes
	ees f4. e8 f4 f, bes2.
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	In Christ there is no east or west,
	In Him no south or north,
	But one great fel -- low -- ship of love
	Through -- out the whole wide earth.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	In Him shall true hearts ev -- ’ry -- where
	Their high com -- mu -- nion find;
	His ser -- vice is the gold -- en cord
	Close -- bind -- ing hu -- man -- kind.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Join hands then, broth -- ers of the faith,
	What -- e’er your race my be!
	Who serves my Fa -- ther as a son
	Is sure -- ly kin to me.
}


verseFour = \lyricmode {
	\set stanza = "4."
	In Christ now meet both east and west,
	In Him meet south and north;
	All Christ -- ly souls are on in Him
	Through -- out the whole wide earth.
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
