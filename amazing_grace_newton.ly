\version "2.18.2"

\header {
 	title = "Amazing Grace"
 	composer = "Traditional"
 	poet = "John Newton"
	copyright= \markup { "Public Domain" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
  	page-count = #1
}


global = {
 	\key aes \major
 	\time 3/4
	\set Timing.beamExceptions = #'()
	\set Timing.baseMoment = #(ly:make-moment 1/4)
	\set Timing.beatStructure = #'(1 1 1)
	\aikenHeads
  	\large
  	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	\set Staff.midiMaximumVolume = #1.0
 	\partial 4
}


lead = {
	\set Staff.midiMinimumVolume = #3.0
}


soprano = \relative c'' {
 	\global
	ees,8( f) aes2 c8( aes) c2 bes4 aes2 f4 ees2
	ees8( f) aes2 c8( aes) c2 bes8( c) ees2.~ ees2
	\bar "|" \break
	bes8( c) ees2 ees8( c) aes2 f8( ees) aes2 f4 ees2
	ees8( f) aes2 c8( aes) c2 bes4 aes2.~ aes2
	\bar "|."
}


alto = \relative c' {
	\global
	b4 b2 d4 d2 c4 b2 c4 b2
	b4 b2 d4 d2 g4 fis2.~ fis2
	fis4 g2 g8( d) d2 d4 c4.( d8) c4 b2
	d4 b2 d4 g2 fis4 d2.~ d2
}


tenor = \relative c' {
	\global
	\clef "bass"
	g4 d2 g4 g2 fis4 g2 g4 g2
	g4 d2 g4 g2 g4 a2.~ a2
	d4 b4.( g8) b( g) g2 g4 g2 e8( g8) g2
	g4 g2 g8( b) d2 c4 b2.~ b2
}


bass = \relative c {
	\global
	\clef "bass"
	g4 g2 g8( b) d2 d4 e2 c4 g2
	g4 g2 g8( b) g'2 e4 d2.~ d2
	d4 g2 g4 b,2 b4 c4.( b8) c4 g2
	b4 e2 e4 d2 d4 <g g,>2.~ <g g,>2
}


verseOne = \lyricmode {
	\set stanza = "1."
	A -- maz -- ing grace! how sweet the sound,
	That saved a wretch like me! __
	I once was lost, but now am found,
	Was blind, but now I see.
}


verseTwo = \lyricmode {
	\set stanza = "2."
	'Twas grace that taught my heart to fear,
	And grace my fears re -- lieved; __
	How pre -- cious did that grace ap -- pear
	The hour I first be -- lieved!
}


verseThree = \lyricmode {
	\set stanza = "3."
	Thru man -- y dan -- gers, toils and snares
	I have al -- read -- y come; __
	'Tis grace hath brought me safe thus far,
	And grace will lead me home.
}


verseFour = \lyricmode {
	\set stanza = "4."
	The Lord has pro -- mised good to me;
	His Word my hope se -- cures; __
	He will my Shield and Por -- tion be,
	As long as life en -- dures.
}


verseFive = \lyricmode {
	\set stanza = "5."
	Yes, when this flesh and heart shall fail,
	And mor -- tal life shall cease; __
	I shall pos -- sess, with -- in the veil,
	A life of joy and peace.
}


verseSix = \lyricmode {
	\set stanza = "6."
	The earth shall soon dis -- solve like snow;
	The sun for -- bear to shine; __
	But God, who called me here be -- low,
	Will be for -- ev -- er mine.
}


verseSeven = \lyricmode {
	\set stanza = "7."
	When we've been there ten thou -- sand years,
	Bright shin -- ing as the sun, __
	We've no less days to sing God's praise
	Than when we'd first be -- gun.
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
		\new Lyrics {
			\lyricsto "soprano" \verseSix
		}
		\new Lyrics {
			\lyricsto "soprano" \verseSeven
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
