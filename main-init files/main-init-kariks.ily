\version "2.19.82"

\language "english"

\include "oll-core/package.ily"

%%% SCHOLARLY %%%

\loadPackage \with {
  modules = annotate.editorial-markup.choice
} scholarly


%%% EDITION ENGRAVER %%%

\loadPackage edition-engraver
\setOption edition-engraver.write-log ##f

%%% FONTS %%%

\loadPackage notation-fonts
\useNotationFont mtf-cadence

%{
\paper {
  #(define fonts
     (set-global-fonts
      #:roman "Bembo Book MT Std"
      ))
}
%}

\paper {
  #(define fonts
     (set-global-fonts
      #:roman "TeX Gyre Schola"
      ))
}

%% Percussion

#(define perc '((perc default #t 0)))

percstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.drumStyleTable = #(alist->hash-table perc)
}

#(define perccymbals '((crashcymbal default #t 0)))

cymbalsstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Cymbals"
  \set DrumStaff.shortInstrumentName = #"Cym."
  \set DrumStaff.drumStyleTable = #(alist->hash-table perccymbals)
}

#(define perctriangle '((triangle default #t 0)))

trianglestaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Triangle"
  \set DrumStaff.shortInstrumentName = #"Tri."
  \set DrumStaff.drumStyleTable = #(alist->hash-table perctriangle)
}

#(define percsnaredrum '((snaredrum default #t 0)))

snaredrumstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Snare Drum"
  \set DrumStaff.shortInstrumentName = #"Sn. Dr."
  \set DrumStaff.drumStyleTable = #(alist->hash-table percsnaredrum)
}

#(define percbassdrum '((bassdrum default #t 0)))

bassdrumstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Bass Drum"
  \set DrumStaff.shortInstrumentName = #"Bs. Dr."
  \set DrumStaff.drumStyleTable = #(alist->hash-table percbassdrum)
}

#(define perctamtam '((tamtam default #t 0)))

tamtamstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Tam-Tam"
  \set DrumStaff.shortInstrumentName = #"T-T"
  \set DrumStaff.drumStyleTable = #(alist->hash-table perctamtam)
}

#(define percgong '((gong default #t 0)))

gongstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Gong"
  \set DrumStaff.shortInstrumentName = #"Gong"
  \set DrumStaff.drumStyleTable = #(alist->hash-table percgong)
}

#(define regimentaldrums '((regimentaldrums default #t 0)))

regimentaldrumsstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Regimental Drums"
  \set DrumStaff.shortInstrumentName = #"Reg. Dr."
  \set DrumStaff.drumStyleTable = #(alist->hash-table regimentaldrums)
}

#(define tomtoms '((tomtoms default #t 0)))

tomtomsstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Tom-Toms"
  \set DrumStaff.shortInstrumentName = #"TT."
  \set DrumStaff.drumStyleTable = #(alist->hash-table tomtoms)
}

#(define tenordrum '((tenordrum default #t 0)))

tenordrumstaff = {
  \override Staff.StaffSymbol.line-positions = #'( 0 )
  \override Staff.BarLine.bar-extent = #'(-1.5 . 1.5)
  \override Stem.neutral-direction = #up
  \override Tie.direction = #DOWN
  \set DrumStaff.instrumentName = #"Tenor Drum"
  \set DrumStaff.shortInstrumentName = #"Ten. Dr."
  \set DrumStaff.drumStyleTable = #(alist->hash-table tenordrum)
}

xylostaff = {

}

#(define afterGraceFraction (cons 31 32))

#(define ((alter-lv-tie-curve offsets) grob)
   (let ((coords (ly:semi-tie::calc-control-points grob)))

     (define (add-offsets coords offsets)
       (if (null? coords)
       '()
       (cons
	 (cons (+ (caar coords) (car offsets))
	       (+ (cdar coords) (cadr offsets)))
	 (add-offsets (cdr coords) (cddr offsets)))))

     (add-offsets coords offsets)))
     
shapeLVTie = #(define-music-function (parser location offsets) (list?)
#{
   \once \override LaissezVibrerTie #'control-points = #(alter-lv-tie-curve offsets)
#})

