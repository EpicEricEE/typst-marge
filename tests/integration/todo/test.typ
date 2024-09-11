#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 9cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let todo(body) = sidenote(
  gap: 0.5em,
  padding: (inside: 2em, outside: 1em),
  numbering: none,
  format: it => {
    // Add line to source location.
    let dx = it.source.position().x - here().position().x
    let dy = it.source.position().y - here().position().y

    let start-y = measure[x].height / 2
    let start-x = if it.side == left { it.margin - it.padding.values().sum() }
                  else { 0pt }
    let gap = 0.175em
    let padding = if it.side == left { it.padding.right }
                  else { -it.padding.left }
    
    place(path(
      stroke: (paint: red, join: "round", cap: "round"),
      (start-x, start-y),
      (start-x + padding / 2, start-y),
      (start-x + padding / 2, dy + gap),
      (dx + 1pt, dy + gap),
    ))

    place(
      dx: dx,
      dy: dy + gap - 1pt,
      circle(radius: 1pt, fill: red)
    )

    // Add original note in a colorful box.
    box(
      width: 100%,
      fill: yellow,
      stroke: (paint: red, join: "round"),
      outset: 0.4em,
      it.default
    )
  },
  body
)

Lorem ipsum dolor sit amet, consectetur #todo["consectetur" is a weird word]
adipiscing elit, sed do  eiusmod #todo[so is "eiusmod"]
tempor incididunt ut labore et dolore magnam aliquam quaerat.
