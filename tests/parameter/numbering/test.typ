#import "/src/lib.typ": sidenote

#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#lorem(4)
#sidenote(numbering: "1")[Arabic numbering]
#lorem(4)
#sidenote(numbering: "a")[Alphabetic numbering]
#lorem(4)
#sidenote(numbering: "I")[Roman numbering]
#lorem(4)
#sidenote(numbering: num => [#{2 * num}])[Function numbering]
#lorem(4)
#sidenote(numbering: num => [#here().position().x])[Contextual numbering]
#lorem(25)
