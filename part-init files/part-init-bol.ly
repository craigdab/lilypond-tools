\version "2.19.11"

\include "main-init.ily"

\setOption scholarly.annotate.print ##f

\paper {
  two-sided = ##t
  top-margin = 20
  bottom-margin = 20
  inner-margin = 20
  outer-margin = 20
  page-breaking = #ly:page-turn-breaking
  auto-first-page-number = ##t
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
    }
  }
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 3.5) %% this will change distance between title/subtitle and composer/arranger
    \column {
      \on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \fontsize #2 \fromproperty #'header:piece
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
        %% Copyright header field only on first page in each bookpart.
        \on-the-fly #part-first-page \fromproperty #'header:copyright
      }

      \fill-line {
        \on-the-fly #not-first-page \fromproperty #'header:mm
        \on-the-fly #not-first-page \concat {
          \fromproperty #'header:title " - "
          \fromproperty #'header:instrument
        }
        \on-the-fly #not-first-page \italic { maximesmusic.com }
      }
      \fill-line {
        %% Tagline header field only on last page in the book.
        \on-the-fly #last-page \fromproperty #'header:tagline
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

    \override MultiMeasureRest.expand-limit = #1

    %\override MultiMeasureRest #'minimum-length = #10

    %\override Hairpin.minimum-length = #7

    %\override StaffSymbol.color = #(x11-color 'grey50)
    %\override StaffSymbol.layer = #-1

    %\override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 12)

    % if cresc spanners are too long
    % \override DynamicTextSpanner.style = #'none

    % if dynamics are hitting barline in score
    % \override DynamicText.extra-spacing-width = ##f

    %\override RestCollision.positioning-done = #merge-rests-on-positioning
  }
  \context {
    \Score
    %markFormatter = #format-mark-box-alphabet
    markFormatter = #format-mark-box-barnumbers
    skipBars = ##t
    \override BarNumber #'font-shape = #'italic

    %\override MetronomeMark.padding = #3.5
    % \override MetronomeMark.extra-spacing-width = #'(-0.5 . 5.0)
    % \override MetronomeMark.extra-spacing-height = #'(4 . 4)
    \override RehearsalMark.self-alignment-X = #LEFT

    % \override RehearsalMark.padding = #3
    % \override RehearsalMark.extra-spacing-width = #'(-0.5 . 0.5)
    % \override RehearsalMark.extra-spacing-height = #'(4 . 4)

    %\override MetronomeMark.break-align-symbols = #'()
    %\override MetronomeMark.X-offset = #2.5

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
    % \override MetronomeMark.padding = #10
    % \override MetronomeMark.extra-spacing-width = #'(-0.5 . 5.0)
    % \override MetronomeMark.extra-spacing-height = #'(4 . 4)

    % \override RehearsalMark.padding = #2
    % \override RehearsalMark.extra-spacing-width = #'(-0.5 . 0.5)
    % \override RehearsalMark.extra-spacing-height = #'(4 . 4)
    \override RehearsalMark.self-alignment-X = #LEFT

    \override MultiMeasureRest.expand-limit = #1
    \override MultiMeasureRest #'minimum-length = #15
    %\override Hairpin.minimum-length = #7

    % \override MetronomeMark.padding = #4
    \override Stem.direction = #UP
  }

  \context {
    \ChoirStaff
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

  % \context {
  %    \Voice
  %   \consists #mmr-range-engraver
  %   printMmrRange = ##t
  % }
}
