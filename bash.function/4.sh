# задача со *, 1 сдавшему это задание засчитываю домашку по функциям без защиты
#Представьте, что сумма за пользование услугами такси складывается из
#базового тарифа в размере $4,00 плюс $0,25 за каждые 140 м поездки.
#Напишите функцию, принимающую в качестве единственного параметра
#расстояние поездки в километрах и возвращающую итоговую сумму оплаты такси.
# Решите задание рекурсивной функцией

#!/bin/bash

taxi_payment() {
    local distance=$1

    if (( $(bc <<< "$distance <= 0") )); then
        echo "4.00"
        return
    fi

    local remaining_distance=$(bc <<< "$distance - 0.14")
    local fare=$(bc <<< "0.25 * ($distance / 0.14) + 4.00")

    local recursive_payment=$(taxi_payment $remaining_distance) #вызываем taxi_payment с передачей ей аргумента remaining_distance


    echo "$(bc <<< "$fare + $recursive_payment")"
}

# Ввод расстояния поездки в километрах
read -p "Введите расстояние поездки в километрах: " distance

# Вычисление итоговой суммы оплаты такси
total_payment=$(taxi_payment $distance)

# Вывод результата
printf "Итоговая сумма оплаты такси: $%.2f\n" $total_payment
