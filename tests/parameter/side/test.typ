#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 11cm, height: auto, margin: (x: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(4)
#sidenote[This note is on the outside.]
#lorem(4)
#sidenote(side: "inside")[This note is on the inside.]
#lorem(4)
#sidenote(side: right)[This note is on the right.]
#lorem(4)
#sidenote(side: left)[This note is on the left.]
#lorem(4)
