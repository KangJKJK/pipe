#!/bin/bash

# 시스템 업데이트 및 필수 패키지 설치
sudo apt update
sudo apt install -y curl git ufw

# 환경 변수 설정
export WORK="/root/pip"

# 작업 디렉토리 생성
mkdir -p "$WORK"

# pop 바이너리 다운로드
curl -L -o "$WORK/pop" "https://dl.pipecdn.app/v0.2.8/pop"

# pop 바이너리에 실행 권한 부여
chmod +x "$WORK/pop"

# 다운로드 캐시로 사용할 폴더 생성
mkdir -p "$WORK/download_cache"

# 사용자에게 RAM, 디스크, Solana 지갑 주소를 입력받습니다.
read -p "현재 RAM 용량을 입력하세요 (GB): " ram
read -p "사용 가능한 디스크 용량을 입력하세요 (GB): " max_disk
read -p "Solana 지갑 주소를 입력하세요: " pubKey

# 기본 캐시 디렉토리 설정
cache_dir="$WORK/download_cache"

# UFW 기본 정책 설정
sudo ufw default deny incoming
sudo ufw default allow outgoing

# UFW 활성화
sudo ufw enable
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# sudo ./pop 명령어 실행
sudo "$WORK/pop" \
  --ram "$ram" \
  --max-disk "$max_disk" \
  --cache-dir "$cache_dir" \
  --pubKey "$pubKey"
