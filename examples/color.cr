require "../src/crt"

# Startup
Crt.init
Crt.start_color

# Set up colors
red = Crt::ColorPair.new(Crt::Color::Red, Crt::Color::Default)
blue = Crt::ColorPair.new(Crt::Color::Blue, Crt::Color::Default)
Crt.init_color(Crt::Color::Magenta, 75, 0, 130)
custom = Crt::ColorPair.new(Crt::Color::Magenta, Crt::Color::Default)

# Put stuff on the screen
win = Crt::Window.new
win.attribute_on red
win.print(3, 3, "I'm red!")
win.attribute_on blue
win.print(6, 3, "I'm blue!")
win.attribute_on Crt::Attribute::Reverse
win.print(9, 3, "I'm a custom color")
win.refresh

sleep 10.seconds
win.set_background(Crt::ColorPair.new(Crt::Color::White, Crt::Color::Black))
win.refresh

Crt.done
