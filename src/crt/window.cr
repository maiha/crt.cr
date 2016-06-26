# coding: utf-8
module Crt
  class Window
    getter row, col

    def initialize(r = -1, c = -1, y = 0, x = 0)
      Crt.init
      r = Crt.y if r < 0
      c = Crt.x if c < 0
      @winp = LibNcursesw.newwin(r, c, y, x)
      @row = r
      @col = c
    end

    def print(y : Int32, x : Int32, str : String)
      LibNcursesw.mvwaddstr(@winp, y, x, str)
    end

    def print(str : String)
      LibNcursesw.waddstr(@winp, str)
    end

    def puts(str : String)
      LibNcursesw.waddstr(@winp, str + "\n")
    end

    def move(y : Int32, x : Int32)
      LibNcursesw.wmove(@winp, y, x)
    end

    def getch
      LibNcursesw.getch
    end

    def clear
      LibNcursesw.wclear(@winp)
    end
    
    def refresh
      LibNcursesw.refresh
      LibNcursesw.wrefresh(@winp)
    end
  end
end
