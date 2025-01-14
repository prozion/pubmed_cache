#lang racket

(require odysseus)

(provide (all-defined-out))

(define-catch (month/abbr->num month-abbr)
  (let* ((months (hash  "Jan" "01" "Feb" "02" "Mar" "03"
                        "Apr" "04" "May" "05" "Jun" "06"
                        "Jul" "07" "Aug" "08" "Sep" "09"
                        "Oct" "10" "Nov" "11" "Dec" "12"
                        "Desember" "12"
                        ))
        (month-d (hash-ref months month-abbr month-abbr)))
    month-d))

(define-catch (normalize txt)
  (if (string? txt)
    (namefy (string-downcase txt))
    #f))

; clean field from newlines and tabs
(define-catch (cf field)
  (and
    field
    ((change-text
      (list
        (cons "\n" "")
        (cons "\t" " ")))
    field)))

(define-catch (chunk-n i)
  (format-number "dddd" i #:filler "0"))
