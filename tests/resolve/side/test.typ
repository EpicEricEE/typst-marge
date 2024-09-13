#import "/src/resolve.typ": resolve-side

#context assert.eq(resolve-side("left"), left)
#context assert.eq(resolve-side(right), right)
#context assert.eq(resolve-side(start), left)
#context assert.eq(resolve-side("inside"), left)

#{
  set page(binding: right)
  context assert.eq(here().page(), 1)
  context assert.eq(resolve-side("inside"), right)
}

~

#{
  set text(dir: rtl)
  context assert.eq(here().page(), 2)
  context assert.eq(resolve-side("inside"), left)
  context assert.eq(resolve-side("end"), left)
  pagebreak(to: "even")
}

~

#{
  context assert.eq(here().page(), 4)
  context assert.eq(resolve-side("inside"), right)
}

~

#{
  set page(flipped: true)
  context assert.eq(here().page(), 5)
  context assert.eq(resolve-side("inside"), left)
}
