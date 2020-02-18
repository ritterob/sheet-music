\version "2.18.2"

\header {
 	title = "Flee As a Bird"
 	composer = "Spanish Air"
 	poet = "Mary Shindler"
	copyright= \markup { "Public Domain" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key e \minor
 	\time 4/4
	\aikenHeads
  	\large
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	%\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	e,4 b'8. b16 b4 c8. b16 b4.( a16 g) fis2
	e4 g8. g16 a4 ais8.( ais16) b2( fis4) r4
	\break
	e4 b'8. b16 b4 c8. b16 b4.( a16 g) fis2
	e4 g8. g16 fis4 b8. b16 e,2.
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
	e4
}


verseOne = \lyricmode {
	\set stanza = "1."
	Flee as a bird to your moun -- tain,
	thou who art wea -- ry_of sin;
	Go to the clear flow -- ing foun -- tain
	where you may wash and be clean.
	Haste, then, th’A -- ven -- ger is near thee;
	call, and the Sav -- ior will hear thee;
	He on His bos -- om will bear thee;
	O thou who art wea -- ry of sin,
	O thou who art wea -- ry of sin.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	He is the bountiful Giver,
	now unto Him draw near;
	Peace then shall flow like a ri -- ver,
	thou shalt be saved from thy fear.
	Hark! 'tis the Sav -- ior call -- ing!
	Haste! for the twi -- light is fall -- ing!
	Flee, for the night is appalling!
	And thou shalt be saved from thy fear.
	And thou shalt be saved from thy fear.
}


verseThree = \lyricmode {
	\set stanza = "3."
	He will pro -- tect thee for -- ev -- er,
	wipe ev -- ery fall -- ing tear;
	He will for -- sake thee, O nev -- er,
	shel -- tered so ten -- der -- ly there.
	Haste, then, the hours are fly -- ing,
	spend not the m -- oments in sigh -- ing,
	Cease from your sor -- row and cry -- ing:
	The Sav -- ior will wipe ev -- ery tear,
	The Sav -- ior will wipe ev -- ery tear.
}


verseFour = \lyricmode {
	\set stanza = "4."
	Come, then, to Je -- sus, Thy Sav -- ior,
	He will redeem thee from sin;
	Blest with a sense of His fa -- vor,
	make thee all-glorious with -- in!
	Call, for the Sav -- ior is near thee,
	wait -- ing in mercy to hear thee,
	He by His presence will cheer thee,
	O thou who art wea -- ry of sin.
	O thou who art wea -- ry of sin
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
		\tempo 4 = 60
	}
}
