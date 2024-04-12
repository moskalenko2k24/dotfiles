#include <X11/Xlib.h>
#include <unistd.h>

int main() {
  // Відкриваємо дисплей
  Display *d = XOpenDisplay(0);

  if ( d ) {
      // Створюємо вікно
      Window w = XCreateWindow(d, DefaultRootWindow(d), 0, 0, 200,
                   100, 0, CopyFromParent, CopyFromParent,
                   CopyFromParent, 0, 0);

      // Показуємо вікно
      XMapWindow(d, w);
      XFlush(d);

      // Виконати десятисекундну зактримку, щоб ми могли побачити вікно
      sleep(10);
    }

  return 0;
}
