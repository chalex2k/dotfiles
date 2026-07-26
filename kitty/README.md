# Kitty

Здесь хранится текущая конфигурация терминала [Kitty](https://sw.kovidgoyal.net/kitty/).
Файл `kitty.conf` подключает тему **Everforest Dark Medium** из
`current-theme.conf`. Остальные параметры в `kitty.conf` оставлены значениями
по умолчанию и приведены там как комментарии-справка.

## Установка на Ubuntu

Установите Kitty и [GNU Stow](https://www.gnu.org/software/stow/). Stow — это
программа для управления dotfiles: она создаёт символические ссылки из
репозитория в домашнюю директорию.

```bash
sudo apt update
sudo apt install kitty stow
```

## Применение конфигурации

Из директории `dotfiles` выполните:

```bash
stow --target "$HOME" kitty
```

Команда создаст ссылки `~/.config/kitty/kitty.conf` и
`~/.config/kitty/current-theme.conf` на файлы из репозитория. Если такие файлы
уже существуют, Stow остановится с сообщением о конфликте. В этом случае
сначала сохраните или удалите старую конфигурацию, затем повторите команду.

После этого перезапустите Kitty.
