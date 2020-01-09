\version "2.19.36"

\score {
  \relative c'
  <<
    \new Staff {
      <<
        \new Voice \with {
          \consists Mark_engraver
          \consists "Staff_collecting_engraver"
        }
        { \tempo "Adagio"
          c4 d e f 
          \mark \markup { \box A } 
          c4 d e f 
        }
        \new Voice \with {
          \consists Mark_engraver
          \consists "Staff_collecting_engraver"
          %\override RehearsalMark.direction = #UP
          \override RehearsalMark.alignment = #LEFT
        }
        { 
          s4 s s s
          \mark "INTRODUZIONE (Nacht)"
          s4 s s s 
        }
      >>
    }
  >>
  \layout {
    \context {
      \Score
      \remove "Mark_engraver"
      \remove "Staff_collecting_engraver"
    }
  }
}