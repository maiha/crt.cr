require "../src/crt"

Crt.init
x = Crt.x
y = Crt.y
tlwin = Crt::Window.new(y / 2, x / 2)
brwin = Crt::Window.new(y / 2, x / 2, y / 2, x / 2)
tlwin.border
brwin.border('l', 'l', '-', '-', '+', '+', '+', '+')
brwin.refresh
tlwin.refresh
loop do
end
Crt.done
