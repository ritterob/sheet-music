\version "2.18.2"

\header {
 	title = "O the Deep, Deep Love of Jesus"
 	composer = "Thomas J. Williams"
 	poet = "Samuel T. Francis"
	%copyright = \markup { "Copyright" \char ##x00A9 "2004 by Rob Ritter" }
	copyright = "Public Domain"
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key f \minor
 	\time 12/8
	\aikenHeads
  \large
  \override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	f,4. f8( g aes) g4. f g g8( aes bes) aes4 ( g8) f4.
	c'4. bes8( c des) c4( bes8) aes4. bes4( aes8) g4. f2.
	f4. f8( g aes) g4. f g g8( aes bes) aes4 ( g8) f4.
	c'4. bes8( c des) c4( bes8) aes4. bes4( aes8) g4. f2.
	c'4. aes8( bes c) bes4. bes aes f8( g aes) g4. g
	f f8( g aes) bes4. bes aes bes8( aes bes) c2.
	f,4. f8( g aes) g4. f g g8( aes bes) aes4 ( g8) f4.
	c'4. bes8( c des) c4( bes8) aes4. bes4( aes8) g4. f2.
}


alto = \relative c' {
	\global
	c4. c e f f e f c c ees4( f8) g4. f f e f2.
	c4. c e f f e f c c ees4( f8) g4. f f e f2.
	ees4. ees ees ees c f f g f c f ees c f e2.
	aes,4. c e f f e f c ees ees ees f f e f2.
}


tenor = \relative c' {
	\global
	\clef "bass"
	%\lead
	aes4. c c aes des c c4( bes8) aes4.
	ees' bes c c des4( c8) bes4. aes2.
	aes4. c c aes des c c4( bes8) aes4.
	ees' bes4( aes8) c4. c des4( c8) bes4. aes2.
	aes4. aes aes g aes c c c
	f, aes aes g aes f g2.
	f4. c' c aes des c c4( bes8) aes4.
	aes g8( aes bes) aes4( g8) f4. des'4( c8) bes4. aes2.
}


bass = \relative c {
	\global
	\clef "bass"
	f,4. aes c des bes c f f aes g e f bes, c f2.
	f,4. aes c des bes c f f aes g4( f8) e4. f bes, c f2.
	aes,4. c ees ees f aes, c c f ees des ees f4( ees8) des4. c2.
	des4. aes c des bes c f f aes ees aes, des bes c f2.
}


verseOne = \lyricmode {
	\set stanza = "1."
	O the deep, deep love of Je -- sus,
	vast, un -- meas -- ured, bound -- less, free!
	Roll -- ing as a might -- y o -- cean
	in its full -- ness o -- ver me!
	Un -- der -- neath me, all a -- round me,
	is the cur -- rent of Thy love
	Lead -- ing on -- ward, lead -- ing home -- ward,
	to Thy glo -- rious rest a -- bove!
}


verseTwo = \lyricmode {
	\set stanza = "2."
	O the deep, deep love of Je -- sus,
	spread His praise from shore to shore!
	How He lov -- eth, ev -- er lov -- eth,
	chang -- eth nev -- er, nev -- er more!
	How He watch -- es o'er His loved ones,
	died to call them all His own;
	How for them He in -- ter -- ced -- eth,
	watch -- eth o'er them from the throne!
}


verseThree = \lyricmode {
	\set stanza = "3."
	O the deep, deep love of Je -- sus,
	love of eve -- ry love the best!
	'Tis an o -- cean full of bless -- ing,
	'tis a ha -- ven giv -- ing rest!
	O the deep, deep love of Je -- sus,
	'tis a heav'n of heav'ns to me;
	And it lifts me up to glo -- ry,
	for it lifts me up to Thee!
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
		\tempo 4. = 80
	}
}
