#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(5)
#sidenote[This is the first sidenote.]
#lorem(1)
#sidenote[This one is moved down to prevent overlap.]
#lorem(18)
