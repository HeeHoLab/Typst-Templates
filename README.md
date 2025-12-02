---
title: "Typst 템플릿 라이브러리"
tags: [typst, pandoc, template]
---

# Typst 템플릿 라이브러리

n8n 워크플로우에서 Markdown → PDF 변환에 사용하는 Typst 템플릿 모음

## 구조

```
typst-templates/
├── templates/
│   ├── report.typ      # 보고서 (표지 + 목차)
│   └── simple.typ      # 간단한 문서
├── shared/
│   └── colors.typ      # 공통 색상
├── fonts/
│   └── (폰트 파일)
└── README.md
```

## 사용법

### Pandoc + Typst

```bash
pandoc input.md \
  --from markdown \
  --to pdf \
  --pdf-engine=typst \
  --template=templates/report.typ \
  --metadata title="문서 제목" \
  --metadata author="작성자" \
  --metadata date="2025-01-01" \
  --output output.pdf
```

### DOCX 변환

```bash
pandoc input.md \
  --from markdown \
  --to docx \
  --metadata title="문서 제목" \
  --output output.docx
```

## 템플릿 변수

| 변수 | 설명 | 예시 |
|------|------|------|
| `title` | 문서 제목 | "프로젝트 보고서" |
| `subtitle` | 부제목 | "2025년 1분기" |
| `author` | 작성자 | "홍길동" |
| `date` | 작성일 | "2025-01-01" |

## 폰트 설치

```bash
# Pretendard 다운로드
./fonts/download.sh
```

## 템플릿 종류

### report.typ
- 표지 페이지 (그라데이션 배경)
- 자동 목차 생성
- 머리글/바닥글
- 코드 블록 스타일링
- 표 스타일링

### simple.typ
- 표지/목차 없음
- 간단한 레이아웃
- 빠른 렌더링
