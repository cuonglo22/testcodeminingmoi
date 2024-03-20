#!/bin/bash

# Update package index
sudo apt update

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

# Di chuyển đến thư mục browserless
cd browserless

# Cài đặt các gói npm
npm install

# Chạy script cài đặt (nếu có)
sh install.sh

# Cài đặt PM2 phiên bản 5.3.1
npm install -g pm2@5.3.1

# Khởi động ứng dụng theo tập tin cấu hình ecosystem.config.js bằng PM2
pm2 start ecosystem.config.js

# Chờ 10 giây trước khi thực thi script random.sh
sleep 10

# Thực hiện script random.sh
bash random.sh
