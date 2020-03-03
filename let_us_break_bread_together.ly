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
	f4 a c2 c4. a8 c e4. d4 d c1~ c2 \bar "|" \break
	f,4 a c2 c4 c c2 d4 c bes bes8 g bes4 bes bes2
	c4( d) a2 a f8 a4. g2 f1~ f2 \bar "|."

}


alto = \relative c' {
	\global
	c4 d c2 d4. d8 d d4. d4 e c2 d4 d c2
}


tenor = \relative c' {
	\global
	\clef "bass"
}


bass = \relative c {
	\global
	\clef "bass"
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	Let us break bread to -- geth -- er on our knees;
	Let us break bread to -- geth -- er on our knees.
	When I fall on my knees, with my face to the ris -- ing sun,
	O Lord, have mer -- cy on me.
}


extraText = \lyricmode {
	\unfold repeat 8 {\skip 1}
	
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Let us drink wine to -- geth -- er on our knees;
	Let us drink wine to -- geth -- er on our knees.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Let us praise God to -- geth -- er on our knees;
	Let us praise God to -- geth -- er on our knees.
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
