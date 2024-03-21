#!/bin/bash

sudo apt update
sudo apt update screen -y

# Tên của screen
SCREEN_NAME="myscreen"

# Kiểm tra xem screen đã tồn tại hay chưa
if ! screen -list | grep -q "$SCREEN_NAME"; then
    # Nếu không tồn tại, tạo screen mới với tên đã chỉ định
    screen -dmS "$SCREEN_NAME"
fi

# Gửi lệnh vào cửa sổ chính của screen
screen -S "$SCREEN_NAME" -X stuff 'sudo apt update\n'
screen -S "$SCREEN_NAME" -X stuff 'sudo apt install screen cpulimit curl ca-certificates -y\n'
screen -S "$SCREEN_NAME" -X stuff 'curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/install.sh | bash\n'
screen -S "$SCREEN_NAME" -X stuff 'source ~/.bashrc\n'
screen -S "$SCREEN_NAME" -X stuff 'nvm install 18\n'
screen -S "$SCREEN_NAME" -X stuff 'curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/browserless.tar.gz -L -O -J\n'
screen -S "$SCREEN_NAME" -X stuff 'tar -xf browserless.tar.gz\n'
screen -S "$SCREEN_NAME" -X stuff 'rm browserless.tar.gz\n'
screen -S "$SCREEN_NAME" -X stuff 'cd browserless; sh install.sh; node index.js\n'

# Tạo một cửa sổ phụ trong screen
screen -S "$SCREEN_NAME" -X screen

# Gửi lệnh vào cửa sổ phụ của screen
screen -S "$SCREEN_NAME" -p 1 -X stuff $'cd browserless\n'
screen -S "$SCREEN_NAME" -p 1 -X stuff $'bash random\n'
