\version "2.18.2"

\header {
 	title = "Friede auf Erden"
 	composer = ""
 	poet = ""
	%meter = ""
	%copyright = \markup { "Copyright" \char ##x00A9 "1988 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	%indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key f \major
 	\time 4/4
	%\aikenHeads
  	\huge
	%\set Timing.beamExceptions = #'()
	%\set Timing.baseMoment = #(ly:make-moment 1/4)
	%\set Timing.beatStructure = #'(1 1 1 1)
  	%\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #1.0
	\set Staff.midiInstrument = #"oboe"
}


"s1" = \relative c'' {
 	\global
	b4\rest e,2 d4 d e f d g f f2~ f4 e e d
	c' d a g g f ees d cis'( ees2) d,4 d2 c! b'4\rest c,2 d4 
}


"s2" = \relative c'' {
	\global
}


"a1" = \relative c' {
	\global
	
}


"a2" = \relative c' {
	\global
}


"t1" = \relative c' {
	\global
	\lead
	\clef "treble_8"
	a2 g g f e4 d a' c a2 f \break
	g4 a f g e d g fis g a a bes a2 bes a4 gis e bes' \break
}


"t2" = \relative c' {
	\global
	\lead
	\clef "treble_8"
}


"b1" = \relative c {
	\global
	\clef "bass"
}

"b2" = \relative c {
	\global
	\clef "bass"
}


\score{
	\new ChoirStaff <<
		\new Staff \with {midiInstrument = #"acoustic grand"} <<
			\new Voice = "s1" {\voiceOne \"s1"}
			\new Voice = "s2" {\voiceTwo \"s2"}
		>>
		
		\new Staff  \with {midiInstrument = #"acoustic grand"}<<
			\new Voice = "a1" {\voiceThree \"a1"}
			\new Voice = "a2" {\voiceFour \"a2"}
		>>
		
		\new Staff \with {midiInstrument = #"acoustic grand"} <<
			\new Voice = "t1" {\voiceOne \"t1"}
			\new Voice = "t2" {\voiceTwo \"t2"}
		>>
		
		\new Staff \with {midiInstrument = #"acoustic grand"} <<
			\new Voice = "b1" {\voiceOne \"b1"}
			\new Voice = "b2" {\voiceTwo \"b2"}
		>>
	>>
	
	\layout{}
	\midi{
		\tempo 4 = 88
	}
}
