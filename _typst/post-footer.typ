// _typst/post-footer.typ
// Loaded via include-in-header in posts/_metadata.yml (preamble of every post).
// Returns the running-footer CONTENT. Each post applies it with its own
//   #set page(footer: footer-content("<url>"))
// at the top level of its frontmatter `include-before-body`.
// NB: the `set page` must live at the call site, not inside this function —
// a `set` rule inside a function body is scoped to that body and has no effect
// on the document (that was the vanishing-footer bug).

#let footer-content(article-url) = context {
  set text(size: 8pt, fill: luma(140))
  // Absolute target so the PDF viewer can't treat the link as a relative path;
  // show the address bare.
  let target = if article-url.starts-with("http://") or article-url.starts-with("https://") {
    article-url
  } else {
    "https://" + article-url
  }
  let shown = article-url.replace("https://", "").replace("http://", "")
  grid(
    columns: (1fr, auto, 1fr),
    align(left)[#link("https://vikramggoyal.co")[vikramggoyal.co]],
    align(center)[#counter(page).display("1")],
    align(right)[#link(target)[#shown]],
  )
}
