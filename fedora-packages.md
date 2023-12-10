# Настройка Fedora

Из подключенных реп только RPM Fusion(Free, Nonfree)

## Важнейшие CLI-утилиты

```bash
sudo dnf install git ctags tmux fzf ripgrep htop bat tldr mediainfo unar xclip wl-clipboard sox
```
__git__ а куда без него ? \
__ctags__ это теги, не факт что нужно (сейчас LSP использую) \
[__tmux__](https://github.com/tmux/tmux) для вкладок в терминале и скриптов открывающих окна :) \
[__fzf__](https://github.com/junegunn/fzf) для поиска файлов \
[__ripgrep__](https://github.com/BurntSushi/ripgrep) улучшенный grep (будет нужен в NeoVim) \
__htop__ чтоб смотреть процессы \
[__bat__](https://github.com/sharkdp/bat) улучшенный cat / less с подсветкой синтаксиса \
[__tldr__](https://github.com/tldr-pages/tldr-python-client) аналог man, но в стиле коротких шпор \
[__unar__](https://theunarchiver.com/command-line) лучший распаковщик, в 1 команду любые архивы \
__xclip__ работа с буфером обмена(скопировать текст или файл) \
__wl-clipboard__ тоже самое, но для Wayland(нужно для NeoVim!) \
[__sox__](https://sox.sourceforge.net) позволяет проиграть один аудиофайл командой `play`.

### Консольные аудиоплееры

Не факт, что буду ими пользоваться. \
`moc` запускается командой `mocp`. \
Конфиг для `moc` у меня в этом репозитории(каталог .moc)

```bash
sudo dnf install moc cmus
```

### Информация о системе

```bash
sudo dnf install inxi screenfetch neofetch fastfetch cpu-x
```

__fastfetch__ хорош тем, что показывает больше информации,
иногда он может определить шрифт терминала.

## SDK

### C / C++
```bash
sudo dnf install gcc gcc-c++ gdb valgrind
```

### Библиотеки
```bash
sudo dnf install qt-devel libX11-devel check check-devel boost boost-devel freeglut freeglut-devel
```

### PostgreSQL
Взято отсюда(https://www.postgresql.org/download/linux/redhat/)
```bash
sudo dnf install postgresql-server
postgresql-setup --initdb
systemctl enable postgresql.service
systemctl start postgresql.service
```

### Node.js
```bash
sudo dnf install nodejs20 nodejs20-npm
```

### Python
```bash
sudo dnf install python3 python3-devel
```

### .NET
```bash
sudo dnf install dotnet-sdk-6.0 aspnetcore-runtime-6.0
```

Уже есть 7 версия, но 6 вроде бы LTS.
Подробнее [тут](https://learn.microsoft.com/en-us/dotnet/core/install/linux-fedora)

### Java
```bash
sudo dnf install java-11-openjdk-devel java-latest-openjdk-devel
```

Выбрать нужную версию Java, если установлено несколько:
```bash
sudo update-alternatives --config java
```

### Другие
Go, Lua, Free Pascal
```bash
sudo dnf install golang lua fpc
```

### Zeal
```bash
sudo dnf install zeal
```

Прога для чтения документации оффлайн.


## Установка шрифтов JetBrainsMono Nerd Fonts

Распаковать архив.
```bash
unar JetBrainsMonoNerdFonts.tar.xz
```

Все .ttf файлы скопировать в `~/.local/share/fonts/`
```bash
cp ./JetBrainsMonoNerdFonts/*.ttf ~/.local/share/fonts/
```

## Терминалы

```bash
sudo dnf install xterm foot kitty
```

Все 3 терминала нормально работают с __Nerd Fonts__.
Я ставлю все 3 сразу на всякий случай, но использую в основном `foot`.
В последних двух терминалах классный режим открытия ссылок,
похожий на Vimium. В `foot` эта штука работает лучше,
зато в `kitty` есть поддержка лигатур(когда штуки типа => или == показывает одним символом).
А ещё в `kitty` оказалось возможным настроить нативный заголовок окна, для меня
это важно, такой заголовок визуально приятнее. Ещё в `kitty` можно легко посмотреть картинки,
но это уже скорее игрушка, чем полезная фича. Но я наверно на `kitty` перехожу.

## Настройка Gnome

```bash
sudo dnf install dconf dconf-editor gnome-tweaks gnome-extensions-app ffmpegthumbnailer
```
__ffmpegthumbnailer__ вроде бы для того, чтобы миниатюры видео в Nautlius показывались правильно.

## Редакторы кода
NeoVim консольный, GUI и
Gnome-расширение для автоматического переключения языков.
Возможно на других DE поможет пакет `xkb-switch`.

```bash
sudo dnf install g3kb-switch neovim python3-neovim neovim-qt
```


## VeraCrypt
```bash
sudo dnf install https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm
```

## Интернет

```bash
sudo dnf install keepassxc tor firefox chromium telegram-desktop dino discord qbittorrent
```
__Dino__ для XMPP(Jabber)


## Просмотр медиа

Фото, видео, музыка, книги(pdf / djvu и.т.д).

```bash
sudo dnf install qimgv vlc audacious audacious-plugins audacious-plugins-freeworld-ffaudio zathura zathura-plugins-all
```

Возможно пакет `audacious-plugins` не нужен, а возможно пакет ниже. \
`audacious-plugins-freeworld-ffaudio` нужен для проигрывания .m4a \
Возможно в настройках придется включить Settings -> Plugins -> Input -> FFmpeg Plugin

## Работа с CD / DVD (опционально)
```bash
sudo dnf install brasero
```

## Запись видео
```bash
sudo dnf install obs-studio
```
