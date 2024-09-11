#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#show figure.caption: it => layout(bounds => {
  let fig = query(selector(figure).before(here())).at(-1, default: none)
  if fig == none { return it }
  
  let figure-height = measure(fig.body).height
  v(-fig.gap)
  place(sidenote(numbering: none, dy: -50% - figure-height / 2, it))
})

#lorem(5)
#figure(rect(height: 1cm), caption: [This caption is on the side.])
#lorem(6)
