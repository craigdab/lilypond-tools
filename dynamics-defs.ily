\version "2.19.80"






%%%%%%%%%%%%%%%%

fsf = \tweak DynamicText.self-alignment-X #RIGHT #(make-dynamic-script "f sf")

ffsf = \tweak DynamicText.self-alignment-X #RIGHT #(make-dynamic-script "ff sf")

fz = #(make-dynamic-script "fz")

rf = #(make-dynamic-script "rf")

ffz = #(make-dynamic-script "ffz")

ffp = #(make-dynamic-script "ffp")

cresIt = \markup { \italic { cres. } }
cresRmn = \markup { cres. }

conespr = \markup { \italic { con espr. } }

espr = \markup { \italic { espressivo } }

rinf = \markup { \italic { rinf. } }

moltoespr = \markup { \italic { molto espr. } }

dolcissimo = \markup { \italic { dolcissimo } }

legatoespr = \markup { \italic { legato espr. } }

ffmarcato = \markup { \dynamic ff \normal-text \italic { marcato } }

paccent = \markup { \dynamic p \normal-text \italic { accentate } }

mflegato = \markup { \dynamic mf \normal-text \italic { legato } }

ffmarc = \markup { \dynamic ff \concat { \normal-text [ \italic { marcato } ] } }

pconespr = \markup { \dynamic p \normal-text \italic { con espr. } }

pmoltolegato = \markup { \dynamic p \normal-text \italic { molto legato } }

pdolcelegato = \markup { \dynamic p \normal-text \italic { dolce legato } }

psempretenuto = \markup { \dynamic p \normal-text \italic "sempre tenuto" }

ppsostdol = \markup { \dynamic pp \normal-text \italic { sostenuto dolente } }
ppsostdolDynamic = \tweak DynamicText.self-alignment-X #LEFT
#(make-dynamic-script ppsostdol)

pdolceespr = \markup { \dynamic p \normal-text \italic { dolce espr. } }
pdolceesprDynamic = #(make-dynamic-script pdolceespr)

ppassai = \markup { \dynamic pp \normal-text \italic { assai } }
ppassaiDynamic = #(make-dynamic-script ppassai)

mfdolceespr = \markup { \dynamic mf \normal-text \italic { dolce espr. } }

mfespressivo = \markup { \dynamic mf \normal-text \italic { espressivo } }

fespressivo = \markup { \dynamic f \normal-text \italic { espressivo } }

mpespressivo = \markup { \dynamic mp \normal-text \italic { espressivo } }

ffpossible = \markup { \dynamic ff \normal-text \italic { possible } }

fenergico = \markup { \dynamic f \normal-text \italic { energico } }

ppespr = \markup { \dynamic pp \normal-text \italic { espr. } }
ppesprDynamic = #(make-dynamic-script ppespr)

piup = \markup { \center-column \italic { più } \dynamic p }

subitopp = \markup { \center-column \italic { subito } \dynamic pp }

submf = \markup { \center-column \italic { sub. } \dynamic mf }

legato = \markup { \italic { legato } }

fflegato = \markup { \dynamic ff \italic legato }

sostenuto = \markup { \italic { sostenuto } }

sempreppetlegato = \markup{ \italic sempre \dynamic pp \normal-text \italic { et legato }  }

semprepp = \markup { \italic sempre \dynamic pp }

sempref = \markup { \italic sempre \dynamic f }

ppsempre = \markup { \dynamic pp \italic sempre }

ppsubito = \markup { \dynamic pp \normal-text \italic subito }
ppsubitoDynamic = \tweak DynamicText.self-alignment-X #LEFT #(make-dynamic-script ppsubito)

psubito = \markup { \dynamic p \normal-text \italic subito }
psubitoDynamic = \tweak DynamicText.self-alignment-X #LEFT #(make-dynamic-script psubito)

ffsempre = \markup { \dynamic ff \italic sempre }

ffsempremarcato = \markup { \dynamic ff \italic "sempre marcato" }

fftenuto = \markup { \dynamic ff \italic tenuto }

fftenutoDynamic = \tweak DynamicText.self-alignment-X #LEFT
#(make-dynamic-script
  (markup #:dynamic "ff"
    #:normal-text
    #:italic "tenuto"))

ffftenuto = \markup { \dynamic fff \italic tenuto }
ffftenutoDynamic =  \tweak DynamicText.self-alignment-X #LEFT
#(make-dynamic-script
  (markup #:dynamic "fff"
    #:normal-text
    #:italic "tenuto"))

semprep = \markup { \italic sempre \dynamic p }

sempretenuto = \markup { \italic "sempre tenuto" }

sempremarcato = \markup { \italic "sempre marcato" }

ppcpap = \markup { \dynamic pp \normal-text \italic { cresc. poco a poco } }

pcpap = \markup { \dynamic p \normal-text \italic { cresc. poco a poco } }

pcresc = \markup { \dynamic p \normal-text \italic { cresc. } }

pcpap = \markup { \dynamic p \normal-text \italic { cresc. poco a poco } }

ppap = \markup { \dynamic p \normal-text \italic { poco a poco cresc. } }

fpcresc = \markup{ \dynamic fp \normal-text \italic {cresc.}  }

pococresc = \markup { \italic { poco cresc. } }

papdim = \markup { \italic { poco a poco dim. } }

fpcrescpap = \markup{ \dynamic fp \normal-text \italic {cresc. poco a poco}  }

ppcrescpap = \markup{ \dynamic pp \normal-text \italic {cresc. poco a poco}  }

semprelegato = \markup{ \italic { sempre legato }  }

semprestaccato = \markup{ \italic { sempre staccato }  }

sempretenutoeff = \markup { \italic { sempre tenuto e } \dynamic ff }

ffsempretenuto = \markup { \dynamic ff \normal-text \italic { sempre tenuto } }

ffsonore = \markup { \dynamic ff \normal-text \italic { sonore } }

mplegato = \markup { \dynamic mp \normal-text \italic { legato } }

ffsempre = \markup { \dynamic ff \normal-text \italic { sempre } }

moltoff = \markup { \normal-text \italic { molto } \dynamic ff }
moltoffDynamic = #(make-dynamic-script moltoff)

mfsemplice = \markup { \dynamic mf \normal-text \italic { semplice }  }

psempre = \markup { \dynamic p \normal-text \italic { sempre } }

benmarcato = \markup{ \italic {ben marcato} }

marcatotext = \markup{ \italic {marcato} }

pdolce = \markup{ \dynamic p \normal-text \italic {dolce} }
pdolceDynamic = #(make-dynamic-script
                  (markup #:line (#:right-align
                                  #:dynamic "p"
                                  #:normal-text
                                  #:italic "dolce")))

mfdolceDynamic = #(make-dynamic-script
                   (markup #:line (#:right-align
                                   #:dynamic "mf"
                                   #:normal-text
                                   #:italic "dolce")))

piumfDynamic = #(make-dynamic-script
                   (markup #:line (#:right-align
                                   #:normal-text
                                   #:italic "più"
                                   #:dynamic "mf")))

ffmoltomarcato = \markup{ \dynamic ff \normal-text \italic {molto marcato}  }

pptenuto = \markup{ \dynamic pp \normal-text \italic {tenuto}  }
pptenutoDynamic = #(make-dynamic-script pptenuto)

piuf = \markup{ \normal-text \italic {più} \dynamic f }
piufDynamic = #(make-dynamic-script piuf)

piup = \markup{ \normal-text \italic {più} \dynamic p }
piupDynamic = #(make-dynamic-script piup)

semprepiuf = \markup{ \normal-text \italic {sempre più} \dynamic f }
semprepiufDynamic = #(make-dynamic-script semprepiuf)

semprecresc = \markup{ \italic {sempre cresc.} }

moltocresc = \markup{ \italic {molto cresc.} }

papcresc = \markup { \italic { poco a poco cresc. } }

mmcres = \markup { cres. }

crescpap = \markup { \normal-text \italic { cresc. poco a poco } }
crescpapDynamic = \tweak DynamicText.self-alignment-X #LEFT
#(make-dynamic-script crescpap)

piucresc = \markup { \normal-text \italic { più cresc. } }
piucrescDynamic = \tweak DynamicText.self-alignment-X #LEFT
#(make-dynamic-script piucresc)

sempredim = \markup { \normal-text \italic { sempre dim. } }
sempredimDynamic = \tweak DynamicText.self-alignment-X #LEFT
#(make-dynamic-script sempredim)

dimpap = \markup{ \italic {dim. poco a poco} }

ppleggere = \markup { \dynamic pp \normal-text \italic { leggere }  }
ppleggereDynamic = #(make-dynamic-script ppleggere)

ppleggerio = \markup { \dynamic pp \normal-text \italic { leggerio }  }
ppleggerioDynamic = #(make-dynamic-script ppleggerio)

pocof = \markup { \normal-text \italic { poco } \dynamic f }
pocofDynamic = #(make-dynamic-script pocof)

menof = \markup { \normal-text \italic { meno } \dynamic f }
menofDynamic = #(make-dynamic-script menof)

pespr = \markup{ \dynamic p \normal-text \italic {espr.}}
pesprDynamic = #(make-dynamic-script pespr)

mfespr = \markup{ \dynamic mf \normal-text \italic {espr.}}
mfesprDynamic = #(make-dynamic-script mfespr)

ppsost = \markup{ \dynamic pp \normal-text \italic {sostenuto}}
ppsostDynamic = #(make-dynamic-script ppsost)

fsost = \markup{ \dynamic f \normal-text \italic {sost.}}
fsostDynamic = #(make-dynamic-script fsost)

ppdolce = \markup{ \dynamic pp \normal-text \italic {dolce}}
ppdolceDynamic = #(make-dynamic-script ppdolce)

subp = \markup { \normal-text \italic {sub.} \dynamic p }
subpDynamic = #(make-dynamic-script subp)

morendo = \markup { \normal-text \italic {morendo} }

toujours = \markup { \normal-text \italic {toujours} \dynamic pp }

tenu = \markup { \italic { tenu. } }

ten = \markup { \italic { ten. } }

tenutotext = \markup { \italic { tenuto } }

pizz = \markup pizz.

arco = \markup arco

solo = \markup solo

soli = \markup soli

tutti = \markup tutti

adue = \markup { a 2 }

dolce = \markup { \italic { dolce } }

dol = \markup { \italic { dol. } }

sost = \markup { \italic { sost. } }

sottovoce = \markup { \italic { sotto voce } }

gpferm = \markup \override #'(baseline-skip . 2.2) \center-column { \normal-text \bold "G.P." \musicglyph "scripts.ufermata" }

stac = \markup{ \italic {stac.} }

stacc = \markup{ \italic {stacc.} }

simile = \markup{ \italic {simile} }

sim = \markup{ \italic {sim.} }

crescmolto =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "cresc. molto")

piucresc =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "più cresc.")

crpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "cresc. poco a poco")

crespr =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "cresc. espr.")

crmolto =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "cresc. molto")

crapoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "cresc. a poco")

moltocr =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "molto cresc.")

papcr =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "poco a poco cresc.")

pococr =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "poco cresc.")

dimpoco =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "dim. poco a poco")

dimmolto =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "dim. molto")

pocoapocodim =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "poco a poco dim.")

pocodim =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text "poco dim.")

bracket =
#(define-event-function (dyn) (ly:event?)
   (make-dynamic-script
    #{ \markup \concat {
      \normal-text \italic \fontsize #2 [
      \pad-x #0.2 #(ly:music-property dyn 'text)
      \normal-text \italic \fontsize #2 ]
       }
    #}))

dashedline =
#(make-music 'CrescendoEvent
   'span-direction START
   'span-type 'text
   'span-text " ")

mycresc =
#(define-music-function (mymarkup) (markup?)
   (make-music 'CrescendoEvent
     'span-direction START
     'span-type 'text
     'span-text mymarkup))
mydecresc =
#(define-music-function (mymarkup) (markup?)
   (make-music 'DecrescendoEvent
     'span-direction START
     'span-type 'text
     'span-text mymarkup))


spacerVoice = \new Voice {
  \override MultiMeasureRest.transparent = ##t
  \override MultiMeasureRest.minimum-length = #20
  R1
}



DSfine = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small "D.S. al fine" }
}

DS = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small "D.S." }
}

DCfine = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small "D.C. al fine" }
}

DCcoda = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small "D.C. al coda" }
}

DScoda = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small "D.S. al coda" }
}

Fine = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small \italic "fine" }
}

GotoCoda = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#t #t #f)
  \mark \markup { \small \musicglyph "scripts.coda" }
}

Coda = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#f #t #t)
  \mark \markup { \small \musicglyph "scripts.coda" }
}

Segno = {
  \once \override Score.RehearsalMark.break-visibility = #'#(#f #t #t)
  \mark \markup { \small \musicglyph "scripts.segno" }
}


hairpinWithCenteredText =
#(define-music-function (text) (markup?)
#{
  \once \override Voice.Hairpin.after-line-breaking =
    #(lambda (grob)
      (let* ((stencil (ly:hairpin::print grob))
             (par-y (ly:grob-parent grob Y))
             (dir (ly:grob-property par-y 'direction))
             (new-stencil (ly:stencil-aligned-to
               (ly:stencil-combine-at-edge
                 (ly:stencil-aligned-to stencil X CENTER)
                 Y dir
                 (ly:stencil-aligned-to (grob-interpret-markup grob text) X CENTER))
               X LEFT))
             (staff-space (ly:output-def-lookup (ly:grob-layout grob) 'staff-space))
             (staff-line-thickness
               (ly:output-def-lookup (ly:grob-layout grob) 'line-thickness))
             (grob-name (lambda (x) (assq-ref (ly:grob-property x 'meta) 'name)))
             (par-x (ly:grob-parent grob X))
             (dyn-text (eq? (grob-name par-x) 'DynamicText ))
             (dyn-text-stencil-x-length
               (if dyn-text
                 (interval-length
                   (ly:stencil-extent (ly:grob-property par-x 'stencil) X))
                 0))
             (x-shift
               (if dyn-text
                 (-
                   (+ staff-space dyn-text-stencil-x-length)
                   (* 0.5 staff-line-thickness)) 0)))

      (ly:grob-set-property! grob 'Y-offset 0)
      (ly:grob-set-property! grob 'stencil
         (ly:stencil-translate-axis
          new-stencil
          x-shift X))))
#})

hairpinMolto =
\hairpinWithCenteredText \markup { \italic molto }

hairpinMore =
\hairpinWithCenteredText \markup { \larger moltissimo }


trillWithFlat =
{
        \once \override TrillSpanner.bound-details.left.text
= \markup { \lower #1 \musicglyph "scripts.trill" \smaller \hspace #-0.5 \flat }
        \once \override TrillSpanner.extra-offset = #'(0 . -0.5)
}
trillWithNatural =
{
        \once \override TrillSpanner.bound-details.left.text
= \markup { \lower #1 \musicglyph "scripts.trill" \smaller \hspace #-0.5 \natural }
        \once \override TrillSpanner.extra-offset = #'(0 . -0.5)
}
trillWithSharp =
{
        \once \override TrillSpanner.bound-details.left.text
= \markup { \lower #1 \musicglyph "scripts.trill" \smaller \hspace #-0.5 \sharp }
        \once \override TrillSpanner.extra-offset = #'(0 . -0.5)
}

%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22,
2.19.24, 2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion:     The document has not been changed.
%}


%{
convert-ly (GNU LilyPond) 2.19.82  convert-ly: Processing `'...
Applying conversion: 2.11.2, 2.11.3, 2.11.5, 2.11.6, 2.11.10, 2.11.11,
2.11.13, 2.11.15, 2.11.23, 2.11.35, 2.11.38, 2.11.46, 2.11.48,
2.11.50, 2.11.51, 2.11.52, 2.11.53, 2.11.55, 2.11.57, 2.11.60,
2.11.61, 2.11.62, 2.11.64, 2.12.0, 2.12.3, 2.13.0, 2.13.1, 2.13.4,
2.13.10, 2.13.16, 2.13.18, 2.13.20, 2.13.27, 2.13.29, 2.13.31,
2.13.36, 2.13.39, 2.13.40, 2.13.42, 2.13.44, 2.13.46, 2.13.48,
2.13.51, 2.14.0, 2.15.7, 2.15.9, 2.15.10, 2.15.16, 2.15.17, 2.15.18,
2.15.19, 2.15.20, 2.15.25, 2.15.32, 2.15.39, 2.15.40, 2.15.42,
2.15.43, 2.16.0, 2.17.0, 2.17.4, 2.17.5, 2.17.6, 2.17.11, 2.17.14,
2.17.15, 2.17.18, 2.17.19, 2.17.20, 2.17.25, 2.17.27, 2.17.29,
2.17.97, 2.18.0, 2.19.2, 2.19.7, 2.19.11, 2.19.16, 2.19.22, 2.19.24,
2.19.28, 2.19.29, 2.19.32, 2.19.40, 2.19.46, 2.19.49, 2.19.80
%}
