#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(20)
#place(
  bottom, dy: -32pt, dx: 5pt,
  block(width: 3cm, inset: 3pt, fill: yellow, stroke: black)[
    #lorem(6)
    #sidenote[This sidenote comes from a placed block.]
  ]
)
