\version "2.19.83"

%% define how to format `start' and `stop'
%% for `MultiMeasureRestNumber' in the engraver
%% TODO find a method to set the values for `translate-scaled'
formatMMRNumber =
#(define-scheme-function (start stop)(integer? integer?)

#{
  \markup
    \column {
       \halign #0 #(number->string (- stop start))
%       %% value found by try and error
       \translate-scaled #'(0 . -6.5)
       \with-dimensions #empty-interval #empty-interval
       \halign #0
       \normal-text
       \fontsize #-2
       \line {
         #(number->string (1+  start))
         " - "
         #(number->string stop)
       }
    }
#})


%% TODO
%% I didn't manage to _create_ a MultiMeasureRestText-grob via
%% `ly:engraver-make-grob'
%% How to do?
%% It worked with simple TextScript ...
#(define (mmr-range-engraver context)
"Print the range of a @code{MultiMeasureRest}, if the context-property
@code{printMmrRange} is set @code{#t}."
  (let ((m-m-r-print '()))
    `((acknowledgers
        (multi-measure-interface
         . ,(lambda (engraver grob source-engraver)
            (if (eq? (grob::name grob) 'MultiMeasureRestNumber)
                (let* ((details (ly:grob-property grob 'details))
                       (print-range? (assoc-get 'print-range details)))
                  (set! m-m-r-print
                    (cons (cons grob print-range?) m-m-r-print)))))))
      (finalize
        .
        ,(lambda (trans)
          (let* ((timeSignatureFraction
                   (ly:context-property context 'timeSignatureFraction))
                 (fraction
                   (/ (car timeSignatureFraction) (cdr timeSignatureFraction))))

          (for-each
            (lambda (mmr)
              (if (and (cdr mmr) (not (null? (cdr mmr))))
                  (let* ((m-m-r-start
                           (/ (ly:moment-main
                                (grob::when (ly:spanner-bound (car mmr) LEFT)))
                              fraction))
                         (m-m-r-stop
                           (/ (ly:moment-main
                                (grob::when (ly:spanner-bound (car mmr) RIGHT)))
                              fraction)))
                    (ly:grob-set-property! (car mmr) 'text
                      (formatMMRNumber m-m-r-start m-m-r-stop)))))
            m-m-r-print)
          (set! m-m-r-print '())))))))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EXAMPLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{

\layout {
  \override Score.BarNumber.break-visibility = ##(#t #t #t)
}

\score {
  {
    \time 3/4
    c'2.
    \compressFullBarRests
    R2.*14
    c'2.
    \once \override MultiMeasureRestNumber.details.print-range = ##f
    R2.*15
    c'2.
    R2.*15
    c'2.
  }
  \layout {
    \context {
      \Voice
      \consists #mmr-range-engraver
      \override MultiMeasureRestNumber.details.print-range = ##t
    }
  }
}

\score {
  {
    \time 3/4
    c'2.
    \compressFullBarRests
    R2.*14
    c'2.
    \once \override MultiMeasureRestNumber.details.print-range = ##t
    R2.*15
    c'2.
    R2.*15
    c'2.
  }
  \layout {
    \context {
      \Voice
      \consists #mmr-range-engraver
      \override MultiMeasureRestNumber.details.print-range = ##f
    }
  }
}

\score {
  {
    \time 3/4
    c'2.
    \compressFullBarRests
    R1*3/4*14
    c'2.
  }
  \layout {
    \context {
      \Voice
      \consists #mmr-range-engraver
      \override MultiMeasureRestNumber.details.print-range = ##t
    }
  }
}

\score {
  {
    c'1
    \compressFullBarRests
    R1*14
    c'1
  }
  \layout {
    \context {
      \Voice
      \consists #mmr-range-engraver
      \override MultiMeasureRestNumber.details.print-range = ##t
    }
  }
}

\score {
  {
    \time 5/8
    c'2 c'8
    \compressFullBarRests
    R1*5/8*14
    c'2 c'8
    R1*5/8*13
    c'2 c'8
  }
  \layout {
    \context {
      \Voice
      \consists #mmr-range-engraver
      \override MultiMeasureRestNumber.details.print-range = ##t
    }
  }
}

%}