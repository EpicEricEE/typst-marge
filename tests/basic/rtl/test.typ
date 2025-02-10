#import "/src/lib.typ": sidenote

#set text(dir: rtl)
#set par(justify: true)
#set page(width: 8cm, height: auto, margin: (outside: 4cm, rest: 5mm))

#lorem(5)
#sidenote[This is a simple unnumbered sidenote.]
#lorem(13)
#sidenote(numbering: "1")[Here is another one.]
#lorem(11)
