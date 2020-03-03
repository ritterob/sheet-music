\version "2.18.2"

\header {
 	title = "Let Us Break Bread Together"
 	composer = "African-American Spiritual"
 	poet = ""
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
	c,4 d f2 f4. d8 f a4. g4 g f1~ f2
	f4 a c2 c4. a8 c e4. d4 d c1~ c2
	f,4 \mark "Refrain" a c2 c4 c c2 d4 c bes bes8 g bes4 bes bes2
	c4( d) a2 a f8 a4. g2 f1~ f2
	\bar "|."

}


alto = \relative c' {
	\global
	c4 d c2 d4. d8 d d4. d4 e c2 d4 d c2
	%\bar "|" \break
	c4 f f2 e4. e8 f g4. f4 f e2 f4 f g2
	\bar "||" %\break
	d4 e f2 f4 f fis2 fis4 fis d d8 d g4 g g2
	%\bar "|" \break
	e f f d8 f4. d4( e) c1~ c2

}


tenor = \relative c' {
	\global
	\clef "bass"
	a4 bes a2 a4. a8 bes c4. bes 4 bes a2 bes4 bes a2
	a4 c c2 bes4. bes8 a c4.c4 b g2 a4 a bes2
	c4 c c2 a4 a a2 a4 a bes bes8 c d4 d c2
	g4( c) c2 d4( c) bes8 c4. bes2 a1~ a2
}


bass = \relative c {
	\global
	\clef "bass"
	f4 f f2 d4. d8 bes bes4. c4 c f1~ f2
	f4 f a2 g4. g8 a a4. d,4 g c,1~ c2
	c'4 bes a2 f4 e d2 d4 d g g8 g g4 f e2
	c f4( e) d2 g8 g4. c,2 <f f,>1~ <f f,>2
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	Let us break bread to -- geth -- er on our knees;
	\repeat unfold 3 {\skip 1}
	Let us break bread to -- geth -- er on our knees.
	\repeat unfold 3 {\skip 1}
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Let us drink wine to -- geth -- er on our knees;
	(on our knees)
	Let us drink wine to -- geth -- er on our knees.
	(on our knees)
	When I fall on my knees, with my face to the ris -- ing sun,
	O Lord, have mer -- cy on me.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Let us praise God to -- geth -- er on our knees;
	\repeat unfold 3 {\skip 1}
	Let us praise God to -- geth -- er on our knees.
	\repeat unfold 3 {\skip 1}
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
			\lyricsto "alto" \verseOne
		}
		\new Lyrics {
			\lyricsto "alto" \verseTwo
		}
		\new Lyrics {
			\lyricsto "alto" \verseThree
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
