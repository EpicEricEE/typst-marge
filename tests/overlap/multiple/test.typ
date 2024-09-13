#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: 20cm, margin: (outside: 4.5cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(5)
#sidenote[This is the first sidenote.]
#for n in range(13) [
  oh #sidenote[This one is moved down to prevent overlap.]
]
