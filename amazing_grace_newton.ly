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
	c8( des) c2 ees8( c) ees2 des4 c2 des4 c2
	c8( des) c2 ees8( c) ees2 aes4 g2.~ g2
	g4 aes2 aes8( ees) ees2 des8( c) f2 des4 c2
	c8( des) c2 ees8( aes) g2 g4 ees2.~ ees2
}


tenor = \relative c' {
	\global
	\clef "bass"
	aes4 ees2 aes4 aes2 g4 aes2 aes4 aes2
	aes4 ees2 aes4 aes2 aes4 bes2.~ bes2
	ees4 c2 c8( aes) c2 aes4 aes2 aes 4 aes2
	aes4 aes2 aes8( c) ees2 des4 c2.~ c2
}


bass = \relative c {
	\global
	\clef "bass"
	aes4 aes2 aes4 aes2 ees'4 f2 des4 aes2
	aes4 aes2 aes4 aes'2 f4 ees2.~ ees2
	ees4 aes2 aes4 aes2 aes4 des,2 des4 aes2
	aes'4 f2 ees4 ees2 ees4 aes,2.~ aes2
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
