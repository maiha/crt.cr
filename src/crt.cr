require "./libncursesw"

module Crt
  @@initialized = false
  @@colors_on = false
  
  def self.stdscr : LibNcursesw::WindowPtr
    unless @@initialized
      raise "Crt is not initialized yet"
    end
    return @@stdscr.not_nil!
  end

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

  def self.start_color
	result = LibNcursesw.start_color
	unless result == -1
		@@colors_on = true
		LibNcursesw.use_default_colors
	end
  end

  def self.init_color(color : Color, r : Int, g : Int, b : Int)
		(r * 1000 / 255).clamp(0..1000)
		(g * 1000 / 255).clamp(0..1000)
		(b * 1000 / 255).clamp(0..1000)
		LibNcursesw.init_color(color.value, r, g, b)
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
    when '├' # ACS_LTEE
      return 4194420
    when '┤' # ACS_RTEE
      return 4194421
    when '┴' # ACS_BTEE
      return 4194422
    when '┬' # ACS_TTEE
      return 4194423
    when '─' # ACS_HLINE
      return 4194417
    when '│' # ACS_VLINE
      return 4194424
    when '┼' # ACS_PLUS
      return 4194414
    # Can't find equivalent to ACS_S1
    # Can't find equivalent to ACS_S9
    when '◆'
      return 4194400
    when '▒' # ACS_CKBOARD
      return 4194401
    when '°' # ACS_DEGREE
      return 4194406
    when '±' # ACS_PLMINUS
      return 4194407
    when '•' # ACS_BULLET
      return 4194430
    # ACS_LARROW should be covered by the default '<'
    # ACS_RARROW should be covered by the default '>'
    # ACS_DARROW should be covered by the default 'v'
    # ACS_UARROW should be covered by the default '^'
    # ACS_BOARD  should be covered by the default '#'
    when '␋' # ACS_LANTERN
      return 4194409
    # ACS_BLOCK is the same as ACS_BOARD
    when '≤' # ACS_LEQUAL
      return 4194425
    when '≥' # ACS_GEQUAL
      return 4194426
    when 'π' # ACS_PI
      return 4194427
    when '≠' # ACS_NEQUAL
      return 4194428
    when '£' # ACS_STERLING
      return 4194429
    else
      return c.ord
    end
  end
  
  # TODO Figure out how to support 256 colors
  enum Color
	  Default = -1
	  Black = 0
	  Red = 1
	  Green = 2
  	  Yellow = 3
	  Blue = 4
	  Magenta = 5
	  Cyan = 6
	  White = 7
  end

  # TODO Make sure these are the same across multiple systems/terminals
  enum Attribute
	Normal = 0
	Altcharset = 4194304
	Blink = 524288
	Bold = 2097152
	Dim = 1048576
	Invis = 8388608
	Protect = 16777216
	Reverse = 262144
	Standout = 65536
	Underline = 131072
  end
end

require "./crt/**"
