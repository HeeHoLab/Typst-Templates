// =============================================================================
// 간단한 문서 템플릿 (표지/목차 없음)
// 사용: pandoc input.md --pdf-engine=typst --template=simple.typ -o output.pdf
// =============================================================================

#set document(
  title: "$if(title)$$title$$else$문서$endif$",
  author: "$if(author)$$author$$endif$",
)

#set page(
  paper: "a4",
  margin: (top: 2cm, bottom: 2cm, left: 2cm, right: 2cm),
  numbering: "1",
)

#set text(
  font: ("Pretendard", "Noto Sans CJK KR", "sans-serif"),
  size: 11pt,
  lang: "ko",
)

#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  v(0.8em)
  text(size: 16pt, weight: "bold")[#it]
  v(0.4em)
}

#show heading.where(level: 2): it => {
  v(0.6em)
  text(size: 13pt, weight: "bold")[#it]
  v(0.3em)
}

#show raw.where(block: true): block.with(
  fill: rgb("#f5f5f5"),
  stroke: 1pt + rgb("#e0e0e0"),
  radius: 3pt,
  inset: 8pt,
  width: 100%,
)

#show raw.where(block: false): box.with(
  fill: rgb("#f0f0f0"),
  inset: (x: 2pt),
  outset: (y: 2pt),
  radius: 2pt,
)

// 제목 (있으면)
$if(title)$
#align(center)[
  #text(size: 20pt, weight: "bold")[$title$]
  $if(author)$
  #v(0.5em)
  #text(size: 12pt, fill: gray)[$author$]
  $endif$
  $if(date)$
  #v(0.3em)
  #text(size: 11pt, fill: gray)[$date$]
  $endif$
]
#v(2em)
$endif$

// 본문
$body$
