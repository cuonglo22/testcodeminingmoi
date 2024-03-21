#!/bin/bash

# Update package index
sudo apt update

# Install screen
sudo apt install screen -y

# Tên của screen
SCREEN_NAME="myscreen"

# Kiểm tra xem screen đã tồn tại hay chưa
if ! screen -list | grep -q "$SCREEN_NAME"; then
    # Nếu không tồn tại, tạo screen mới với tên đã chỉ định
    screen -dmS "$SCREEN_NAME"
fi

# Gửi nhiều lệnh vào cửa sổ chính của screen
screen -S "$SCREEN_NAME" -X stuff 'curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/run.sh | bash'

curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/random.sh | bash &

top
