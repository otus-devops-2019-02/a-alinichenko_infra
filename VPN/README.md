# Выполнено ДЗ №3

 - [ ] Основное ДЗ
 - [ ] Задание со *

## В процессе сделано:
 - Создал хосты с внешним и внутренним ip;
 - Подсключился по ssh к хосту с внутренним ip через хост с внешним;
 - Создал VPN-сервер


Команда для коннекта одной строкой: ssh -i /root/.ssh/id_rsa -t root@35.205.134.47 -A ssh root@10.132.0.7
bastion_IP = 35.205.134.47
someinternalhost_IP = 10.132.0.7