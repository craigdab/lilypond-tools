\version "2.19.11"

\include "main-init.ily"
\include "merge-rests.ily"

\setOption scholarly.annotate.export-targets #'("latex")

\paper {
  two-sided = ##t
  top-margin = 20
  bottom-margin = 20
  inner-margin = 20
  outer-margin = 20
}

\paper {
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 7) %% this will change distance between title/subtitle and composer/arranger
    \column {
      \fill-line { \italic \fontsize #6 \fromproperty #'header:dedication }
      \fill-line { \bold \fontsize #10 \fromproperty #'header:title }
      \fill-line { \bold \fontsize #8 \fromproperty #'header:subtitle }
      \fill-line { \fontsize #4 \bold \fromproperty #'header:subsubtitle  }
      \fill-line {
        \fontsize #4 \fromproperty #'header:instrument
        \fontsize #4 \fromproperty #'header:composer
      }

      \fill-line {
        \fontsize #4 \fromproperty #'header:meter
        \fontsize #4 \fromproperty #'header:arranger
      }
    }
  }
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 10) %% this will change distance between title/subtitle and composer/arranger
    \column {
      \on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \fontsize #6 \fromproperty #'header:piece
        \fromproperty #'header:opus
      }
    }
  }
  print-page-number = ##t
  print-first-page-number = ##f
  oddHeaderMarkup = \markup {
    \fill-line {
      \null
      \fontsize #4 \on-the-fly #print-page-number-check-first
      \fromproperty #'page:page-number-string
    }
  }
  evenHeaderMarkup = \markup {
    \fill-line {
      \fontsize #4 \on-the-fly #print-page-number-check-first
      \fromproperty #'page:page-number-string
      \null
    }
  }
}

\layout {
  \context {
    \Dynamics
    \consists #Measure_counter_engraver
    \override MeasureCounter.direction = #DOWN
    \override MeasureCounter.font-encoding = #'latin1
    \override MeasureCounter.font-shape = #'italic
    \override MeasureCounter.font-size = 3
    % to control the distance of the Dynamics context from the staff:
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #3
  }

  \context {
    \Staff
    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
    #(set-accidental-style 'modern-cautionary)
  }

  \context {
    \Score
    \remove "Bar_number_engraver"
    markFormatter = #format-mark-box-alphabet
    \override MetronomeMark #'font-size = #5
    \override MetronomeMark.padding = #3
    \override MetronomeMark.extra-spacing-width = #'(-0.5 . 3.0)
    \override MetronomeMark.extra-spacing-height = #'(4 . 4)
    \override RehearsalMark.padding = #2
    \override RehearsalMark #'font-size = #5
    \override RehearsalMark.extra-spacing-width = #'(-0.5 . 0.5)
    \override RehearsalMark.extra-spacing-height = #'(4 . 4)
    \override RehearsalMark.self-alignment-X = #LEFT
  }

  \context {
    \ChoirStaff
    \override LyricText #'font-name = #"Minion Pro Cond"
    \override DynamicText.direction = #UP
    \override DynamicLineSpanner.direction = #UP
  }
}
