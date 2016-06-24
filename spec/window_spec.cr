require "./spec_helper"

describe Crt::Window do
  it "#puts(msg)" do
    win = Crt::Window.new(24, 80)
    win.clear
    win.puts("puts ok")
    win.refresh
    Crt.done
  end

  it "#print(msg)" do
    win = Crt::Window.new(24, 80)
    win.clear
    win.print("print(msg) ok")
    win.refresh
    Crt.done
  end

  it "#print(y,x,msg)" do
    win = Crt::Window.new(24, 80)
    win.clear
    win.print(2, 10, "print(y,x,msg) ok")
    win.refresh
    Crt.done
  end
end
