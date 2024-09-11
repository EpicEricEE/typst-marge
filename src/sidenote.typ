#import "resolve.typ": *
#import "validate.typ": validate

/// Get the margin note state for a specific page.
#let page-state(page) = state("marge:0.1.0/page-" + str(page), ())
/// Get the container mark metadata for a specific page.
#let page-container(page) = metadata("marge:0.1.0/container-" + str(page))
/// The sidenote counter.
#let counter = counter("sidenote")

/// The default format for margin notes.
#let default-format(it) = {
  let num = if it.numbering != none {
    link(it.source, super(it.counter.display(it.numbering)))
    h(1em/6)
  }
  set par(hanging-indent: measure(num).width)
  align(start, num + h(0pt, weak: true) + it.body)
}

/// A container of all margin notes.
///
/// To be used as the `page.background` or `page.foreground` parameter when the
/// page width is `auto`, as notes then cannot be automtically placed onto the
/// right margin.
#let container = context {
  page-container(here().page())
  for note in page-state(here().page()).final() {
    place(top + note.side, note.body, dy: note.position.y)
  }
}

/// A sidenote to be placed onto the page margin.
/// 
/// If this note ends up on the right margin of a page with width `auto`, it
/// cannot be placed automatically. In this case, the page's `background` or
/// `foreground` should be set to the `container` value of this package.
/// 
/// There are two correction mechanisms in place:
/// - When two notes would overlap, the second one is moved down to avoid this.
/// - When a note would overflow into the bottom margin, it is moved up. Any
///   previous notes, that this note would now overlap with, are also moved up.
/// 
/// # Parameters:
/// - `side`: The margin where the note should be placed.
/// - `dy`: A custom offset by which the note should be moved along the y-axis.
/// - `padding`: The space between the note and the page or content border.
/// - `gap`: The minimum gap between two consecutive notes.
/// - `numbering`: How the note should be numbered.
/// - `counter`: The counter to be used for numbering.
/// - `format`: The "show rule" of the note.
/// - `body`: The body of the note.
#let sidenote(
  side: "outside",
  dy: 0pt,
  padding: 2em,
  gap: 0.4em,
  numbering: none,
  counter: counter,
  format: it => it.default,
  body
) = {
  // Validate parameters.
  validate(
    side: side,
    dy: dy,
    padding: padding,
    gap: gap,
    numbering: numbering,
    counter: counter,
    format: format,
    body: body
  )

  // Place number in paragraph.
  if numbering != none {
    counter.step()
    context {
      let state = page-state(here().page())
      let note = state.final().at(state.get().len())
      let pos = note.position
      pos.x += note.padding.left.to-absolute()

      let num = counter.display(numbering)
      h(0pt, weak: true) + link(pos, super(num))
    }
  }
  
  h(0pt, weak: true) + sym.zwj + context {
    // Notes are stored in a per-page state.
    let margin-note-state = page-state(here().page())

    // Resolve values.
    let side = resolve-side(side)
    let padding = resolve-padding(padding)
    let margin = resolve-margin(side).to-absolute()
    let bottom-margin = resolve-margin(bottom).to-absolute()
    let page-height = resolve-auto(page.height, calc.inf * 1pt).to-absolute()
    let gap = gap.to-absolute()
    let leading = par.leading.to-absolute()

    // Create note content.
    let note-body = block(inset: padding, width: margin, {
      let source = here()
      context {
        let it = (
          side: side,
          numbering: numbering,
          counter: counter,
          padding: padding,
          margin: margin,
          source: source,
          body: body,
        )
        it.default = default-format(it)
        format(it)
      }
    })
    
    // Resolve dy relative to note-height (if given as ratio).
    let note-height = measure(note-body).height
    let dy = if type(dy) == length { dy }
             else if type(dy) == ratio { dy * note-height }
             else if type(dy) == relative { dy.ratio * note-height + dy.length }
  
    // Calculate position of note on y-axis. The note is moved up, so that it
    // aligns with the line of the paragraph.
    // TODO: This should be done at another point to accomodate for different
    //       font sizes. Alignment should be at the baseline.
    let text-height = measure[x].height
    let position = here().position()
    position.y += dy.to-absolute() - text-height

    // Set x-position of note depending on side.
    position.x = if side == right and page.width != auto { page.width - margin }
                 else { 0pt }

    margin-note-state.update(state => {
      let position = position
      
      // Move note down to avoid overlap with previous one.
      let prev = state.at(-1, default: none)
      position.y += if prev != none and prev.side == side {
        let gap = calc.max(gap, prev.gap)
        let overlap = prev.position.y + prev.height - position.y + leading + gap
        calc.max(0pt, overlap)
      }

      // Move note up to avoid overflow into bottom page margin.
      let overflow = position.y + note-height - page-height + bottom-margin
      position.y -= calc.max(0pt, overflow)

      // Summarize data of the new note.
      let new = (
        position: position,
        height: note-height,
        side: side,
        gap: gap,
        padding: padding,
        body: note-body
      )

      // Move previous notes up to restore the gap and prevent overlap with
      // previously moved up notes, starting from the bottom.
      let current = new
      for (i, prev) in state.enumerate().rev().filter(((_, note)) => note.side == side) {
        let gap = calc.max(current.gap, prev.gap)
        let overlap = prev.position.y + prev.height - current.position.y + leading + gap
        state.at(i).position.y -= calc.max(0pt, overlap)
        current = state.at(i)
      }

      // Append new note to the state of all notes on this page.
      state + (new,)
    })

    // Place the note on the page. Only use this automatic placement
    // if no container is used for this page!
    if page-container(here().page()) not in query(metadata) {
      let index = margin-note-state.get().len()
      let final = margin-note-state.final().at(index, default: none)

      context if final != none {
        assert(page.width != auto or final.side == left, message: {
          "cannot place note on right margin of page with width auto\n"
          "hint: import the `container` value of the package and use it as the "
          "page background or foreground"
        })
        
        let (x, y) = here().position()

        box(place(
          final.body,
          dx: final.position.x - x,
          dy: final.position.y - y
        ))
      }
    }
  }
}