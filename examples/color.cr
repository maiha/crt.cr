require "../src/crt"

Crt.init
Crt.start_color
Crt.init_color(Crt::Color::Magenta, 75, 0, 130)

red = Crt::ColorPair.new(Crt::Color::Red, Crt::Color::Default)
custom = Crt::ColorPair.new(Crt::Color::Magenta, Crt::Color::Default)

window = Crt::Window.new
window.attribute_on red
window.print(3, 3, "I'm red!")
window.attribute_on custom
window.print(6, 3, "I'm a custom color!")
window.refresh

sleep 10.seconds

Crt.done
