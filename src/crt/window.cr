# coding: utf-8
module Crt
  class Window
    def initialize(r = 24, c = 80, x = 0, y = 0)
      Crt.init
      @winp = LibNcursesw.newwin(r, c, x, y)
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

    def clear
      LibNcursesw.wclear(@winp)
    end
    
    def refresh
      LibNcursesw.refresh
      LibNcursesw.wrefresh(@winp)
    end
  end
end
