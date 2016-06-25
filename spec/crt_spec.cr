require "./spec_helper"

describe Crt do
  it "hello world" do
    win = Crt::Window.new(24, 80)
    win.clear
    win.puts("hello world")
    win.refresh
  end

  it ".x" do
    (Crt.x > 0).should be_true
  end

  it ".y" do
    (Crt.y > 0).should be_true
  end
end
