\version "2.18.2"

\header {
 	title = "On Calv’ry’s Tree"
 	composer = "Traditional"
 	poet = "Rob Ritter"
	%meter = ""
	copyright = \markup { "Copyright" \char ##x00A9 "1988 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	%page-count = #1
	print-page-number = "false"
}


global = {
 	\key g \major
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
	g8( fis) e4 e e d g g a a b b a8( g) e4 d2.
	g8( fis) e4 e e d g g a a b b a8( g) e4 e2.
	b'4 d b b8( a) g4 a a b g b b a8( g) e4 d2.
	g8( fis) e4 e e d g g a a b b a8(g) e4 e2.
	\bar "|."
}


alto = \relative c' {
	\global
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
	On Cal -- v’ry’s tree Mes -- si -- ah hung,
	A world of grief to bear—
	No law tran -- gressed nor wrong He’d done,
	Yet God for -- sook Him there.
	For sin in -- car -- nate He be -- came,
	The vil -- est e -- vil, He—
	What bur -- den la -- den sore with blame
	Has He borne there for me.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	What mys -- t’ry on the cross laid bare,
	De -- spite my filth and shame,
	Could cause the Lamb to call me there,
	And there my soul re -- claim.
	What won -- drous Love of no -- blest worth
	Could har -- bor such a plan,
	That God, cre -- a -- tor of all earth
	Should die for sin -- ful man.
}


verseThree = \lyricmode {
	\set stanza = "3."
	But Death can -- not God’s will en -- slave
	Nor keep Him from His own—
	The Son is ris -- en from the grave
	And sits up -- on His throne.
	With grate -- ful hearts our voic -- es raise
	Thy Name, O Lord, to sing,
	And give Thee hon -- or, laud, and praise
	As most be -- fits a King.
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
