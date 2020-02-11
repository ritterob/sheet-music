\version "2.18.2"

\header {
 	title = "O How Love I Thy Law"
 	composer = "James McGranahan"
 	poet = "Psalm 19:7–3"
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  page-count = #1
}


global = {
 	\key f \major
 	\time 6/8
	\aikenHeads
  	\huge
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
	\partial 8
}


soprano = \relative c'' {
 	\global
	c,8 c( f) a a4 bes8 a4 g8 g4 c,8 c( e) g bes4 bes8 bes4.( a4)
	c,8 c( f) a c4 c8 c4 bes8 a4 g8 f( e) f a4 g8 g4.( f4)

}


alto = \relative c' {
	\global
}


tenor = \relative c' {
	\global
	\clef "bass"
}


bass = \relative c {
	\global
	\clef "bass"
}


verseOne = \lyricmode {
	\set stanza = "1."
	The stat -- utes of the Lord are right,
	And do re -- joice the heart;
	The Lord's com -- mand is pure, and doth
	Light to the eyes impart.
}


verseTwo = \lyricmode {
	\set stanza = "2."
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
