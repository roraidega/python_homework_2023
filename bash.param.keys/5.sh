# напишите скрипт который принимает несколько ключей и несколько параметров
# если ключ -n то после него идет имя
# В параметрах передается "к сожалению" и "отчислен"
# и выводит надпись: студент Имя \n к сожалению отчислен

#!/bin/bash

# Пройти по всем аргументам командной строки
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -n) # Если ключ -n, то следующий аргумент является именем
            name="$2"
            shift # Пропускаем следующий аргумент, так как он уже был обработан
            ;;
        *) # Все остальные ключи игнорируем
            ;;
    esac
    shift # Переходим к следующему аргументу
done

echo "Студент $name"
echo "К сожалению отчислен"