#!/bin/bash

# Tên của screen
SCREEN_NAME="myscreen"

# Kiểm tra xem screen đã tồn tại hay chưa
if ! screen -list | grep -q "$SCREEN_NAME"; then
    # Nếu không tồn tại, thử tạo screen mới với tên đã chỉ định
    if screen -dmS "$SCREEN_NAME"; then
        echo "Screen created successfully."
    else
        echo "Failed to create screen."
        exit 1
    fi
else
    echo "Screen already exists."
fi

# Gửi một số lệnh vào cửa sổ chính của screen
if screen -S "$SCREEN_NAME" -X stuff $'echo "Hello, this is a test."\n'; then
    echo "Command sent successfully to main window."
else
    echo "Failed to send command to main window."
fi

# Kiểm tra xem lệnh đã được thực thi trong cửa sổ chính hay không
if screen -S "$SCREEN_NAME" -p 0 -X hardcopy -h /dev/stdout | grep -q "Hello, this is a test."; then
    echo "Command executed successfully in main window."
else
    echo "Failed to execute command in main window."
fi
