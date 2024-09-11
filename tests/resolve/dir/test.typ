#import "/src/resolve.typ": resolve-dir

#context assert.eq(resolve-dir(), ltr)

#{
  set text(dir: rtl)
  context assert.eq(resolve-dir(), rtl)
}

#{
  set text(lang: "he")
  context assert.eq(resolve-dir(), rtl)
}
