\version "2.18.2"

\header {
 	title = "Sing to the Lord"
 	composer = "R.R."
 	poet = "Rob Ritter"
	copyright = \markup { "Copyright" \char ##x00A9 "2003 by Rob Ritter" }
	tagline = ""
}


\paper {
	#(set-paper-size "letter")
	indent = 0
	page-count = #1
	print-page-number = "false"
}


global = {
 	\key aes \major
 	\time 6/4
	\aikenHeads
	\huge
	\override Score.BarNumber.break-visibility = ##(#f #f #f)
 	%\partial 4
}


soprano = \relative c'' {
 	\global
	aes2 aes8 aes aes4 bes c | des c  bes c2 bes8 c |
	des4 c bes c2 bes8 aes | bes4 ees d ees2. |
	aes,2 aes8 aes aes4 bes c | des c  bes c2 bes8 c |
	des4 c bes ees aes, g | aes2. b4\rest
	\bar "||"
	ees \mark Chorus c | f( ees8 des c4) bes des bes | ees( des8 c bes4) aes2 
	c4 | des( c) bes g g bes | c2( des4 ees)
	ees c | f( ees8 des c4) bes des bes | ees( des8 c bes4) aes2 
	c4 | des( c) bes g aes g | aes2.~ aes4	
	\bar "|."
}


alto = \relative c' {
	\global
	ees2 ees8 ees ees4 des c | f f f ees2 ees8 ees8 |
	f4 f f ees2 ees8 ees | f4 f f g2. |
	ees2 ees8 ees ees4 des c | f f f ees2 ees8 ees8 |
	f4 f f ees ees ees | ees2. s4
	%\bar "||" \break
	ees ees | f2. g4 g g | ees2. ees2
	ees4 | des2 des4 ees ees ees | ees2( f4 ees)
	ees ees | f2. g4 g g | ees2. c2
	c4 | des2 des4 ees ees ees | ees2.~ ees4
}


tenor = \relative c' {
	\global
	\clef "bass"
	c2 c8 c aes4 aes aes | aes aes aes aes2 aes8 aes |
	aes4 aes aes aes2 bes8 c | bes4 bes bes bes2. |
	c2 c8 c aes4 aes aes | aes aes aes aes2 aes8 aes |
	bes4 bes bes bes bes des | c2. s4 
	%\bar "||" \break
	c aes | des( bes aes) g bes ees | c2( des4) c2
	c4 | bes2 bes4 bes bes des | c2.~ c4
	c aes | des( bes aes) g bes ees | c2( des4) c2
	aes4 | bes2 bes4 bes bes des | c2.~ c4
}


bass = \relative c {
	\global
	\clef "bass"
	aes2 aes8 aes c4 bes aes | des des des aes2 aes8 aes |
	des4 des des aes2 aes8 aes | bes4 bes bes ees2. |
	aes,2 aes8 aes c4 bes aes | des des des aes2 aes8 aes |
	des4 f des ees ees ees | aes,2. d4\rest
	%\bar "||" \break
	aes c | des2. ees4 ees ees | aes,( c ees) aes,2
	aes4 | bes2 bes4 ees ees ees | aes,2.~ aes4
	aes c | des2. ees4 ees ees | aes,( c ees) f2
	c4 | bes2 bes4 ees ees ees | aes,2.~ aes4
}


verseOne = \lyricmode {
	\set stanza = "1."
	Sing to the Lord! Give Him ho -- nor and praise!
	Let our hearts glad -- ly raise Psalms of joy e -- ver -- more!
	Sing to the Lord! Lift His name up on high!
	Let the vaults of the sky ring with song!
}


verseTwo = \lyricmode {
	\set stanza = "2."
	Sing to the Lord! Raise to Heav -- en your voice!
	Clap your hands and re -- joice For the good He be -- stows!
	Sing to the Lord! Shout with glad -- ness and mirth!
	Let the ends of the earth ring with song!
	Al -- le -- lu -- ia! Al -- le -- lu -- ia!
	O sing we un -- to the Lord!
	Al -- le -- lu -- ia! Al -- le -- lu -- ia!
	O sing we un -- to the Lord!
}


verseThree = \lyricmode {
	\set stanza = "3."
	Sing to the Lord! For His mer -- cies are sure
	And His love doth en -- dure To the end of the age!
	Sing to the Lord! Whose sal -- va -- tion is free!
	Let the depths of the sea ring with song!
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
		
		\new Staff  \with {midiInstrument = #"acoustic grand"}<<
			\new Voice = "tenor" {\voiceThree \tenor}
			\new Voice = "bass" {\voiceFour \bass}
		>>
		
	>>
	
	\layout{}
	\midi{
		\tempo 2 = 90
	}
}
