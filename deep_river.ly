\version "2.18.2"

\header {
 	title = "Deep River"
 	composer = "African-American Spritual"
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
	\bar "|."
}


alto = \relative c' {
	\global
	d4( cis c2) b4 b2 bes4 a a d4. d8 cis4 cis( b cis)
	d( cis c2) b4 b gis4. gis8 a8. a16 a4 b8 b a b b4 a2.
	d8 d4 d8 fis4 d cis2. fis8 fis fis2 fis fis2.
	g4 fis2. fis4 g2. eis4 fis2. e!4 d2
	d4( cis) d( cis c2) b4 b gis4. gis8 a8. a16 a4 b8 b a b b4 a2.
}


tenor = \relative c' {
	\global
	\clef "bass"
	a2(~ a8 g fis4) d d( e) e fis fis fis4. fis8 a4 a( g2)
	a(~ a8 g fis4) d e f4. f8 fis!8. fis16 fis4 g8 g a g g4 fis2.
	fis8 fis4 fis8 b4 fis a2. cis8 cis d2 e4( d) cis( a2)
	cis4 a( b c) c b( d2) b4 a( d2) cis4 b2
	g a(~ a8 g fis4) d e f4. f8 fis!8. fis16 fis4 g8 g a g g4 fis2.
}


bass = \relative c {
	\global
	\clef "bass"
	d1 g,4 g2 g4 a a b4. b8 fis'4 fis( g a,)
	d1 g,4 g bes4. bes8 a8. a16 a4 a8 a a a d4 d2.
	b8 b4 b8 b4 b fis'2. fis8 fis b2 b fis2.
	e4 d2. d4 g2. gis4 a2. ais4 b2
	e,4( a,) d1 g,4 g bes4. bes8 a8. a16 a4 a8 a a a d4 d2.
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
