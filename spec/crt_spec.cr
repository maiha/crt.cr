require "./spec_helper"

describe Crt do
  Crt.init

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

  # just compile for avoiding dead codes
  describe "(modes)" do
    it "cbreak" do
      Crt.cbreak
    end

    it "raw" do
      Crt.raw
    end

    it "cooked" do
      Crt.cooked
    end
  end
end
