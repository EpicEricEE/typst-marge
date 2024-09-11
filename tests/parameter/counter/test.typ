#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#lorem(5)
#sidenote(numbering: "a")[This is a sidenote that steps the sidenote counter.]
#lorem(6)
#footnote[This is a footnote]

#pagebreak()
#counter("sidenote").update(0)

#lorem(5)
#sidenote(counter: counter(footnote), numbering: "1")[
  This is a sidenote that steps the footnote counter.
]
#lorem(6)
#footnote[This is a footnote]
