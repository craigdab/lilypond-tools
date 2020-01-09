\version "2.19.82"

\include "main-init.ily"

#(set-global-staff-size 8)

\paper {
  two-sided = ##t
  top-margin = 10
  bottom-margin = 10
  inner-margin = 20
  outer-margin = 20
  page-breaking = #ly:optimal-breaking
  max-systems-per-page = 1
  ragged-last-bottom = ##f
  ragged-bottom = ##f
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
      \fill-line {
        \null
        \fontsize #4 \fromproperty #'header:opus
      }
    }
  }
  scoreTitleMarkup = \markup {
    \override #'(baseline-skip . 10) %% this will change distance between title/subtitle and composer/arranger
    \column {
      \on-the-fly \print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        \fontsize #6 \fromproperty #'header:piece
      }
      \fill-line {
        \fontsize #4 \raise #4 \fromproperty #'header:opus
      }
    }
  }
  print-page-number = ##t
  print-first-page-number = ##f
  evenHeaderMarkup = \markup {
    \on-the-fly #not-first-page
    \fill-line {
      \on-the-fly \print-page-number-check-first
      \fontsize #4 \fromproperty #'page:page-number-string
      \null
    }
  }

  oddHeaderMarkup = \markup {
    \on-the-fly #not-first-page
    \fill-line {
      \null
      \on-the-fly \print-page-number-check-first
      \fontsize #4  \fromproperty #'page:page-number-string
    }
  }

  %  evenFooterMarkup = \markup {
  %   \on-the-fly #not-first-page
  %    \fill-line {
  %      \fromproperty #'header:mm
  %      \concat { \fromproperty #'header:title " - "
  %      \fromproperty #'header:instrument }
  %      \italic { maximesmusic.com }
  %    }
  %  }

  % oddFooterMarkup = \markup {
  %    \on-the-fly #not-first-page
  %    \fill-line {
  %      \fromproperty #'header:mm
  %      \concat { \fromproperty #'header:title " - "
  %      \fromproperty #'header:instrument }
  %      \italic { maximesmusic.com }
  %    }
  %  }


  oddFooterMarkup = \markup {
    \column {
      \fill-line {
        %% Copyright header field only on first page in each bookpart.
        \tiny \on-the-fly #part-first-page \fromproperty #'header:ismn
        \tiny \on-the-fly #part-first-page \fromproperty #'header:copyright
        \tiny \on-the-fly #part-first-page \fromproperty #'header:tagline
      }
      
      \fill-line {
        \tiny \on-the-fly #part-first-page \fromproperty #'header:mm
        \tiny \on-the-fly #part-first-page { "Published in Australia by Maxime's Music" }
        \tiny \on-the-fly #part-first-page \italic {
          "maximesmusic.com.au"
        }
      }

      \fill-line {
        \on-the-fly #not-first-page \concat {
          \tiny \fromproperty #'header:title " – "
          \tiny \fromproperty #'header:instrument
        }
        %% Tagline header field only on last page in the book.
        %\on-the-fly #last-page \fromproperty #'header:tagline
      }

      %\fill-line {
     %   \on-the-fly #not-first-page \fromproperty #'header:mm
      %  \on-the-fly #not-first-page { "Published in Australia by Maxime's Music" }
      %  \on-the-fly #not-first-page \italic {
      %    "maximesmusic.com.au"
     %   }
     % }

    }
  }
}
%% As long as evenFooterMarkup is unset, it inherits the value of
%% oddFooterMarkup, as if this were declared here:
% evenFooterMarkup = \oddFooterMarkup


\layout {
  \context {
    \Dynamics
    \consists #Measure_counter_engraver
    \override MeasureCounter.direction = #DOWN
    \override MeasureCounter.font-encoding = #'latin1
    \override MeasureCounter.font-shape = #'italic
    \override MeasureCounter.font-size = 0.5
    % to control the distance of the Dynamics context from the staff:
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing.padding = #2.5
  }

  \context {
    \Staff
    \consists "Melody_engraver"
    \override Stem.neutral-direction = #'()
    %#(set-accidental-style 'modern-cautionary)

    \override StaffSymbol.color = #(x11-color 'grey50)
    \override StaffSymbol.layer = #-1

    \override TupletBracket.bracket-visibility = #'if-no-beam

    %\override Script #'avoid-slur = #'inside

    %\override Hairpin.minimum-length = #3
    %\override Hairpin #'to-barline = ##f
    %\set Staff.minimumPageTurnLength = #(ly:make-moment 1/1)

    % if cresc lines are too long
    % \override DynamicTextSpanner.style = #'none

    % if dynamics are hitting barline in score
    % \override DynamicText.extra-spacing-width = ##f
    %\override DynamicTextSpanner.style = #'none

  }

  \context {
    \Score
    \remove "Bar_number_engraver"
    markFormatter = #format-mark-box-alphabet
    %markFormatter = #format-mark-box-barnumbers
    \override MetronomeMark #'font-size = #6
    \override MetronomeMark.Y-offset = #6
    \override RehearsalMark #'font-size = #6
    \override RehearsalMark.Y-offset = #6
    %\override RehearsalMark.padding = #1.5

    scriptDefinitions = #(cons '("marcato" .
                                  ((avoid-slur . around)
                                   (padding . 0.20)
                                   (quantize-position . #f)
                                   (script-stencil . (feta . ("umarcato" .  "umarcato")))
                                   (side-relative-direction . -1))) default-script-alist)

  }

  \context {
    \GrandStaff \RemoveEmptyStaves
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
    %#(set-accidental-style 'modern-cautionary)
  }

  \context {
    \DrumStaff
    \consists #Measure_counter_engraver
    \RemoveEmptyStaves
    \override Stem.direction = #UP
    \override TupletBracket.bracket-visibility = #'if-no-beam
    %\override Hairpin.minimum-length = #7
    %\override DynamicTextSpanner.style = #'none
  }
}
