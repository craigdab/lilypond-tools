\version "2.19.65"
\language "english"

ffmo = #(make-dynamic-script "FF.mo")

%%% Magazin Musqiue DYNAMICS %%%

#(define (magazin-dynamic-stencil grob)
   (let ((dyn (ly:grob-property grob 'text)))
     (cond
      ((equal? dyn "p")(set! dyn "P"))
      ((equal? dyn "pp")(set! dyn "PP"))
      ((equal? dyn "f")(set! dyn "F"))
      ((equal? dyn "ff")(set! dyn "FF"))
      ((equal? dyn "ffmo")(set! dyn "FF.mo"))
      )
     (ly:grob-set-property! grob 'text #{ \markup { \normal-text #dyn } #})
     ;(ly:grob-set-property! grob 'self-alignment-X -.75)
     (ly:text-interface::print grob)
     ))

%%% Magazin Musqiue EDITORIAL DYNAMICS %%%

#(define (editorial-dynamic-stencil grob)
   (let ((dyn (ly:grob-property grob 'text)))
     (cond
      ((equal? dyn "p")(set! dyn "P"))
      ((equal? dyn "pp")(set! dyn "PP"))
      ((equal? dyn "f")(set! dyn "F"))
      ((equal? dyn "ff")(set! dyn "FF"))
      )
     (ly:grob-set-property! grob 'text #{ \markup { \normal-text \italic #dyn } #})
     ;(ly:grob-set-property! grob 'self-alignment-X -.75)
     (ly:text-interface::print grob)
     ))

magazinDynamics = \override DynamicText.stencil = #magazin-dynamic-stencil
editorialDynamics = \override DynamicText.stencil = #editorial-dynamic-stencil

%%% BRACKET ARTICULATIONS

#(define parentheses-item::bracket-stencils
  (lambda (grob)
    (let* ((details (ly:grob-property grob 'details))
           (protrusion (assoc-get 'protrusion details 0.2))
           (thick (ly:grob-property grob 'thickness 0.1))
           (shorten-pair (ly:grob-property grob 'shorten-pair '(0 . 0)))
           (half-y (magstep (ly:grob-property grob 'font-size)))
           (bracket-y-ext
             (cons
               (- (- half-y (car shorten-pair)))
               (- half-y (cdr shorten-pair)))))
      (list
        (ly:bracket Y bracket-y-ext thick protrusion)
        (ly:bracket Y bracket-y-ext thick (- protrusion))))))


%%% GOSSEC DYNAMICS %%%

#(define (gossec-dynamic-stencil grob)
   (let ((dyn (ly:grob-property grob 'text)))
     (cond
      ((equal? dyn "p")(set! dyn "p"))
      ((equal? dyn "pp")(set! dyn "pp"))
      ((equal? dyn "f")(set! dyn "f"))
      ((equal? dyn "ff")(set! dyn "ff"))
      )
     (ly:grob-set-property! grob 'text #{ \markup { \normal-text \italic #dyn } #})
     ;(ly:grob-set-property! grob 'self-alignment-X -.75)
     (ly:text-interface::print grob)
     ))

%%% GOSSEC EDITORIAL DYNAMICS %%%

#(define (gossecedit-dynamic-stencil grob)
   (let ((dyn (ly:grob-property grob 'text)))
     (cond
      ((equal? dyn "p")(set! dyn "p"))
      ((equal? dyn "pp")(set! dyn "pp"))
      ((equal? dyn "f")(set! dyn "f"))
      ((equal? dyn "ff")(set! dyn "ff"))
      )
     (ly:grob-set-property! grob 'text #{ \markup { \normal-text #dyn } #})
     ;(ly:grob-set-property! grob 'self-alignment-X -.75)
     (ly:text-interface::print grob)
     ))

%gossecDynamics = \override DynamicText.stencil = #gossec-dynamic-stencil
gosseceditDynamics = \override DynamicText.stencil = #gossecedit-dynamic-stencil
