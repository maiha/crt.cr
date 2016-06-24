require "./spec_helper"

describe Crt do
  it "hello world" do
    win = Crt::Window.new(24, 80)
    win.clear
    win.puts("hello world")
    win.refresh
    Crt.done
  end
end
