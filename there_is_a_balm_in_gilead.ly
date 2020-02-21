\version "2.18.2"

\markup {\magnify #1.8 \bold "21"}

\header {
 	title = "There Is a Balm in Gilead"
 	composer = "African-American Spiritual"
 	poet = ""
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
 	\partial 2
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	a8( \mark Refrain g) a g f2. c4 f8 g a2f4 a4. a8 bes4 a g2(bes)
	\time 2/4 a8( g) a g
	\time 4/4
	f2. c4 f8 g a2 f4 a4. f8 a4 g f2 ^\markup {\italic "Fine"}
	\bar "|." %\break
	b4\rest f8( f) a4. f8 a4 a bes c2 bes8( bes) a4 a c a g2.
	f8( f) a4. f8 a4 a bes c2 bes4 a4. f8 a4 g f2( bes)
	\once \override Score.RehearsalMark.break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark.self-alignment-X = #RIGHT
	\mark \markup {\italic "To Refrain"}
	\bar "||"
}


alto = \relative c' {
	\global
	f4 f8 d c2. bes4 c8 c f2 f4 f4. f8 f4 f e1
	e4 e8 e c2. c4 f8 f f2 f4 f4. f8 e4 e c2
	s4 c8( c) f4. c8 f4 f f f2 f8( f) f4 f f f e2.
	d8( d) f4. f8 f4 f g a2 g4 f4. f8 e4 e d2( f)
}


tenor = \relative c' {
	\global
	\clef "bass"
	c8( bes) c bes  a2. g4 a8 bes c2 a4 c4. c8 d4 c bes2( d)
	c8( bes) c bes a2. bes4 a8 bes c2 bes4 c4. a8 c4 bes a2
	s4 a8( a) c4. a8 c4 c g a2 d8( d) c4 c c c c2.
	bes8( bes) c4. a8 c4 c d ees2 d4 c4. a8 c4 bes a2( d)
}


bass = \relative c {
	\global
	\clef "bass"
	f4 f8 f f2. f4 f8 f f2 f4 f4. f8 f4 f c1
	c4 c8 c f2. g4 f8 f f2 d4 c4. c8 c4 c <f f,>2
	d4\rest f8( f) f4. f8 f4 f f f2 f8( f) f4 f a f c2.
	c8( c) f4. f8 f4 f f f2 bes,4 c4. c8 c4 c d2( bes)
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	There is a balm in Gil -- e -- ad to make the wound -- ed whole,
	there is a balm in Gil -- e -- ad to heal the sin– sick soul.
	\set stanza = "1."
	Some -- times I feel dis -- cour -- aged and think my work’s in vain,
	but then the Ho -- ly Spi -- rit re -- vives my soul a -- gain.
}


verseTwo = \lyricmode {
	\repeat unfold 28 {\skip 1}
	\set stanza = "2."
	If_you can -- not sing like an -- gels, if_you can -- not preach like Paul,
	you_can tell the love of Je -- sus, and say, “He died for all.”
}


verseThree = \lyricmode {
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
		\tempo 4 = 76
	}
}
