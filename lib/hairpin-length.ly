\version "2.19.35"

\language "english"

%% a helper:
#(define (look-up-for-parent name-symbol axis grob)
"Return the parent of @var{grob}, specified by it's @var{name-symbol} in
axis @var{axis} of @var{grob}.  If @var{grob} is already equal to the grob
named @var{name-symbol} return @var{grob}.  If not found, look up for the next
parent."
 (let* ((parent (ly:grob-parent grob axis)))
 (cond
   ((not (ly:grob? parent))
    (ly:error
       (_"Perhaps typing error for \"~a\" or \"~a\" is not in the parent-tree.")
       name-symbol name-symbol))
   ((equal? name-symbol (grob::name grob)) grob)
   ((not (equal? name-symbol (grob::name parent)))
    (look-up-for-parent name-symbol axis parent))
   (else parent))))

#(define (my-hairpin-minimum-length grob)
"Sets @code{minimum-length} for @code{Hairpin}, if their left bound is not the
@code{NoteColumn}.
The visible length is actually the one, specified by an additional override for
@code{minimum-length} or the default.
If left bound is @code{NoteColumn}, default or specified @code{minimum-length}
will take over."
  (let* ((bound-left (ly:spanner-bound grob LEFT))
         (sys (look-up-for-parent 'System Y grob))
         (left-x-ext (ly:grob-extent bound-left sys X))
         (not-note-column?
           (lambda (g)
             (not (and (ly:grob? g)
                       (grob::has-interface g 'note-column-interface))))))
     (if (not-note-column? bound-left)
         (ly:grob-set-property! grob 'minimum-length
           (+
              (* (if (interval-sane? left-x-ext) (cdr left-x-ext) 1)
                 (ly:grob-property-data grob 'bound-padding))
              (ly:grob-property-data grob 'minimum-length)
              (if (interval-sane? left-x-ext) (cdr left-x-ext) 0))))))

%% `myHairpinMinimumLength' tries to warrant the visible length of a Hairpin
%% to be not less than the value of `minimum-length'
myHairpinMinimumLength =
  \override Hairpin.before-line-breaking = #my-hairpin-minimum-length

\layout {
  \context {
    \Voice
    \myHairpinMinimumLength
    %% default for 'minimum-length is #2
    %% try different values
    \override Hairpin.minimum-length = #2
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% EXAMPLES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
{
  \repeat unfold 3 { c4\ffff\> d\pppp c d \noBreak }
  \break
  \override Hairpin.minimum-length = 20
  \repeat unfold 3 { c4\ffff\> d\pppp c d \noBreak }
}

{ g8 g a g fs4\mf\> r-\tweak stencil ##f \p | }

{ g8 g a g fs4\mf\> r\p | }

{ b,8\mp as\< b cs as--\> b\! r4 | }

\parallelMusic #'(A B C D) {
        g8\< a b cs( ~ cs\mf\> b) d,\mp cs |
        g8\< g a g fs4\mf\> r\! |
        d8\< e fs e as,(\mf\> b) r4\! |
        e2\< d4\mf\> fs8(--\mp fs)-- |
}

\new StaffGroup <<
  \new Staff \A
  \new Staff \B
  \new Staff \C
  \new Staff \D
>>

\new Staff \A
\new Staff \B
\new Staff \C
\new Staff \D

\parallelMusic #'(P Q S T) {
    << b1\fermata {s2..\> s8\!} >> |
    << c1\fermata {s2..\> s8\!} >> |
    << e1\fermata {s2..\> s8\!} >> |
    << b1\fermata {s2..\> s8\!} >> |
}

\new StaffGroup <<
  \new Staff \P
  \new Staff \Q
  \new Staff \S
  \new Staff \T
>>

\new Staff \P
\new Staff \Q
\new Staff \S
\new Staff \T
%}