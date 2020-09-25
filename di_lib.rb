=begin
Dee's Interface Library (di_lib)
Scripted User Interface elements fro DragonRuby Game Toolkit

========
The MIT License (MIT)
Copyright © 2020 D Schaedler

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
========

IMPORTANT INFORMATION

di_init must be run before the library can be used
di_init resets all of di_lib's variable in args.state, make sure you're only calling it when you need it.
=end

def di_init args
  args.state.di_button_box = Hash.new
  args.state.di_button_label = Hash.new

  args.state.di_checkboxes = Hash.new

  args.state.di_textstreans = Hash.new

  args.state.di_colors ||= ["black", "white", "red", "lime", "blue", "yellow", "cyan", "magenta", "silver", "grey", "maroon", "olive", "green", "purple", "teal", "navy"]
end

def di_button(args, button_symbol:, string:, posx:, posy:, padding: 10, border_color: "black", text_color: "black", text_size: 0, text_allignment: 0, text_alpha: 255, font_file: "font.tff") #specify and render a new button
  #button_symbol - symbol, must be unique

  string_box = args.gtk.calcstringbox(string)

  args.state.di_button_box[button_symbol] = [posx, posy, string_box[0] + (padding *2), string_box[1] + (padding * 2)] + di_color_rgb(border_color)
  args.state.di_button_label[button_symbol] = [posx + padding, posy + string_box[1] + padding, string, text_size, text_allignment] + di_color_rgb(text_color) + [text_alpha, font_file]

  args.outputs.borders << args.state.di_button_box[button_symbol]
  args.outputs.labels << args.state.di_button_label[button_symbol]
end

def di_button_box_calculate(args, string:, posx:, posy:, padding: 10, text_size: 0, font_file: "font.tff")
  string_box = args.gtk.calcstringbox(string, text_size, font_file)

  return [posx, posy, string_box[0] + (padding * 2), string_box[1] + (padding * 2)]
end

def di_button_clicked(args, click_location, button_symbol) #returns true if click location intersects specified button_box
  #click_location - array, [x,y]
  if (click_location) && (click_location.intersect_rect? args.state.di_button_box[button_symbol])
    return true
  else
    return false
  end
end

def di_checkbox(args, checkbox_symobl:, posx:, posy:, width: 20, height: 20, border_color: "black", fill_color:"black", border_alpha: 255, fill_alpha: 255, state: false)
  border_color = di_color_rgb(border_color)
  fill_color = di_color_rgb(fill_color)

  args.state.di_checkboxes[checkbox_symobl] ||= {
    x:  posx,
    y:  posy,
    w:  width,
    h:  height,
    r:  border_color[0],
    g:  border_color[1],
    b:  border_color[2],
    a:  border_alpha,
    fill_r: fill_color[0],
    fill_g: fill_color[1],
    fill_b: fill_color[2],
    fill_a: fill_alpha,
    state: state
  }

  checkbox = args.state.di_checkboxes[checkbox_symobl]
  if checkbox[:state]
    args.outputs.solids << [posx, posy, width, height]
  end
  args.outputs.primitives << args.state.di_checkboxes[checkbox_symobl].border

  if args.inputs.mouse.click
    click_location = [args.inputs.mouse.click.point.x, args.inputs.mouse.click.point.y]

    if (click_location) && (click_location.intersect_rect? args.state.di_checkboxes[checkbox_symobl])
      checkbox[:state] = !checkbox[:state]
      args.state.di_checkboxes[checkbox_symobl] = checkbox
    end
  end
end

def di_checkbox_get(args, checkbox_symobl)
    checkbox = args.state.di_checkboxes[checkbox_symobl]
    return checkbox[:state]
end

def di_render_textstream(args, textstream_symbol:, posx:, posy:, width:, height:, order:, border_color: "black", font_color: "black", border_alpha: 255, text_alpha: 255, line_spacing: 10 )

  border_color = di_color_rgb(border_color)
  font_color = di_color_rgb(font_color)

  args.outputs.borders << [posx, posy, width, height, border_color[0], border_color[1], border_color[2], border_alpha]

  args.state.di_textstreans[textstream_symbol].each { |string|
    textsize = args.gtk.calcstringbox(string)
    if order == "down"
      args.outputs.labels << [posx + line_spacing, posy + height - line_spacing, string]
      posy = posy - textsize[1]
    elsif order == "up"
      args.outputs.labels << [posx + line_spacing, posy + textsize[1] + line_spacing, string]
      posy = posy + textsize[1]
    else
      #puts "[di_lib][Error:] Incorrect paramater passed for order, assuming down."
      args.outputs.labels << [posx + line_spacing, posy + height - line_spacing, string]
      posy = posy - textsize[1]
    end
  }
end

def reset #Allows the state to be reset at any time by calling this function, also mineutely shortens the call in the console
  $gtk.reset()
end

def di_color_rgb (color)
    color.downcase
    case color
    when "black", "Black"
      return [0, 0, 0]
    when "white", "White"
      return [255, 255, 255]
    when "red", "Red"
      return [255, 0, 0]
    when "lime", "Lime"
      return [0, 255, 0]
    when "blue", "Blue"
      return [0, 0, 255]
    when "yellow", "Yellow"
      return [255, 255, 0]
    when "cyan", "Cyan", "aqua", "Aqua"
      return [0, 255, 255]
    when "magenta", "Magenta", "fuchsia", "Fuchsia"
      return [255, 0, 255]
    when "silver", "Silver"
      return [192, 192, 192]
    when "gray", "Gray", "grey", "Grey"
      return [128, 128, 128]
    when "maroon", "Maroon"
      return [128, 0, 0]
    when "olive", "Olive"
      return [128, 128, 0]
    when "green", "Green"
      return [0, 128, 0]
    when "purple", "Purple"
      return [128, 0, 128]
    when "teal", "Teal"
      return [0, 128, 128]
    when "navy", "Navy"
      return [0, 0, 128]
    else
      puts "[di_lib][di_color_rgb]Input not recognized. returning \"black\" (0, 0, 0)"
      return [0, 0, 0]
    end
end
