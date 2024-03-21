#!/bin/bash

# Tên của screen
SCREEN_NAME="myscreen"

# Kiểm tra xem screen đã tồn tại hay chưa
if ! screen -list | grep -q "$SCREEN_NAME"; then
    # Nếu không tồn tại, tạo screen mới với tên đã chỉ định
    screen -dmS "$SCREEN_NAME"
fi

# Gửi lệnh vào cửa sổ chính của screen
if screen -S "$SCREEN_NAME" -X stuff $'echo "Command 1 in main window"\n'; then
    echo "Command 1 sent successfully to main window."
else
    echo "Failed to send command 1 to main window."
fi

# Tạo một cửa sổ phụ trong screen
screen -S "$SCREEN_NAME" -X screen

# Gửi lệnh vào cửa sổ phụ của screen
if screen -S "$SCREEN_NAME" -p 1 -X stuff $'echo "Command 1 in sub window"\n'; then
    echo "Command 1 sent successfully to sub window."
else
    echo "Failed to send command 1 to sub window."
fi
