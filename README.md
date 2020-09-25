# di_lib
Dee's Interface Library: a UI function library written in Ruby for DragonRuby Game Toolkit 

To use this library, drop into ```mygame/lib/``` and add ```require "lib/di_lib.rb"``` at the top of your file.

# ToDo
- Text processing with scroll

# Functions

### di_init(args)
Initializes state variables that contain query information about the library, as well as variables used by the library.

Query Variables:<br>
<B>args.state.di_colors</b> - array of all colors accepted by the di_color_rgb function

## Buttons
def di_button(args, button_symbol:, string:, posx:, posy:, padding: 10, border_color: "black", text_color: "black", text_size: 0, text_allignment: 0, text_alpha: 255, font_file: "font.tff") #specify and render a new button
Required:<br>
args
button_symbol:
