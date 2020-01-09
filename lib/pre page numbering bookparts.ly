\version "2.19.35"

\paper {
  first-page-number = #-1
}
\bookpart {
  \markup { "Front cover" }
}
\bookpart {
  \paper {
    print-page-number = ##f
    % For roman numerals, comment the previous and uncomment the following line
    %page-number-type = roman-lower
  }
  \markup {
    "Inside front cover: table of contents, etc.
           No page number wanted, but Roman ``i'' would be OK."
  }
}
\bookpart {
  \markup { "Music starts here.  Page no. 1" }
  { c''1 }
}

