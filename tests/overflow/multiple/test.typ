#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: 18cm, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(30)
#for n in range(10) [
  do #sidenote[
    This note is moved up to prevent overlap.
  ]
]
#lorem(30)
#sidenote[
  This sidenote would overflow out the bottom of the page and is thus moved upwards.
]
