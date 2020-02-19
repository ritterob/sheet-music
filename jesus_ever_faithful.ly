\version "2.18.2"

\header {
 	title = "Jesus, Ever Faithful"
 	composer = "R.R."
 	poet = "Rob Ritter"
	copyright = \markup { "Copyright" \char ##x00A9 "1995 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
}


global = {
 	\key ees \major
 	\time 4/4
	\aikenHeads
  	\huge
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	%\partial 4
}


soprano = \relative c'' {
 	\global
	g4 aes bes ees d( c) bes2 g4 aes bes aes8( g) f1 \break
	g4 aes bes ees d( c) bes g bes aes8( g) f4 f ees1 \bar "||"
	ees1 \bar "" ees
	\bar "|."

}


alto = \relative c' {
	\global
	ees4 ees ees ees f( d) ees2 ees4 ees ees ees d1
	ees4 ees ees ees f( d) ees ees ees ees d d ees1
	c1 bes
}


tenor = \relative c' {
	\global
	\clef "bass"
	bes4 aes g bes f( aes) g2 bes4 c bes c bes1
	bes4 aes g bes f( aes) g bes bes c bes aes g1
	aes1 g
}


bass = \relative c {
	\global
	\clef "bass"
	ees4 ees ees ees bes2 ees ees4 ees g, aes bes1
	ees4 ees ees ees bes2 ees4 ees g, aes bes bes ees1
	<ees ees,>1 <ees ees,>
}


verseOne = \lyricmode {
	\set stanza = "1."
	Je -- sus, e -- ver faith -- ful, true to us for aye,
	May we prove us worth -- y and ne’er Thy trust be -- tray.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Be the things Thou giv’st us great or be thay small,
	Help us, Lord of Hea -- ven, be faith -- ful in them all.
	A -- men.
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
		\new Staff  \with {midiInstrument = #"acoustic grand"}<<
			\new Voice = "tenor" {\voiceThree \tenor}
			\new Voice = "bass" {\voiceFour \bass}
		>>
		
	>>
	
	\layout{}
	\midi{
		\tempo 4 = 100
	}
}
