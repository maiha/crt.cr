require "../src/crt"

Crt.init

window = Crt::Window.new(5, 21)
window.print(2, 4, "Hello, world!")
window.refresh

sleep 10.seconds

Crt.done
