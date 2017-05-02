require "./spec_helper"

describe "LibNcursesw" do
  it "well known initialization" do
    LibC.setlocale(LibNcursesw::LC_ALL, "")
    LibNcursesw.initscr
    LibNcursesw.noecho
    LibNcursesw.cbreak
    LibNcursesw.curs_set(1)
  end
end
