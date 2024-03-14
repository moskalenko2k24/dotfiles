# Настройка Fedora

Из подключенных реп только RPM Fusion(Free, Nonfree)

## Must-have CLI
```bash
sudo dnf install git gh curl ctags tmux fzf ripgrep htop bat tldr mediainfo unar xclip wl-clipboard sox speedtest-cli ddgr inxi screenfetch neofetch fastfetch cpu-x kitty g3kb-switch lua neovim python3-neovim gcc gcc-c++ gdb valgrind cmake nodejs nodejs-npm python3 python3-devel
```

<details>
  <summary>Описание CLI-утилит</summary>

  __git__ а куда без него ? \
  __gh__ [GitHub CLI](https://cli.github.com) \
  [__curl__](https://github.com/curl/curl) он есть обычно, но на всякий случай \
  __ctags__ это теги, не факт что нужно (сейчас LSP использую) \
  [__tmux__](https://github.com/tmux/tmux) для вкладок в терминале и скриптов открывающих окна :) \
  [__fzf__](https://github.com/junegunn/fzf) для поиска файлов \
  [__ripgrep__](https://github.com/BurntSushi/ripgrep) улучшенный grep (будет нужен в NeoVim) \
  __htop__ чтоб смотреть процессы \
  [__bat__](https://github.com/sharkdp/bat) улучшенный cat / less с подсветкой синтаксиса \
  [__tldr__](https://github.com/tldr-pages/tldr-python-client) аналог man, но в стиле коротких шпор \
  [__unar__](https://theunarchiver.com/command-line) лучший распаковщик, в 1 команду любые архивы \
  [__xclip__](https://github.com/astrand/xclip) работа с буфером обмена в X11 = скопировать текст или файл \
  [__wl-clipboard__](https://github.com/bugaevc/wl-clipboard) тоже самое, но для Wayland(нужно для NeoVim!) \
  [__sox__](https://sox.sourceforge.net) позволяет проиграть один аудиофайл командой `play` \
  [__speedtest-cli__](https://github.com/sivel/speedtest-cli) утилита для проверки скорости интернета \
  [__ddgr__](https://github.com/jarun/ddgr) поиск через DuckDuckGo \
  [__inxi__](https://smxi.org/docs/inxi.htm) утилита, с помощью которой можно узнать подробную информацию о системе и железе \
  [__screenfetch__](https://github.com/KittyKatt/screenFetch) общая информация о системе(CPU, GPU, RAM и.т.д) \
  [__neofetch__](https://github.com/dylanaraps/neofetch) тоже самое и тоже на Bash \
  [__fastfetch__](https://github.com/fastfetch-cli/fastfetch) _like neofetch, but much faster_, чуть больше инфы, например может показать шрифт терминала \
  [__kitty__](https://sw.kovidgoyal.net/kitty/) мой любимый терминал \
  [__CPU-X__](https://github.com/TheTumultuousUnicornOfDarkness/CPU-X) утилита с графическим интерфейсом, аналогичная CPU-Z на Windows, показывает подробную инфу о процессоре \
  [__g3kb-switch__](https://github.com/lyokha/g3kb-switch) утилита для автоматического переключения языков в Vim(с помощью плагина xkb-switch), версия для Gnome \
  __lua neovim python3-neovim__ набор пакетов для установки NeoVim, Lua и так в комплекте, но ставлю его отдельно, чтоб сам Lua можно было поизучать \
  __gcc gcc-c++ gdb valgrind cmake__ базовый набор для __C / C++__: компиляторы, отладчик [GDB](https://sourceware.org/gdb/), утилита поиска ошибок работы с памятью [Valgrind](https://valgrind.org), [CMake](https://cmake.org) для сборки \
  __nodejs nodejsnpm__ [__Node.js__](https://nodejs.org/en) и [Node Package Manager](https://www.npmjs.com) \
  __python3 python3-devel__ [__Python__](https://www.python.org) и на всякий случай devel-файлы(кажется нужно для связки Python + C++)
</details>

### Установка JetBrainsMono Nerd Fonts

Распаковать архив, скопировать каталог в `~/.local/share/fonts/`
```bash
unar JetBrainsMonoNerdFonts.tar.xz && mkdir -p ~/.local/share/fonts && cp -r ./JetBrainsMonoNerdFonts ~/.local/share/fonts/
```

### Терминалы

Мои любмые это [__kitty__](https://sw.kovidgoyal.net/kitty/),
[__foot__](https://codeberg.org/dnkl/foot), [__xterm__](https://invisible-island.net/xterm/).
Все 3 терминала нормально работают с __Nerd Fonts__.
Иногда ставлю все 3 сразу на всякий случай, но использую в основном `kitty`.
В последних двух терминалах классный режим открытия ссылок,
похожий на Vimium. В `foot` эта штука работает лучше,
зато в `kitty` есть поддержка лигатур(когда штуки типа => или == показывает одним символом).
А ещё в `kitty` оказалось возможным настроить нативный заголовок окна, для меня
это важно, такой заголовок визуально приятнее. Ещё в `kitty` можно легко посмотреть картинки,
но это уже скорее игрушка, чем полезная фича.

### Консольные аудиоплееры

Не факт, что буду ими пользоваться. \
`moc` запускается командой `mocp`. \
Конфиг для `moc` у меня в этом репозитории(каталог .moc)

```bash
sudo dnf install moc cmus
```

## Must-have для настройки Gnome

```bash
sudo dnf install dconf dconf-editor gnome-tweaks gnome-extensions-app gnome-shell-extension-appindicator ffmpegthumbnailer
```
__ffmpegthumbnailer__ вроде бы для того, чтобы миниатюры видео в Nautlius показывались правильно.

## Must-have GUI

Фото, видео, музыка, книги(pdf / djvu и.т.д), браузеры, клиенты для чатов

```bash
sudo dnf install keepassxc tor firefox telegram-desktop dino discord qbittorrent qt5-qtimageformats qimgv vlc audacious audacious-plugins audacious-plugins-freeworld-ffaudio zathura zathura-plugins-all
```

Возможно пакет `audacious-plugins` не нужен, а возможно пакет ниже. \
`audacious-plugins-freeworld-ffaudio` нужен для проигрывания .m4a \
Возможно в настройках придется включить Settings -> Plugins -> Input -> FFmpeg Plugin.

`qt5-qtimageformats` нужен чтоб в qimgv нормально отображались .webp файлы. Идею взял
[отсюда](https://github.com/easymodo/qimgv/issues/439).

## VeraCrypt
```bash
sudo dnf install https://launchpad.net/veracrypt/trunk/1.25.9/+download/veracrypt-1.25.9-CentOS-8-x86_64.rpm
```

## Удаление ненужного
```bash
sudo dnf remove loupe rhythmbox totem gnome-text-editor
```
<details>
  <summary>Удаление лишнего</summary>

  __totem__ = GNOME Videos \
  __loupe__ = GNOME Images \
  __rhythmbox__ = музыкальный плеер \
  __gnome-text-editor__ = текстовый редактор
</details>

## Ещё для разработки, опционально

### Пакеты ЯП(SDK)

__golang__ = [Go](https://go.dev) \
__rust__ = [Rust](https://www.rust-lang.org) \
__ghc__ = [Glasgow __Haskell__ Compiler](https://www.haskell.org/ghc/) \
__fpc__ = [__Free Pascal__ Compiler](https://www.freepascal.org)

### Пакеты библиотек
__qt-devel__ про QT кто не знает ? \
__libX11-devel__ = [Xlib](https://www.x.org/releases/current/doc/libX11/libX11/libX11.html) = _C Language X Interface_ \
__boost boost-devel__ = [__Boost__](https://www.boost.org) = на все случаи жизни :D \
__check check-devel__ = [__Check__](https://libcheck.github.io/check/) = _unit testing framework for C_ \
__freeglut freeglut-devel__ = [__Freeglut__](https://github.com/freeglut/freeglut) = _Free OpenGL Utility Toolkit_ \
__SFML SFML-devel__ = [__SFML__](https://www.sfml-dev.org) = _Simple and Fast Multimedia Library_

### PostgreSQL
Взято [отсюда](https://www.postgresql.org/download/linux/redhat/)
```bash
sudo dnf install postgresql-server
postgresql-setup --initdb
systemctl enable postgresql.service
systemctl start postgresql.service
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

Вместо 11 можно выбрать любую версию, а можно поставить просто latest.
Выбрать нужную версию Java, если установлено несколько можно вот так:
```bash
sudo update-alternatives --config java
```

## Разные пакеты, опционально
[__zeal__](https://zealdocs.org) _offline documentation browser for software developers_ \
[__sourcetrail__](https://github.com/CoatiSoftware/Sourcetrail) создание UML по исходному коду \
[__texlive-scheme-full__](https://www.tug.org/texlive/) полный комплект всего что нужно для работы с TeX / LaTeX \
[__texstudio__](https://www.texstudio.org) _integrated writing environment for creating LaTeX documents_ \
[__obs-studio__](https://obsproject.com) _free and open source software for video recording and live streaming_ \
[__brasero__](https://gitlab.gnome.org/GNOME/brasero) работа с CD / DVD
