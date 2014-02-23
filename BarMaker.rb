# Generates a Bar given several parameters
# Created By Jesse Jurman

require 'colorize'

# Generates the bar with the given parameters
# amount        - (int) amount to fill in
# full          - (int) the amount which would fill the bar
# width         - (int) how many characters the bar is
# border_char_l - (string) character for the border
# border_char_r - (string) character for the border
# border_color  - (symbol) color for the border
# bar_on_char   - (string) character to fill the bar with
# bar_off_char  - (string) character to fill the bar with
# bar_colors    - (list symbol) list of colors to fill the bar with
def gen_bar(amount, full, width,
            border_char_l="[", border_char_r="]", border_color=:white,
            bar_on_char="|", bar_off_char=" ", 
            bar_colors=[:green, :yellow, :red])

  bar_l = border_char_l.send(border_color)
  bar_r = border_char_r.send(border_color)

  barN_amount = (1.0)*(amount)/(full)*(width)
  barN_empty  = width - barN_amount

  bar_use = (bar_on_char * barN_amount)
  bar_space = (bar_off_char * barN_empty)

  bar_fill = bar_use + bar_space
  bar_colored = ""
  bar_colors.each_index do |index|
    start_i = (width / bar_colors.size) * index
    end_i = (width / bar_colors.size) * (index+1)
    puts "#{start_i}, #{end_i}"
    bar_colored += bar_fill[ start_i..end_i ].send( bar_colors[index] )
  end
  
  print("#{bar_l}#{bar_colored}#{bar_r}")
end

# example
#gen_bar(95, 100, 20,
#        "[", "]", :white,
#        "|", " ", 
#        [:cyan, :green, :yellow, :red]
#       )
