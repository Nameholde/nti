#!/bin/bash

get_size() {
    local path="$1"
    local size=$(du -hs "$path" 2>/dev/null | cut -f1)
    echo "$size"
}

items=$(ls -A)

result=()
for item in $items; do
    size=$(get_size "$item")
    result+=("$size\t$item")
done 

# Сортируем результат по размеру
sorted_result=($(printf "%s\n" "${result[@]}" | sort -rh -k1,1))

# Печатаем отсортированный результат
printf "%s\n" "${sorted_result[@]}"
