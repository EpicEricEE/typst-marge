#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(4)
#sidenote(dy: -5pt)[Moved up a tiny bit.]
#lorem(12)
#sidenote(dy: 5pt)[Moved down a tiny bit.]
#lorem(3)
#sidenote[Moved down due to overlap.]
#lorem(20)
#sidenote(dy: -100%)[Moved up by 100%.]
