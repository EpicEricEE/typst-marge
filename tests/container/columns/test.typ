#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 12cm, height: 5cm, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#show: columns.with(2)
#lorem(15)
#sidenote[A note from the first column.]
#lorem(15)
#sidenote[A note from the second column.]
#lorem(15)
