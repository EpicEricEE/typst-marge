#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 12cm, height: 6cm, margin: (x: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(8)
#sidenote(side: right)[This sidenote is on the right side and independent from any corrections of the left notes.]
#lorem(2)
#sidenote(side: left)[
  This note is on the left side and had to be moved up to prevent overlap with the overflow-corrected note below.
]
#lorem(20)
#sidenote(side: left)[
  This one is on the left and corrected for overflow.
]
