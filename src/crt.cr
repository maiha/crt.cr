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

  # change input mode to `cooked`
  def self.cooked
    LibNcursesw.nobreak
    LibNcursesw.noraw
  end

  # change input mode to `cbreak`
  def self.cbreak
    LibNcursesw.cbreak
  end

  # change input mode to `raw`
  def self.raw
    LibNcursesw.raw
  end

  def self.x
    LibNcursesw.getmaxx(stdscr)
  end

  def self.y
    LibNcursesw.getmaxy(stdscr)
  end

  def self.chr_to_int_ACS(c : Char)
    case c
    when '┌' # ACS_ULCORNER
      return 4194412
    when '└' # ACS_LLCORNER
      return 4194413
    when '┐' # ACS_URCORNER
      return 4194411
    when '┘' # ACS_LRCORNER
      return 4194410
    when '─' # ACS_HLINE
      return 4194417
    when '│' # ACS_VLINE
      return 4194424
    else # TODO Add the rest of the ACS chars
      return c.ord
	end
  end
end

require "./crt/**"
