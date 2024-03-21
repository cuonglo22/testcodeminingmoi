# Biến thời gian bắt đầu vòng lặp
start_time=$(date +%s)

# Delay 5 phút trước khi bắt đầu vòng lặp
sleep 300

while true; do
    # Tạo giới hạn CPU ngẫu nhiên từ 110 đến 165
    new_limit=$(shuf -i 110-165 -n 1)
    limit_time=$(shuf -i 420-1500 -n 1)

    # Áp dụng giới hạn CPU cho tiến trình "chrome"
    pgrep chrome | while read -r pid; do
        cpulimit -p "$pid" -l "$new_limit" &
    done

    # Ngủ trong khoảng thời gian từ 7 đến 25 phút (420 đến 1500 giây)
    sleep "$limit_time"

    # Kiểm tra nếu thời gian chạy vượt quá 12 giờ
    current_time=$(date +%s)
    elapsed_time=$((current_time - start_time))
    if [ "$elapsed_time" -gt $((12 * 3600)) ]; then
        # Kích hoạt lệnh 
        pkill node
        break  # Kết thúc vòng lặp
    fi

    # Kích hoạt việc kill các quá trình cpulimit
    pgrep cpulimit | xargs kill
done