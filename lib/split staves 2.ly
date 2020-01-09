\version "2.19.15"

\header {
  texidoc = "The @code{VerticalAxisGroup.remove-layer}
property can be used for typesetting temporary divisi staves where
the switch to split staves is done only at line breaks such that all
complex passages are rendered in separate staves."
}

boring = \set Staff.keepAliveInterfaces = #'()
tricky = \unset Staff.keepAliveInterfaces

snaredrumI=\relative d' {
  \boring 
  \repeat unfold 100 d4
  \tricky 
  <d g'>2
  \boring 
  \repeat unfold 98 d4
  \bar "|."
}

snaredrumII=\relative g {
  \boring 
  \repeat unfold 100 g4
  \tricky 
  <g d'>2
  \boring 
  \repeat unfold 98 g4
  \bar "|."
}

\score {
  \new StaffGroup \with { \consists "Keep_alive_together_engraver" }
  <<
    \new Staff \with {
      instrumentName = "Snare Drum 1"
      shortInstrumentName = "Sn. Dr. 1"
      \override VerticalAxisGroup.remove-empty = ##t
      \override VerticalAxisGroup.remove-first = ##t
      \override VerticalAxisGroup.remove-layer = 1
    }
    \snaredrumI
    
    \new Staff \with {
      instrumentName = "Snare Drum 2"
      shortInstrumentName = "Sn. Dr. 2"
      \override VerticalAxisGroup.remove-empty = ##t
      \override VerticalAxisGroup.remove-first = ##t
      \override VerticalAxisGroup.remove-layer = 1
    }
    \snaredrumII
    
    \new Staff \with {
      instrumentName = "Snare Drum 1.2"
      shortInstrumentName = "Sn. Dr. 1.2"
      \override VerticalAxisGroup.remove-layer = 2
    }
    <<  \snaredrumI \\ \snaredrumII  >>
  >>

  \layout {
    short-indent = 2\cm
    indent = 3\cm
  }
}