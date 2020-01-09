\version "2.19.82"

\include "main-init.ily"

\setOption scholarly.annotate.export-targets #'(console)
%\setOption scholarly.annotate.use-colors ##f
%\setOption stylesheets.span.use-colors ##f

#(set-global-staff-size 21)


\paper {
  two-sided = ##t
  top-margin = 15
  bottom-margin = 15
  inner-margin = 15
  outer-margin = 15
  page-breaking = #ly:page-turn-breaking
  auto-first-page-number = ##t
  ragged-last-bottom = ##f
  ragged-bottom = ##f
}


\paper {
  bookTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5) %% this will change distance between title/subtitle and composer/arranger
    \column {
      \fill-line { \italic \fontsize #1 \fromproperty #'header:dedication }
      \fill-line { \bold \fontsize #4 \fromproperty #'header:title }
      \fill-line { \bold \fontsize #2 \fromproperty #'header:subtitle }
      \fill-line { \fontsize #1 \bold \fromproperty #'header:subsubtitle  }
      \fill-line {
        \fontsize #1 \fromproperty #'header:instrument
        \fontsize #1 \fromproperty #'header:composer
      }

      \fill-line {
        \fontsize #1 \fromproperty #'header:meter
        \fontsize #1 \fromproperty #'header:arranger
      }
      \fill-line {
        \null
        \fontsize #1 \fromproperty #'header:opus
      }
    }
  }
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5) %% this will change distance between title/subtitle and composer/arranger
    \column {
      \on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \fontsize #2 \fromproperty #'header:piece
      }
      \fill-line {
        \null
        \fontsize #-1 \fromproperty #'header:opus
        \null
      }
    }
  }
  print-page-number = ##t
  print-first-page-number = ##f
  evenHeaderMarkup = \markup {
    \on-the-fly #not-first-page
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \fromproperty #'page:page-number-string

      \null
    }
  }

  oddHeaderMarkup = \markup {
    \on-the-fly #not-first-page
    \fill-line {
      \null

      \on-the-fly \print-page-number-check-first
      \fromproperty #'page:page-number-string
    }
  }

  oddFooterMarkup = \markup {
    \column {
      \fill-line {
        \teeny \on-the-fly #part-first-page \fromproperty #'header:ismn
        \teeny \on-the-fly #part-first-page \fromproperty #'header:tagline
      }     
      \fill-line {
        \teeny \on-the-fly #part-first-page \fromproperty #'header:mm
        \teeny \on-the-fly #part-first-page \concat {
          \fromproperty #'header:title " – "
          \fromproperty #'header:instrument
        }
        \teeny \on-the-fly #part-first-page \fromproperty #'header:copyright
      }

      \fill-line {
        \teeny \on-the-fly #not-first-page \fromproperty #'header:ismn
        \teeny \on-the-fly #not-first-page \fromproperty #'header:tagline
      }
      
      \fill-line {
        \teeny \on-the-fly #not-first-page \fromproperty #'header:mm
        \teeny \on-the-fly #not-first-page \concat {
          \fromproperty #'header:title " – "
          \fromproperty #'header:instrument
        }
        \teeny \on-the-fly #not-first-page \fromproperty #'header:copyright
      }
    }
  }
}


\layout {
  \context {
    \Staff
    \consists "Page_turn_engraver"
    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
    #(set-accidental-style 'modern-cautionary)
    \override TupletBracket.bracket-visibility = #'if-no-beam
    %\override MultiMeasureRest.expand-limit = #1
    \override StaffSymbol.color = #(x11-color 'grey50)
    \override StaffSymbol.layer = #-1
  }
  \context {
    \Score
    %markFormatter = #format-mark-box-alphabet
    markFormatter = #format-mark-box-barnumbers
    skipBars = ##t
    \override BarNumber #'font-shape = #'italic
    \override MetronomeMark.Y-offset = #5
    \override RehearsalMark.Y-offset = #5

    scriptDefinitions = #(cons '("marcato" .
                                  ((avoid-slur . around)
                                   (padding . 0.20)
                                   (quantize-position . #f)
                                   (script-stencil . (feta . ("umarcato" .  "umarcato")))
                                   (side-relative-direction . -1))) default-script-alist)

  }
  \context {
    \DrumStaff
    \consists #Measure_counter_engraver
    \consists "Page_turn_engraver"
    \override MetronomeMark.padding = #3.5
    \override RehearsalMark.padding = #1.5
    \override RehearsalMark.self-alignment-X = #LEFT
    %\override MultiMeasureRest.expand-limit = #1
    %\override MultiMeasureRest #'minimum-length = #15
    \override Stem.direction = #UP
    \override TupletBracket.bracket-visibility = #'if-no-beam
  }

  \context {
    \ChoirStaff \RemoveEmptyStaves
    \override LyricText #'font-name = #"Minion Pro Cond"
    \override DynamicText.direction = #UP
    \override DynamicLineSpanner.direction = #UP
    % If only one non-empty staff in a system exists, still print the bracket
    \override SystemStartBracket.collapse-height = #1
    \override SystemStartBar.collapse-height = #1

    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
    #(set-accidental-style 'modern-cautionary)
  }
}

picc = "PICCOLO"
fl = "FLUTE"
flI = "FLUTE 1"
flII = "FLUTE 2"
ob = "OBOE"
obI = "OBOE 1"
obII = "OBOE 2"
