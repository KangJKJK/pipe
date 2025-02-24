#!/bin/bash

# 터미널 출력 색상 정의
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m'

# 필수패키지 다운로드
sudo apt update && sudo apt upgrade -y
sudo apt install -y curl git build-essential pkg-config libssl-dev unzip
ccurl -L -o pop "https://dl.pipecdn.app/v0.2.8/pop"
chmod +x pop
./pipe.sh
mkdir download_cache

# 노드실행
sudo ./pop