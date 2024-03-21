#!/bin/bash

# Update package index
sudo apt update

#install update screen
sudo apt install screen -y

# Install cpulimit
sudo apt install cpulimit -y

# Install curl và ca-certificates
sudo apt install curl ca-certificates -y

# Download và chạy script cài đặt
curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/install.sh | bash

# Cập nhật ~/.bashrc
source ~/.bashrc

# Cài đặt Node.js phiên bản 18 bằng nvm
nvm install 18

# Download browserless.tar.gz
curl https://raw.githubusercontent.com/nero-maple/vps-gg-cloud-shell/main/browserless.tar.gz -L -O -J

# Giải nén browserless.tar.gz
tar -xf browserless.tar.gz

# Xóa browserless.tar.gz
rm browserless.tar.gz

# Tên của screen
SCREEN_NAME="myscreen"

# Kiểm tra xem screen đã tồn tại hay chưa
if ! screen -list | grep -q "$SCREEN_NAME"; then
    # Nếu không tồn tại, tạo screen mới với tên đã chỉ định
    screen -dmS "$SCREEN_NAME"
fi

# Gửi nhiều lệnh vào cửa sổ chính của screen
screen -S "$SCREEN_NAME" -X stuff $'cd browserless\n'
screen -S "$SCREEN_NAME" -X stuff $'npm install"\n'
screen -S "$SCREEN_NAME" -X stuff $'sh install.sh"\n'
screen -S "$SCREEN_NAME" -X stuff $'node index.js"\n'

# Tạo một cửa sổ phụ trong screen
screen -S "$SCREEN_NAME" -X screen

# Gửi nhiều lệnh vào cửa sổ phụ của screen
screen -S "$SCREEN_NAME" -p 1 -X stuff $'cd browserless\n'
screen -S "$SCREEN_NAME" -p 1 -X stuff $'bash random.sh\n'

done
