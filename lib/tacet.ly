%% http://lsr.di.unimi.it/LSR/Item?id=923
%=> http://lilypond.1069038.n5.nabble.com/long-tacets-td163629.html

% by P.P.Schneider on June 2014.

tacet =
#(define-music-function (parser location arg str) (number? string?)
   #{
      \compressFullBarRests
      \once\override MultiMeasureRest.expand-limit = #1
      \once\override MultiMeasureRest.minimum-length = #arg
      \once\override MultiMeasureRestNumber.font-name = "Vera Bold"
      \once\override MultiMeasureRestNumber.stencil =
        #(lambda (grob)(grob-interpret-markup grob
           (markup #:whiteout #:pad-markup .8 str)))
      \once\override MultiMeasureRest.layer = #-2
      \once\override MultiMeasureRestNumber.layer = #-1
      \once\override MultiMeasureRestNumber.Y-offset = #-.5
   #})

\layout {
  indent = 0
  ragged-right = ##f
}

{
  \tacet #100 "Tacet bis Ende" R1*10
  \bar "|."
}
