require "../src/crt"

Crt.init

x = Crt.x
y = Crt.y

tl_window = Crt::Window.new(y // 2, x // 2)
tl_window.border

br_window = Crt::Window.new(y // 2, x // 2, y // 2, x // 2)
br_window.border('|', '|', '-', '-', '+', '+', '+', '+')

[tl_window, br_window].each &.refresh

sleep 10.seconds

Crt.done
