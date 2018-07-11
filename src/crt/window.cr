# coding: utf-8
module Crt
  class Window
    getter row, col

    def initialize(@row = -1, @col = -1, y = 0, x = 0)
      Crt.init
      @row = Crt.y if @row < 0
      @col = Crt.x if @col < 0
      @winp = LibNcursesw.newwin(@row, @col, y, x)
    end

    def use_default_colors
      LibNcursesw.use_default_colors
    end

    def attribute_on(attr : (ColorPair | Attribute))
      LibNcursesw.wattron(@winp, attr.value)
    end

    def attribute_off(attr : (ColorPair | Attribute))
      LibNcursesw.wattroff(@winp, attr.value)
    end

    def set_background(pair : ColorPair)
      LibNcursesw.wbkgd(@winp, pair.value)
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

    def start_color
      LibNcursesw.start_color
    end

    def move(y : Int32, x : Int32)
      LibNcursesw.wmove(@winp, y, x)
    end

    def getch
      LibNcursesw.getch
    end

    def mouseinterval(v : Int32)
      LibNcursesw.mouseinterval(v)
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

    def border(ls = '│', rs = '│', ts = '─', bs = '─', tl = '┌', tr = '┐', bl = '└', br = '┘')
      LibNcursesw.wborder(@winp,
        Crt.chr_to_int_ACS(ls),
        Crt.chr_to_int_ACS(rs),
        Crt.chr_to_int_ACS(ts),
        Crt.chr_to_int_ACS(bs),
        Crt.chr_to_int_ACS(tl),
        Crt.chr_to_int_ACS(tr),
        Crt.chr_to_int_ACS(bl),
        Crt.chr_to_int_ACS(br))
    end

    def mvvline(y : Int32, x : Int32, ch = '│', n = @row)
      LibNcursesw.mvwvline(@winp, y, x, Crt.chr_to_int_ACS(ch), n)
    end

    def mvhline(y : Int32, x : Int32, ch = '─', n = @col)
      LibNcursesw.mvwhline(@winp, y, x, Crt.chr_to_int_ACS(ch), n)
    end
  end
end
