\version "2.18.2"

\header {
 	title = "The Lord’s My Shepherd"
 	composer = "J.L. Macbeth Bain"
 	poet = "Scottish Psalter"
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
 	\key d \major
 	\time 3/2
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
	d,2 fis4 a d2 a  b4 d a2 g fis4 d d2 cis d1
	d2 fis4 a d2 a  b4 d a2 g fis4 d d2 cis d1
	e2 fis4 d d2 e fis4 d d2 e fis4 a d2 d d1
	\bar "|."
}


alto = \relative c' {
	\global
	d2 d4 cis d2 fis a4 g fis2 d4( e) d d g,2 a a1
	d2 d4 d fis2 fis d4 fis e2 g d4 d a2 a a1
	cis2 d4 d d2 b4( cis) d d b2 cis d4 d fis( g) a( g) fis1
}


tenor = \relative c' {
	\global
	\clef "bass"
	fis,2 a4 g a2 d4( cis) b g a2 b a4 fis e2 e fis1
	fis2 a4 fis b2 cis b4 b cis2 d d4 b a2 g fis1
	a2 a4 fis a2 g fis4 fis fis2 a a4 fis b2 b a1
}


bass = \relative c {
	\global
	\clef "bass"
	d2 d4 e fis2 d g,4 b d2 b4( cis) d d e2 a, d1
	d2 d4 cis b2 fis' g4 g a2 b a4 g fis2 e d1
	a2 d4 d fis2 e b4 b b2 a d4 d b2 g <d d'>1
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	\set stanza = "1."
	The Lord’s my shep -- herd; I’ll not want.
	He makes me down to lie
	In pas -- tures green; He lead -- eth me
	The qui -- et wa -- ters by.
	He lead -- eth me, he lead -- eth me
	The qui -- et wa -- ters by.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	My soul He doth re -- store a -- gain,
	And me to walk doth make
	With -- in the paths of righ -- teous -- ness,
	E’en for His own name’s sake.
	With -- in the paths of righ -- teous -- ness,
	E’en for His own name’s sake.
}


verseThree = \lyricmode {
	\set stanza = "3."
	Yea, though I walk in death’s dark vale,
	Yet will I fear no ill;
	For Thou art with me, and Thy rod
	And staff me com -- fort still;
	For Thou art with me, and Thy rod
	And staff me com -- fort still.
}


verseFour = \lyricmode {
	\set stanza = "4."
	My ta -- ble Thou hast fur -- nish -- ed
	In pres -- ence of my foes;
	My head Thou dost with oil a -- noint,
	And my cup o -- ver -- flows.
	My head Thou dost with oil a -- noint,
	And my cup o -- ver -- flows.
}
verseFive = \lyricmode {
	\set stanza = "5."
	Good -- ness and mer -- cy all my life
	Shall sure -- ly fol -- low me,
	And in God’s house for ev -- er -- more
	My dwell -- ing place shall be.
	And in God’s house for ev -- er -- more
	My dwell -- ing place shall be.
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
		\tempo 2 = 80
	}
}
