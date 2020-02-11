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
	c,8 c( f) a c4 c8 c4 bes8 a4 g8 f( e) f a4 g8 g4.( f4) b8\rest
	\bar "||"
	c4. c c8 b c a4. a a a8 gis a f4.
	f8 f f e4 d8 e4. g c(~ c8 d) b c4.~ c
	c4. c c8 b c a4. a f g8 f d d4.
	c8 c c f4 g8 a4 f8 g4 f8 f4.~ f~ f~ f4
	\bar "|."

}


alto = \relative c' {
	\global
	c8 c4 f8 f4 f8 f4 e8 e4 c8 c4 e8 e( f) g g4.( f4)
	c8 c4 f8 f4 ees8 d4 d8 d4 d8 c4 c8 c4 c8 c4.~ c4 s8
	a'4. a a8 gis a f4. f f f8 f f c4.
	d8 d d c4 b8 c4. e e(~ e8 f) d e4.~ e
	f f f8 f f f4. ees ees c8 d bes bes4.
	a8 a a c4 f8 f4 c8 c4 c8 c4. c8( ees) d c4.~ c 
}


tenor = \relative c' {
	\global
	\clef "bass"
	a8 a4 c8 c4 d8 c4 c8 c4 c,8 e( g) bes g4 c8 c4.~ c4
	a8 a4 c8 a4 f8 f4 f8 f4 bes8 a( g) a c4 bes8 bes4.( a4) s8
}


bass = \relative c {
	\global
	\clef "bass"
	f8 f4 f8 f4 f8 c4 c8 c4 c8 c4 c8 c( d) e f4.~ f4
	f8 f4 f8 f4 a,8 bes4 bes8 bes4 bes8 c4 c8 c4 c8 f4.~ f4 d8\rest
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
	Un -- spot -- ted is the fear of God,
	Ad ev -- er doth en -- dure;
	The judg -- ments of the Lord are truth
	And right -- eous -- ness most pure.
}


verseThree = \lyricmode {
	\set stanza = "3."
	They more than gold, yea much fine gold,
	To be de -- sir -- ed are;
	Than hon -- ey from the hon -- ey -- comb
	That drop -- peth— sweet -- er far.
	O how love I Thy law, O how love I Thy law!
	It is my med -- i -- ta -- tion all the day;
	O how love I Thy law, O how love I Thy law;
	It is my med -- i -- ta -- tion all the day.
}

verseFour = \lyricmode {
	\set stanza = "4."
	More -- o -- ver, they Thy ser -- vant warn
	How he his life should frame;
	A great re -- ward pro -- vid -- ed is
	For them that keep the same.
}

verseFive = \lyricmode {
	\set stanza = "5."
	O do not suf -- fer sin to have
	Do -- min -- ion o -- ver me;
	I shall be right -- eous then, and from
	The great trans -- gres -- sion free.
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
