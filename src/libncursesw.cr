ifdef linux
  @[Link("ncursesw")]
else
  @[Link("ncurses")]
end

lib LibC
  fun setlocale(cat : Int32, locale : LibC::Char*) : LibC::Char*
end

lib LibNcursesw
  # setlocale
  LC_ALL = 6

  # colors
  COLOR_BLACK   = 0
  COLOR_RED     = 1
  COLOR_GREEN   = 2
  COLOR_YELLOW  = 3
  COLOR_BLUE    = 4
  COLOR_MAGENTA = 5
  COLOR_CYAN    = 6
  COLOR_WHITE   = 7

  type WindowPtr = Void*

  fun initscr : WindowPtr
  fun noecho : Int32
  fun halfdelay(v : Int32) : Int32
  fun nonl : Int32
  fun intrflush(win : WindowPtr, bool : Bool) : Int32
  fun keypad(win : WindowPtr, bool : Bool) : Int32
  fun mouseinterval(v : Int32) : Int32
  fun curs_set(v : Int32) : Int32
  fun start_color : Int32
  fun use_default_colors : Int32
  fun endwin : Int32

  fun newwin(rows : Int32, cols : Int32, x : Int32, y : Int32) : WindowPtr
  fun mvwaddstr(win : WindowPtr, y : Int32, x : Int32, str : LibC::Char*) : Int32
  fun waddstr(win : WindowPtr, str : LibC::Char*) : Int32
  fun wmove(win : WindowPtr, y : Int32, x : Int32) : Int32
  fun refresh : Int32
  fun wrefresh(win : WindowPtr) : Int32
  fun wclear(win : WindowPtr) : Int32
end
