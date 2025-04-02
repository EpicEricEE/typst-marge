#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 9cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let todo(color: red, body) = sidenote(
  padding: (inside: 2em, outside: 1em),
  numbering: none,
  format: it => {
    // Add line to source location.
    let dx = it.source.position().x - here().position().x
    let dy = it.source.position().y - here().position().y
    let offset = 0.175em

    let start-y = 0em
    let start-x = if it.side == left { it.margin - it.padding.values().sum() }
                  else { 0pt }
    let padding = if it.side == left { it.padding.right }
                  else { -it.padding.left }
    
    place(curve(
      stroke: (paint: color, join: "round", cap: "round"),
      curve.move((start-x, start-y)),
      curve.line((start-x + padding / 2, start-y)),
      curve.line((start-x + padding / 2, dy + offset)),
      curve.line((dx, dy + offset)),
    ))

    place(dx: dx, dy: dy + offset, {
      place(center + horizon, circle(radius: 1pt, fill: color))
    })

    // Add original note in a colorful box.
    box(
      width: 100%,
      fill: color.lighten(75%),
      stroke: ((repr(it.side.inv())): color),
      radius: 0.5pt,
      inset: (x: 0.5em),
      outset: (y: 0.5em),
      it.default
    )
  },
  body
)

Lorem ipsum dolor sit amet, consectetur #todo["consectetur" is a weird word]
adipiscing elit, sed do  eiusmod #todo(color: blue)[so is "eiusmod"]
tempor incididunt ut labore et dolore magnam aliquam quaerat.

#pagebreak()

Lorem ipsum dolor sit amet, consectetur #todo(color: orange)[same as before]
adipiscing elit, sed do  eiusmod #todo(color: green)[last one]
tempor incididunt ut labore et dolore magnam aliquam quaerat.
