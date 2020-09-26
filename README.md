# di_lib
Dee's Interface Library: a UI function library written in Ruby for DragonRuby Game Toolkit.

To use this library, drop into ```mygame/lib/``` and add ```require "lib/di_lib.rb"``` at the top of your file.

# Contents
- [di_lib](#di_lib)
- [Contents](#contents)
- [ToDo](#todo)
- [Functions](#functions)
- - [di_init](di_init)
- - [Colors](#colors)
- - - [di_color_rgb](#di_color_rgb)
- - [Buttons](#buttons)
- - - [di_button](#di_button)
- - - [di_button_calculate](#di_button_calculate)

# ToDo
- Document all existing functions
- Readme Table of Contents
- Text processing with scroll

# Functions

### di_init
Initializes state variables that contain query information about the library, as well as variables used by the library.

Arguments:
| Required             | Description                                     |
| -------------------- | ----------------------------------------------- |
| ```args```           | Enables api calls.                              |

| Query Variables                   | Description                                                      |
| --------------------------------- | ---------------------------------------------------------------- |
| ```args.state.di_button_box```    | Hash containing all created button hitboxes.                     |
| ```args.state.di_button_label```  | Hash containing all created button text labels.                  |
| ```args.state.di_checkboxes```    | Hash containing all created checkboxes.                          |
| ```args.state.di_textstreans```   | Hash containing all textstream arrays.                           |
| ```args.state.di_colors```        | Array of all colors accepted by the ```di_color_rgb``` function. |

## Colors
<a name='di_color_rgb'/> ```di_color_rgb``` - returns an array with the RGB values of the color provided. Valid colors are listed in ```args.state.di_colors```. These are the same as the common HTML color codes listed here: https://htmlcolorcodes.com/. Used by almost every other function in the library.

Arguments:
| Required    | Descrpiption                       |
| ----------- | ---------------------------------- |
|```color:``` | String with the name of the color. |

<b> Returns </b> ```[red_value, green_value, blue_value]```
  
```args.state.di_colors ||= ["black", "white", "red", "lime", "blue", "yellow", "cyan", "magenta", "silver", "grey", "maroon", "olive", "green", "purple", "teal", "navy"]```

## Buttons
<a name='di_button'/> ```di_button``` - Specify and render a new button with a text label.

Arguments
| Required             | Description                                     |
| -------------------- | ----------------------------------------------- |
| ```args```           | Enables api calls.                              |
| ```button_symbol:``` | Symbol identifying this button. Must be unique. |
| ```string:```        | String to display on the button.                |
| ```posx:```          | X position of the button.                       |
| ```posy:```          | Y position of the button.                       |

| Optional               | Description                                          | Default |
| ---------------------- | ---------------------------------------------------- | ------- |
| ```padding:```         | Space to pad text from the button border.            | 10      |
| ```border_color:```    | Border color. Accepts strings for ```di_color_rgb``` | "black" |
| ```text_color:```      | Text color. Accepts strings for ```di_color_rgb```   | "black" |
| ```text_size:```       | Text size enumerator, [accepts integers between -10 to +10](https://dragonruby-docs.readthedocs.io/en/latest/02-labels/#font-size). | 0 |
| ```text_allignment:``` | Text allignment, [accepts integers between 0 to 2](https://dragonruby-docs.readthedocs.io/en/latest/02-labels/#alignment).          | 0 |
| ```text_alpha:```      | Text opacity, accepts integers between 0 to 255.     | 255     |
| ```font_file:```       | Font to render text with. [Accepts a string with the path to a font file](https://dragonruby-docs.readthedocs.io/en/latest/02-labels/#custom-font) | "font.tff" | 

<a name='di_button_calculate'/> ```di_button_box_calculate``` - Calculate the size of a button without rendering it.

Arguments:
| Required             | Description                                     |
| -------------------- | ----------------------------------------------- |
| ```args```           | Enables api calls.                              |
| ```string:```        | String to display on the button.                |
| ```posx:```          | X position of the button.                       |
| ```posy:```          | Y position of the button.                       |

| Optional              | Description                                          | Default |
| --------------------- | ---------------------------------------------------- | ------- |
| ```padding:```        | Space to pad text from the button border.            | 10      |
| ```text_size:```       | Text size enumerator, [accepts integers between -10 to +10](https://dragonruby-docs.readthedocs.io/en/latest/02-labels/#font-size). | 0 |
| ```font_file:```       | Font to render text with. [Accepts a string with the path to a font file](https://dragonruby-docs.readthedocs.io/en/latest/02-labels/#custom-font) | "font.tff" | 

<b> Returns </b> ```[posx, posy, width, height]```

```di_button_clicked``` - Determine if the specified button has been clicked.

Arguments:
| Required              | Description                                  |
| --------------------- | -------------------------------------------- |
| ```args```            | Enables api calls.                           |
| ```click_location:``` | Accepts an array of ```[x, y]```             |
| ```button_symbol:```  | Accepts a symbol provided to ```di_button``` |

<b> Returns </b> ```true``` if ```click_location``` is inside the the border of the button. Otherwise <b> returns </b> ```false```
