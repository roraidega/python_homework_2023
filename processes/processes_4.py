"""
Запустите фоновый процесс который следит за сроком подписки пользователя( для примера 10 секунд) если время подписки вышло выведите надпись "Ваша подписка закончилась."
и завершите работу программы. В основной программе сыграйте с пользователем в игру "угадай число".
"""
import time
import multiprocessing

# Функция для отслеживания времени подписки
def check_subscription():
    time.sleep(10)
    print("Ваша подписка закончилась.")
    exit()

# Запускаем процесс для отслеживания времени подписки
p = multiprocessing.Process(target=check_subscription)
p.start()

# Игра "угадай число"
number = 7
while True:
    guess = int(input("Угадайте число от 1 до 10: "))
    if guess == number:
        print("Вы угадали!")
        break  # выходим из цикла
    else:
        print("Неправильно, попробуйте еще раз.")

# Завершаем процесс отслеживания времени подписки
p.terminate()


