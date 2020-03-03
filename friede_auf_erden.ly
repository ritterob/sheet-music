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
	\set Score.markFormatter = #format-mark-numbers
	%\set Timing.beamExceptions = #'()
	%\set Timing.baseMoment = #(ly:make-moment 1/4)
	%\set Timing.beatStructure = #'(1 1 1 1)
  	%\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	%\set Staff.midiMinimumVolume = #1.0
	\set Staff.midiInstrument = #"oboe"
}


"s1" = \relative c'' {
 	\global
	b4\rest e,2 d4 d e f d g f f2~ f4 e e d
	c' d a g g f ees d cis'( ees2) d,4 d2 c! b'4\rest c,2 d4
	d ees ees d' \key d \major a1~ a4 a2 g4 g d' ais b c c2 b4
	b e b cis! d2. dis4 b4\rest e2 f4 e( a2) a,4 c( bes2) a4 a2. gis4 \breathe
}


"s2" = \relative c'' {
	\global
	\repeat unfold 4 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 6 {\skip 1}
}


"a1" = \relative c' {
	\global
	b'4\rest d,( c) bes bes c d c c d c e d e a, bes
	e f d e c d bes c g' fis e! fis g a a gis c,!2 b'2\rest
	b1\rest \key d \major cis,4( d) dis( e) e d! cis d g2( fis4) f(~ f e) d( dis)
	g2( fis!4) eis e!( dis) fis( eis) fis g! g gis a( g!2) fis4 g2. f4  cis!( fis!2) b,4 \breathe
}


"a2" = \relative c' {
	\global
	\repeat unfold 4 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 6 {\skip 1}
}


"t1" = \relative c' {
	\global
	\lead
	\clef "treble_8"
	a2 g g f e4 d a' c a2 f \break
	g4 a f g e d g fis g a a bes a2 bes a4 gis e! bes' \break
	bes( c!) bes( g) \bar "||" \key d \major \mark \default g2. b4\rest b1\rest e,4( fis) g( gis) a g! fis a \break
	g( b) gis a ais2 a d!4 cis c b e2 dis d!4 dis e f e( dis) d2 \breathe \bar "||"
}


"t2" = \relative c' {
	\global
	\lead
	\clef "treble_8"
	\repeat unfold 4 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 3 {\skip 1} c2 b \repeat unfold 2 {\skip 1}
}


"b1" = \relative c {
	\global
	\clef "bass"
	d1\rest d4\rest bes2 a4 a bes c a d c c bes
	d c c bes a bes c a ees' d c bes8( c) d2 e! f4 d bes!  aes
	g bes! a'( ees) \key d \major e!2( cis! fis b,) e( cis fis b,)
	e( cis fis b,) e( cis fis b,) e( cis fis b,) \breathe
}


"b2" = \relative c {
	\global
	\clef "bass"
	\repeat unfold 4 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 5 {\skip 1}
	\repeat unfold 6 {\skip 1}
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
		\tempo 4 = 76
	}
}
