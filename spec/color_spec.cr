require "./spec_helper.cr"

describe Crt do
  Crt.init

  it ".start_color" do
    Crt.start_color
  end

  it "Makes colored window" do
    win = Crt::Window.new
    win.clear
    red = Crt::ColorPair.new(Crt::Color::Red, Crt::Color::Default)

    win.attribute_on red
    win.puts "I'm red"
    win.refresh
  end
end
