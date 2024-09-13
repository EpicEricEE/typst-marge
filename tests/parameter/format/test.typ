#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(3)
#sidenote(format: it => [(#it.counter.display(it.numbering)) #it.body])[
  Sidenote with parenthesized number.
]
#lorem(10)
#sidenote(format: it => smallcaps(it.default))[
  Small caps sidenote.
]
#lorem(10)
#sidenote(format: it => text(red, it.default))[
  Sidenote with red text and number.
]
#lorem(5)
