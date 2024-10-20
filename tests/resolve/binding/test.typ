#import "/src/resolve.typ": resolve-binding

#context assert.eq(resolve-binding(), left)

~

#{
  set page(binding: right)
  context assert.eq(here().page(), 1)
  context assert.eq(resolve-binding(), right)
}

#{
  set text(dir: rtl)
  context assert.eq(resolve-binding(), right)
}

#{
  set text(lang: "he")
  context assert.eq(resolve-binding(), right)
}
