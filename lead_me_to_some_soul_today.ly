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


soprano = \transpose f g {
	\relative c'' {
 		\global
		f,4 a a4. g8 f4 bes bes4. d,8
		c4 f a c g a g2
		f4 a a4. g8 f4 bes bes4. d,8
		c4 a' g4. a8 f2. b4\rest
		f4 f g8( f4) g8 a4 a f4. f8
		g4 g a8( g4) a8 g2. b4\rest
		f4 a a4. g8 f4 bes bes4. d,8
		c4 a' g4. a8 f2. b4\rest
		\bar "|."
	}
}


alto = \transpose f g {
	\relative c' {
		\global
		c4 f f4. ees8 d4 d d4. bes8
		a4 c f f e f e2
		c4 f f4. ees8 d4 d d4. gis,8
		a4 c bes4. c8 a2. s4
		d4 d d4. des8 c4 c c4. c8
		d4 d d4. d8 e4 d c s
		c4 f f4. ees8 d4 d d4. bes8
		a( c) f4 e4. e8 c2. s4
	}
}


tenor = \transpose f g {
	\relative c' {
		\global
		\clef "bass"
		a4 c c4. a8 bes4 f f4. f8
		f4 a c a c c c( bes)
		a c c4. a8 bes4 f f4. f8
		f4 f e4. e8 f2. s4
		bes4 bes bes4. f8 f4 f a4. c8
		b4 b b4. b8 c4 b bes s4
		a4 c c4. a8 bes4 f f4. f8
		f( a) c4 bes4. c8 a2. s4
	}
}


bass = \transpose f g {
	\relative c {
		\global
		\clef "bass"
		f4 f f4. f8 bes,4 bes bes4. d8
		f4 f f f c c c2
		f4 f f4. f8 bes,4 bes bes4. b8
		c4 c c4. c8 f2. d4\rest
		bes4 bes bes4. bes8 f'4 f f4. a8
		g4 g g4. g8 c,4 d e d\rest
		f4 f f4. f8 bes,4 bes bes4. bes8
		c4 c c4. c8 <f f,>2. d4\rest
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


splitText = \lyricmode {
	\repeat unfold 41 {\skip 1} (who pray;)
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
			\lyricsto "alto" \splitText
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
		\tempo 4 = 76
	}
}
