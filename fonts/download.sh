#!/bin/bash
# Pretendard 폰트 다운로드 스크립트

FONT_DIR="$(dirname "$0")"
cd "$FONT_DIR"

echo "Pretendard 폰트 다운로드 중..."

# Pretendard 최신 릴리즈
PRETENDARD_VERSION="1.3.9"
PRETENDARD_URL="https://github.com/orioncactus/pretendard/releases/download/v${PRETENDARD_VERSION}/Pretendard-${PRETENDARD_VERSION}.zip"

# 다운로드 및 압축 해제
curl -L -o pretendard.zip "$PRETENDARD_URL"
unzip -o pretendard.zip -d pretendard_temp

# 필요한 폰트만 복사 (OTF)
cp pretendard_temp/public/static/Pretendard-Regular.otf .
cp pretendard_temp/public/static/Pretendard-Bold.otf .
cp pretendard_temp/public/static/Pretendard-SemiBold.otf .
cp pretendard_temp/public/static/Pretendard-Light.otf .

# 정리
rm -rf pretendard.zip pretendard_temp

echo "D2Coding 폰트 다운로드 중..."

# D2Coding (코드용)
D2CODING_URL="https://github.com/naver/d2codingfont/releases/download/VER1.3.2/D2Coding-Ver1.3.2-20180524.zip"

curl -L -o d2coding.zip "$D2CODING_URL"
unzip -o d2coding.zip -d d2coding_temp
cp d2coding_temp/D2Coding/D2Coding-Ver1.3.2-20180524.ttf ./D2Coding.ttf

# 정리
rm -rf d2coding.zip d2coding_temp

echo "폰트 다운로드 완료!"
ls -la *.otf *.ttf 2>/dev/null
