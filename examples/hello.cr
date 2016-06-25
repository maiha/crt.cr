require "../src/crt"

win = Crt::Window.new(24, 80)
win.clear
win.print(5, 10, "hello world")
win.refresh
Crt.done
