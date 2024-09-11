#import "/src/resolve.typ": resolve-padding

#context assert.eq(resolve-padding(none), (left: 0pt, right: 0pt))
#context assert.eq(resolve-padding(2pt), (left: 2pt, right: 2pt))
#context assert.eq(resolve-padding(1em), (left: 1em, right: 1em))
#context assert.eq(resolve-padding((1pt, 2pt)), (left: 1pt, right: 2pt))
#context assert.eq(resolve-padding((left: 1pt)), (left: 1pt, right: 0pt))
#context assert.eq(resolve-padding((left: 1pt, right: 2pt)), (left: 1pt, right: 2pt))
#context assert.eq(resolve-padding((end: 2pt)), (left: 0pt, right: 2pt))
#context assert.eq(resolve-padding((outside: 2pt)), (left: 0pt, right: 2pt))

#{
  set text(dir: rtl)
  context assert.eq(resolve-padding((end: 2pt)), (right: 0pt, left: 2pt))
}

#{
  set page(binding: right)
  context assert.eq(resolve-padding((outside: 2pt)), (left: 2pt, right: 0pt))
}
