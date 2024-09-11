/// Resolve "auto" values with the given default.
#let resolve-auto(val, default) = {
  if val == auto { default } else { val }
}

/// Resolve text direction, depending on the language.
/// 
/// Requires context.
#let resolve-dir() = {
  let rtl-langauges = (
    "ar", "dv", "fa", "he", "ks", "pa", "ps", "sd", "ug", "ur", "yi"
  )
  resolve-auto(text.dir, if text.lang in rtl-langauges { rtl } else { ltr })
}

/// Resolve page binding, depending on the text direction.
/// 
/// Requires context.
#let resolve-binding() = {
  resolve-auto(page.binding, if resolve-dir() == ltr { left } else { right })
}

/// Resolve the given margin note side, depending on the text direction and
/// page binding.
/// 
/// Side can be "inside", "outside", start, end, left, right, top or bottom.
/// They can be given as alignment values or their string representations.
/// 
/// Requires context.
#let resolve-side(side) = {
  let dir = resolve-dir()
  let binding = resolve-binding()
  let inside = if calc.odd(here().page()) { binding } else { binding.inv() }

  if side in (left, "left") { left }
  else if side in (right, "right") { right }
  else if side in (top, "top") { top }
  else if side in (bottom, "bottom") { bottom }
  else if side in (start, "start") { if dir == ltr { left } else { right } }
  else if side in (end, "end") { if dir == ltr { right } else { left } }
  else if side == "inside" { inside }
  else if side == "outside" { inside.inv() }
  else { panic("invalid side") }
}

/// Resolve the page margin at the given side.
/// 
/// Side can be "inside", "outside", start, end, left, right, top or bottom.
/// They can be given as alignment values or their string representations.
/// 
/// Requires context.
#let resolve-margin(side) = {
  let side = resolve-side(side)
  let binding = resolve-binding()

  let margin = if page.margin == auto or type(page.margin) == length {
    page.margin
  } else if type(page.margin) == dictionary {
    let inside = if calc.odd(here().page()) { binding } else { binding.inv() }
    
    if "left" in page.margin and side == left { page.margin.left }
    else if "right" in page.margin and side == right { page.margin.right }
    else if "top" in page.margin and side == top { page.margin.top }
    else if "bottom" in page.margin and side == bottom { page.margin.top }
    else if "inside" in page.margin and side == inside { page.margin.inside }
    else if "outside" in page.margin and side != inside { page.margin.outside }
    else if "x" in page.margin and side.x != none { page.margin.x }
    else if "y" in page.margin and side.y != none { page.margin.y }
    else if "rest" in page.margin { page.margin.rest }
    else { auto }
  } else {
    panic("invalid page margin")
  }

  // Resolve auto margin.
  let result = resolve-auto(margin, {
    let size = calc.min(
      resolve-auto(page.width, calc.inf * 1pt),
      resolve-auto(page.height, calc.inf * 1pt)
    )
    if size.pt().is-infinite() { size = 210mm }
    2.5 / 21 * size
  })

  // Resolve relative values.
  if type(result) == relative {
    let relative-to = if side.axis() == "horizontal" {
      resolve-auto(page.height, 0pt)
    } else {
      resolve-auto(page.width, 0pt)
    }
    result = result.length + result.ratio * relative-to
  }

  result
}

/// Resolve the note padding into a dictionary with left and right keys.
/// 
/// The padding can be given as a single value, an array with maximum two
/// values or a dictionary with left and/or right keys.
/// 
/// Requires context.
#let resolve-padding(padding) = {
  if type(padding) == length {
    (left: padding, right: padding)
  } else if type(padding) == array {
    (left: padding.at(0, default: 0pt), right: padding.at(1, default: 0pt))
  } else if type(padding) == dictionary {
    let resolved = (left: 0pt, right: 0pt)
    let binding = resolve-binding()
    let inside = if calc.odd(here().page()) { binding } else { binding.inv() }
    let start = if resolve-dir() == ltr { left } else { right }
    if "inside" in padding { resolved.at(repr(inside)) = padding.at("inside") }
    if "outside" in padding { resolved.at(repr(inside.inv())) = padding.at("outside") }
    if "start" in padding { resolved.at(repr(start)) = padding.at("start") }
    if "end" in padding { resolved.at(repr(start.inv())) = padding.at("end") }
    if "left" in padding { resolved.left = padding.at("left") }
    if "right" in padding { resolved.right = padding.at("right") }
    resolved
  } else if padding == none {
    (left: 0pt, right: 0pt)
  } else {
    panic("invalid padding")
  }
}
