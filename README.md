## otus-min-service

### Команды

#### Собрать приложение

Требуется jdk 17  
Приложение будет создано в папке build/libs
```shell
./gradlew bootJar
```

#### Собрать Dockerfile

```shell
docker build --platform linux/amd64 -t otus-min-service .
```

#### Запустить докер из локально собранного 8000 - health, 8080 - minservice/ping

```shell
docker run --name otus-min-service-01 -d -p 8000:8000 -p 8080:8080 otus-min-service
```
#### Тест

```shell
curl --location 'http://localhost:8000/health'
```

```shell
curl --location 'http://localhost:8080/minservice/ping'
```

#### Опубликовать на dockerhub

Сделать таг для публикации.
```shell
docker tag otus-min-service maxmiracle/otus-min-service:1
```

Или пересобрать с новым тегом.
```shell
docker build --platform linux/amd64 -t maxmiracle/otus-min-service:3 .
```

Опубликовать
```shell
docker push maxmiracle/otus-min-service:3
```

Запустить из dockerhub
```shell
docker run --name otus-min-service-01 -d -p 80:8000 maxmiracle/otus-min-service:1
```



### Задание

#### Вариант 1 (С КОДОМ)

##### Шаг 1. Создать минимальный сервис, который

отвечает на порту 8000
имеет http-метод:
GET /health/
RESPONSE: {"status": "OK"}

Примечание: оставил стандартный ответ "UP"

##### Шаг 2. Cобрать локально образ приложения в докер контейнер под архитектуру AMD64.

Запушить образ в dockerhub<br>
На выходе необходимо предоставить

- имя репозитория и тэг на Dockerhub
- ссылку на github c Dockerfile, либо приложить Dockerfile в ДЗ

Обратите внимание, что при сборке на m1 при запуске вашего контейнера на стандартных платформах будет ошибка такого вида:
```
standard_init_linux.go:228: exec user process caused: exec format error
```

Для сборки рекомендую указать тип платформы linux/amd64:
docker build --platform linux/amd64 -t tag

Более подробно можно прочитать в статье: https://programmerah.com/how-to-solve-docker-run-error-standard_init_linux-go219-exec-user-process-caused-exec-format-error-39221/