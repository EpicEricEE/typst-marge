#import "/src/resolve.typ": resolve-margin

#set page(margin: (inside: 3cm, outside: 2cm, rest: 4cm))

#context assert.eq(here().page(), 1)
#context assert.eq(resolve-margin(top), 4cm)
#context assert.eq(resolve-margin("left"), 3cm)
#context assert.eq(resolve-margin(right), 2cm)
#context assert.eq(resolve-margin(start), 3cm)
#context assert.eq(resolve-margin("inside"), 3cm)

~

#set page(margin: (left: 3cm, right: 2cm, y: auto))

#context assert.eq(here().page(), 2)
#context assert.eq(resolve-margin(top), 2.5cm)
#context assert.eq(resolve-margin("left"), 3cm)
#context assert.eq(resolve-margin(right), 2cm)
#context assert.eq(resolve-margin(start), 3cm)
#context assert.eq(resolve-margin("inside"), 2cm)

~

#set page(flipped: true)

#context assert.eq(here().page(), 3)
#context assert.eq(resolve-margin(top), 2.5cm)
#context assert.eq(resolve-margin("left"), 3cm)
#context assert.eq(resolve-margin(right), 2cm)
#context assert.eq(resolve-margin(start), 3cm)
#context assert.eq(resolve-margin("inside"), 3cm)

~

#set page(margin: (x: 2cm))

#context assert.eq(here().page(), 4)
#context assert.eq(resolve-margin(top), 2.5cm)
#context assert.eq(resolve-margin("left"), 2cm)
#context assert.eq(resolve-margin(right), 2cm)
#context assert.eq(resolve-margin(start), 2cm)
#context assert.eq(resolve-margin("inside"), 2cm)

~

#set page(
  width: 100pt,
  height: auto,
  flipped: false,
  margin: 1em + 10%,
)

// #context assert.eq(here().page(), 5)
#context assert.eq(resolve-margin(top), 11pt)
#context assert.eq(resolve-margin(left), 21pt)
