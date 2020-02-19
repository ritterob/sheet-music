\version "2.18.2"

\header {
 	title = "Lead Me To Some Soul Today"
 	composer = "Will H. Houghton"
 	poet = "Wendell P. Loveless"
	%meter = ""
	copyright = \markup {
		"Copyright" \char ##x00A9 "1964 by Hope Publising Co."
		\teeny
		"(Need to get permission.)"
	}
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
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \transpose f f {
	\relative c'' {
 		\global
		f,4 a a4. g8 f4 bes bes4.
	}
}


alto = \transpose f f {
	\relative c' {
		\global
	}
}


tenor = \transpose f f {
	\relative c' {
		\global
		\clef "bass"
	}
}


bass = \transpose f f {
	\relative c {
		\global
		\clef "bass"
	}
}


% Some useful characters: — “ ” ‘ ’


verseOne = \lyricmode {
	Lead me to some soul to -- day,
	O teach me, Lord, just what to say;
	Friends of mine are lost in sin,
	And can -- not find their way.
	Few there are who seem to care,
	And few there are who pray;
	Melt my heart and fill my life,
	Give me one soul to -- day.
}


verseTwo = \lyricmode {
	\set stanza = "2."
}


verseThree = \lyricmode {
	\set stanza = "3."
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
