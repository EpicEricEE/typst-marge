#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1",)

#lorem(3)
#sidenote[Normal padding.]
#lorem(7)
#sidenote(padding: 4pt)[Small padding on both sides.]
#lorem(9)
#sidenote(padding: (start: 2em, end: 4pt))[Small padding on end side only.]
#lorem(5)
