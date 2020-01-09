\version "2.19.15"

#(define-markup-command (arrow-at-angle layout props angle-deg length fill)
   (number? number? boolean?)
   (let* (
           (PI-OVER-180 (/ (atan 1 1) 34))
           (degrees->radians (lambda (degrees) (* degrees PI-OVER-180)))
           (angle-rad (degrees->radians angle-deg))
           (target-x (* length (cos angle-rad)))
           (target-y (* length (sin angle-rad))))
     (interpret-markup layout props
       (markup
        #:translate (cons (/ target-x 2) (/ target-y 2))
        #:rotate angle-deg
        #:translate (cons (/ length -2) 0)
        #:concat (#:draw-line (cons length 0)
                   #:arrow-head X RIGHT fill)))))


splitStaffBarLineMarkup = \markup \with-dimensions #'(0 . 0) #'(0 . 0) {
  \combine
  \arrow-at-angle #45 #(sqrt 8) ##t
  \arrow-at-angle #-45 #(sqrt 8) ##t
}

splitStaffBarLine = {
  \once \override Staff.BarLine.stencil =
  #(lambda (grob)
     (ly:stencil-combine-at-edge
      (ly:bar-line::print grob)
      X RIGHT
      (grob-interpret-markup grob splitStaffBarLineMarkup)
      0))
  \break
}

convDownStaffBarLine = {
  \once \override Staff.BarLine.stencil =
  #(lambda (grob)
     (ly:stencil-combine-at-edge
      (ly:bar-line::print grob)
      X RIGHT
      (grob-interpret-markup grob #{
        \markup\with-dimensions #'(0 . 0) #'(0 . 0) {
          \translate #'(0 . -.13)\arrow-at-angle #-45 #(sqrt 8) ##t
        }#})
      0))
  \break
}

convUpStaffBarLine = {
  \once \override Staff.BarLine.stencil =
  #(lambda (grob)
     (ly:stencil-combine-at-edge
      (ly:bar-line::print grob)
      X RIGHT
      (grob-interpret-markup grob #{
        \markup\with-dimensions #'(0 . 0) #'(0 . 0) {
          \translate #'(0 . .14)\arrow-at-angle #45 #(sqrt 8) ##t
        }#})
      0))
  \break
}


\paper {
  ragged-right = ##t
  short-indent = 10\mm
}

separateSnaredrums = {
  \set Staff.instrumentName = "Sn. Dr. 2"
  \set Staff.shortInstrumentName = "Sn. Dr. 2"
  \splitStaffBarLine
  \change Staff = "up"
}
convSnaredrums = {
  \convDownStaffBarLine
  \change Staff = "shared"
  \set Staff.instrumentName = "Sn. Dr. 1.2"
  \set Staff.shortInstrumentName = "Sn. Dr. 1.2"
}

snaredrumI = {
  \repeat unfold 4 f''2
  \separateSnaredrums
  \repeat unfold 4 g''2
  \convSnaredrums
  \repeat unfold 4 c''2
}

snaredrumII = {
  s1*2
  \repeat unfold 4 b'2
  \convUpStaffBarLine
  s1*2
}


ten = {
  \voiceOne
  \repeat unfold 4 c'2
  \repeat unfold 4 d'2
  \repeat unfold 4 c'2
}
bas = {
  \voiceTwo
  \repeat unfold 4 f2
  \repeat unfold 4 g2
  \repeat unfold 4 c2
}

\score {
  <<
    \new StaffGroup = "percussion" <<
      \new Staff = up \with {
        instrumentName = "Sn. Dr. 1"
        shortInstrumentName = "Sn. Dr. 1"
      }
      {
        s1*4
      }

      \new Staff = shared \with {
        instrumentName = "Sn. Dr. 1.2"
        shortInstrumentName = "Sn. Dr. 1.2"
      }
      <<
        \new Voice = snI \snaredrumI
        \new Voice = snII \snaredrumII
      >>

      \new Staff = men \with {
        instrumentName = "T B"
        shortInstrumentName = "T B"
      }
      <<
        \clef F
        \new Voice = ten \ten
        \new Voice = bas \bas
      >>
    >>
  >>

  \layout {
    \context {
      \Staff \RemoveEmptyStaves
      \override VerticalAxisGroup.remove-first = ##t
    }
  }
}
