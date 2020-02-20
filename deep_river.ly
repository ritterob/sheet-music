\version "2.18.2"

\header {
 	title = "Deep River"
 	composer = "Traditional Spritual"
 	poet = "Anon."
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


soprano = \relative c'' {
 	\global
	fis,2(~ fis8 e d4) e b2 d4 d d d'4. b8 a4 fis2( e4)
	fis2(~ fis8 e d4) e b d4. d8 d8. d16 d4 d8 b a b d4 d2.
	b'8 b4 cis8 d( cis) b4 a( fis2) a8 a b4( d) cis( b) a( fis2)
	a4 fis'2(~ fis8 e) d4 e( b2) d4 d( a2) g4 fis2
	b4( a) fis2(~ fis8 e d4) e b d4. d8 d8. d16 d4 d8 b a b d4 d2.
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
	d1 g,4 g2 g4 a a b4. b8 fis'4 fis( g a,)
	d1 g,4 g bes4. bes8 a8. a16 a4 a8 a a a d4 d2.
}


% Some useful characters: – — “ ” ‘ ’


verseOne = \lyricmode {
	Deep ri -- ver, my home is o -- ver Jor -- dan.
	Deep ri -- ver, Lord, I want to cross o -- ver in -- to camp -- ground.
	Oh, don’t you want to go to that gos -- pel feast,
	that pro -- mised land where all is peace?
	Oh, deep ri -- ver, Lord, I want to cross o -- ver in -- to camp -- ground.
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
		\tempo 4 = 70
	}
}
