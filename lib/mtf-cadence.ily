%%%% The stylesheet for MTF-CADENCE music notation font
%%%%
%%%% In order for this to work, this file's directory needs to 
%%%% be placed in LilyPond's path
%%%%
%%%% NOTE: If a change in the staff-size is needed, include
%%%% this file after it, like:
%%%%
%%%% #(set-global-staff-size 17)
%%%% \include "mtf-cadence.ily"
%%%%
%%%% Copyright (C) 2014-2016 Abraham Lee (tisimst.lilypond@gmail.com)

\version "2.19.12"

\paper {
  #(define fonts
    (set-global-fonts
    #:music "mtf-cadence"
    #:brace "mtf-cadence"
    #:factor (/ staff-height pt 20)
  ))
}

\layout {
  \override ChoirStaff.SystemStartBracket.padding = #0.5 % Default is 0.8
  \override StaffGroup.SystemStartBracket.padding = #0.5 % Default is 0.8
}
    