# Week 03. GraalVM Task (Slurm Навыкум "Build Containers!")

## Задача

Есть проект на чистой Java 17

Проект использует [Native Image](https://www.graalvm.org/native-image/) и [Maven Native Plugin](https://graalvm.github.io/native-build-tools/latest/maven-plugin.html) для компиляции в бинарный исполняемый файл формата ELF

### Сборка

Для сборки нужно использовать [GraalVM CE Image](https://github.com/graalvm/container/pkgs/container/graalvm-ce/65493297?tag=22.3.1)

Сборка проходит стандартным образом, через `mvn verify` с указанием профиля `native`, на выходе &ndash; `target/native.bin`:
```shell
file target/native.bin
target/native.bin: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked
```

### API

Сервер запускается на порту, указанном через параметр `port` и реагирует на команду `UUID`, выдавая в ответ случайный `UUID`

### Что нужно сделать

1. Собрать всё с помощью Maven и Native Image (параллелить ничего не нужно, т.к. в приложении нет авто-тестов, проверок стиля кода и т.д.)
2. Упаковать всё в [`Scratch`](https://hub.docker.com/_/scratch)
3. Выложить всё в виде публичного образа на GHCR (GitHub Container Registry)

**Важно**: в данном сценарии мы предполагаем, что наш разработчик "не особо разговорчив" и не любит давать детальные объяснения, к сожалению, такое бывает 🙁