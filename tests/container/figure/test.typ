#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(5)
#sidenote[A note before the figure.]

#figure(rect(), caption: [
  // Counter is not stepped because of a Typst bug! (Fixed in 0.12)
  A rectangle #sidenote[A note from the caption.]
])

#lorem(5)
#sidenote[A note after the figure.]
#lorem(5)
