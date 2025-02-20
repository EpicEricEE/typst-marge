#import "/src/lib.typ": sidenote, container

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#let sidenote = sidenote.with(numbering: "1")

#lorem(6) #sidenote[Large] #lorem(6) #sidenote[Large]

#set page(foreground: container)
#lorem(6) #sidenote[Large] #lorem(6) #sidenote[Large]

#set page(background: container, foreground: none)
#lorem(6) #sidenote[Large] #lorem(6) #sidenote[Large]
