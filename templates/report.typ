// =============================================================================
// 보고서 템플릿 (Pandoc용)
// 사용: pandoc input.md --pdf-engine=typst --template=report.typ -o output.pdf
// =============================================================================

#set document(
  title: "$if(title)$$title$$else$문서$endif$",
  author: "$if(author)$$author$$endif$",
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
  numbering: "1",
  header: context {
    if counter(page).get().first() > 2 [
      #text(size: 9pt, fill: gray)[$if(title)$$title$$endif$]
      #h(1fr)
      #text(size: 9pt, fill: gray)[$if(author)$$author$$endif$]
      #v(-0.5em)
      #line(length: 100%, stroke: 0.5pt + gray)
    ]
  },
  footer: context {
    if counter(page).get().first() > 1 [
      #h(1fr)
      #text(size: 9pt)[#counter(page).display("1 / 1", both: true)]
      #h(1fr)
    ]
  },
)

// 폰트 설정 (Pretendard 우선, 없으면 기본 폰트)
#set text(
  font: ("Pretendard", "Noto Sans CJK KR", "sans-serif"),
  size: 11pt,
  lang: "ko",
)

// 제목 스타일
#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(1em)
  text(size: 18pt, weight: "bold", fill: rgb("#8b5cf6"))[#it]
  v(0.5em)
}

#show heading.where(level: 2): it => {
  v(0.8em)
  text(size: 14pt, weight: "bold")[#it]
  v(0.3em)
}

#show heading.where(level: 3): it => {
  v(0.5em)
  text(size: 12pt, weight: "bold")[#it]
  v(0.2em)
}

// 코드 블록 스타일
#show raw.where(block: true): it => {
  set text(size: 9pt, font: ("D2Coding", "Consolas", "monospace"))
  block(
    fill: rgb("#f8fafc"),
    stroke: 1pt + rgb("#e2e8f0"),
    radius: 4pt,
    inset: 10pt,
    width: 100%,
    it,
  )
}

// 인라인 코드
#show raw.where(block: false): box.with(
  fill: rgb("#f1f5f9"),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

// 표 스타일
#set table(
  stroke: 0.5pt + rgb("#e2e8f0"),
  inset: 8pt,
)
#show table.cell.where(y: 0): set text(weight: "bold")
#show table.cell.where(y: 0): set table.cell(fill: rgb("#f1f5f9"))

// 링크 스타일
#show link: it => text(fill: rgb("#8b5cf6"), it)

// 인용 스타일
#show quote: it => block(
  stroke: (left: 3pt + rgb("#e2e8f0")),
  inset: (left: 1em, y: 0.5em),
  it,
)

// Pandoc horizontalrule (---) 지원
#let horizontalrule = line(length: 100%, stroke: 0.5pt + rgb("#e2e8f0"))

// =============================================================================
// 표지
// =============================================================================
#page(
  margin: 0pt,
  header: none,
  footer: none,
)[
  #box(
    width: 100%,
    height: 100%,
    fill: gradient.linear(rgb("#8b5cf6"), rgb("#ec4899"), angle: 135deg),
  )[
    #place(
      center + horizon,
      dy: -30pt,
    )[
      #block(width: 80%)[
        #align(center)[
          #text(size: 32pt, weight: "bold", fill: white)[
            $if(title)$$title$$else$문서 제목$endif$
          ]

          $if(subtitle)$
          #v(0.5em)
          #text(size: 18pt, fill: white.transparentize(20%))[$subtitle$]
          $endif$

          #v(3em)
          #line(length: 50%, stroke: 2pt + white.transparentize(50%))
          #v(2em)

          #text(size: 14pt, fill: white)[
            $if(author)$$author$$endif$
          ]
          #v(0.5em)
          #text(size: 12pt, fill: white.transparentize(30%))[
            $if(date)$$date$$else$#datetime.today().display("[year]-[month]-[day]")$endif$
          ]
        ]
      ]
    ]
  ]
]

// =============================================================================
// 목차
// =============================================================================
#page[
  #text(size: 18pt, weight: "bold")[목차]
  #v(1em)
  #outline(
    title: none,
    indent: 1.5em,
    depth: 3,
  )
]

// =============================================================================
// 본문
// =============================================================================
$body$
