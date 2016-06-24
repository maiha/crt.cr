require "./libncursesw"

module Crt
  @@initialized = false
  
  def self.stdscr : LibNcursesw::WindowPtr
    unless @@initialized
      raise "Crt is not initialized yet"
    end
    return @@stdscr.not_nil!
  end

  # TODO: color
  def self.init
    return if @@initialized

    LibC.setlocale(LibNcursesw::LC_ALL, "")
    
    @@stdscr = LibNcursesw.initscr
    @@initialized = true
    LibNcursesw.noecho

    LibNcursesw.halfdelay(1)
    LibNcursesw.nonl
    LibNcursesw.intrflush(stdscr, false)
    LibNcursesw.keypad(stdscr, true)
    LibNcursesw.curs_set(0)

    at_exit{ Crt.done }
  end

  def self.done
    if @@initialized
      LibNcursesw.curs_set(1)
      LibNcursesw.endwin
      @@initialized = false
    end
  end
end

require "./crt/**"
