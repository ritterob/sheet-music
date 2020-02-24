\version "2.18.2"

\header {
 	title = "Where He Leads Me I Will Follow"
 	composer = "John S. Norris"
 	poet = "E.W. Blandly"
	%meter = ""
	copyright = "Public Domain"
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
 	\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	c,8 f a4. a8 bes4. a8 a g~ g2
	c,8 e g4. f8 a4. g8 g8 f~ f2
	f8 a c4. c8 d4. c8 c bes~ bes2
	f8 g a8 c,4. a'8 c,4. 
	\time 2/4
	g' f8 
	\time 4/4
	f2.
	\bar "||" \break
	c8\mark "Refrain" f a4. a8 bes4. a8 a g~ g2
	c,8 e g4. f8 a4. g8 g8 f~ f2
	f8 a c4. c8 d4. c8 c bes~ bes2
	f8 g a8 c,4. a'8 c,4. 
	\time 2/4
	g' f8 
	\time 4/4
	f2.
	\bar "|."
}


alto = \relative c' {
	\global
	c8 c f4. f8 f4. f8 f e~ e2
	c8 c e4. f8 f4. e8 c c~ c2
	f8 f f4. f8 f4. f8 ees d~ d2
	d8 des c8 c4. c8 c4. c c8 c2.
	c8 c f4. f8 f4. f8 f e~ e2
	c8 c e4. f8 f4. e8 c c~ c2
	f8 f f4. f8 f4. f8 ees d~ d2
	d8 des c8 c4. c8 c4. c c8 c2.
}


tenor = \relative c' {
	\global
	\clef "bass"
	a8 a c4. c8 d4. c8 c c~ c2
	bes8 bes bes4. a8 c4. bes8 bes a~ a2
	a8 c a4. a8 bes4. a8 bes f~ f2
	f8 f f a4. f8 a4. bes a8 a2.
	a8 a c4. c8 d4. c8 c c~ c2
	bes8 bes bes4. a8 c4. bes8 bes a~ a2
	a8 c a4. a8 bes4. a8 bes f~ f2
	f8 f f a4. f8 a4. bes a8 a2.
}


bass = \relative c {
	\global
	\clef "bass"
	f8 f f4. f8 f4. f8 c c~ c2
	c8 c c4. c8 c4. c8 f f~ f2
	f8 f f4. f8 f4. f8 bes, bes~ bes2
	bes8 bes c c4. c8 c4. c f8 f2.
	f8 f f4. f8 f4. f8 c c~ c2
	c8 c c4. c8 c4. c8 f f~ f2
	f8 f f4. f8 f4. f8 bes, bes~ bes2
	bes8 bes c c4. c8 c4. c f8 f2.
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	I can hear my Sav -- ior call -- ing,
	I can hear my Sav -- ior call -- ing,
	I can hear my Sav -- ior call -- ing,
	“Take my cross and fol -- low, foll -- low Me.”
	Where He leads me I will fol -- low,
	Where He leads me I will fol -- low,
	Where He leads me I will fol -- low,
	I’ll go with Him, with Him all the way.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	I’ll go with Him throgh the gar -- den,
	I’ll go with Him throgh the gar -- den,
	I’ll go with Him throgh the gar -- den,
	I’ll go with Him, with Him all the way.
}


verseThree = \lyricmode {
	\set stanza = "3."
	I’ll go with Him through the judg -- ment,
	I’ll go with Him through the judg -- ment,
	I’ll go with Him through the judg -- ment,
	I’ll go with Him, with Him all the way.
}


verseFour = \lyricmode {
	\set stanza = "4."
	He will give me grace and glo -- ry,
	He will give me grace and glo -- ry,
	He will give me grace and glo -- ry,
	He’ll go with me, with me all the way.
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
