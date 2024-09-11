#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 12cm, height: auto, margin: (x: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(8)
#sidenote(side: right)[This sidenote is on the right side.]
#lorem(2)
#sidenote(side: left)[
  This one is on the left side and thus doesn't overlap with the previous one.
]
#lorem(6)
#sidenote(side: left)[
  This is also on the left side and does overlap.
]
#lorem(28)
