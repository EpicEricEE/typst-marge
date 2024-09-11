#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(3)
#sidenote[Normal gap.]
#lorem(3)
#sidenote[Normal gap.]
#lorem(3)
#sidenote(gap: 0pt)[Small gap.]
#lorem(3)
#sidenote(gap: 0pt)[Small gap.]
#lorem(3)
#sidenote(gap: 1.5em)[Large gap.]
#lorem(3)
#sidenote[Normal gap.]
#lorem(3)
#sidenote[Normal gap.]
#lorem(12)

#set page(height: 7cm)

#lorem(12)
#sidenote[Normal gap.]
#lorem(3)
#sidenote[Normal gap.]
#lorem(3)
#sidenote(gap: 0pt)[Small gap.]
#lorem(3)
#sidenote(gap: 0pt)[Small gap.]
#lorem(3)
#sidenote(gap: 1.5em)[Large gap.]
#lorem(3)
#sidenote[Normal gap.]
#lorem(3)
#sidenote[Normal gap.]
