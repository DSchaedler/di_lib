# di_lib
Dee's Interface Library: a UI function library written in Ruby for DragonRuby Game Toolkit.

To use this library, drop into ```mygame/lib/``` and add ```require "lib/di_lib.rb"``` at the top of your file.

# Contents
- [di_lib](#di_lib)
- [Contents](#contents)
- [ToDo](#todo)
- [Constants](#constants)
- [Functions](#functions)
  - [di_init](di_init)
  - [Buttons](#buttons)
    - [di_button](#di_button)
    - [di_button_calculate](#di_button_calculate)
    - [di_button_clicked](#di_button_clicked)
  - [Checkboxes](#checkboxes)
    - [di_checkbox](#di_checkbox)
    - [di_checkbox_get](#di_checkbox_get)

# ToDo
- Document all existing functions
- Text processing with scroll

# Constants
DI_COLORS - Hash of type ```{:colorname => [red, green, blue]}```. Frequently referenced throughout the rest of the Library. <br>
ex: ```{:red => [255, 0, 0]}```

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
| ```border_color:```    | Border color. Accepts symbols for ```DI_COLORS``` | "black" |
| ```text_color:```      | Text color. Accepts symbols for ```DI_COLORS```   | "black" |
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

<a name='di_button_clicked'/> ```di_button_clicked``` - Determine if the specified button has been clicked.

Arguments:
| Required              | Description                                  |
| --------------------- | -------------------------------------------- |
| ```args```            | Enables api calls.                           |
| ```click_location:``` | Accepts an array of ```[x, y]```             |
| ```button_symbol:```  | Accepts a symbol provided to ```di_button``` |

<b> Returns </b> ```true``` if ```click_location``` is inside the the border of the button. Otherwise <b> returns </b> ```false```

## Checkboxes
<a name='di_checkbox'/> ```di_checkbox``` - Specifies and renders a checkbox; updates the checkbox value if clicked.

Arguments:
| Required               | Description                                       |
| ---------------------- | ------------------------------------------------- |
| ```args```             | Enables api calls.                                |
| ```checkbox_symbol:``` | Symbol identifying this checkbox. Must be unique. |
| ```posx::```           | X position of the checkbox.                       |
| ```posy::```           | Y position of the checkbox.                       |

| Optional            | Description                                          | Default |
| ------------------- | ---------------------------------------------------- | ------- |
| ```width:```        | Checkbox width.                                      | 20      |
| ```height:```       | Checkbox height.                                     | 20      |
| ```border_color:``` | Border color. Accepts symbols for ```DI_COLORS``` | "black" |
| ```fill_color:```   | Fill color. Accepts symbols for ```DI_COLORS```   | "black" |
| ```border_alpha:``` | Border opacity, accepts integers between 0 to 255.   | 255     |
| ```fill_alpha:```   | Fill opacity, accepts integers between 0 to 255.     | 255     |
| ```state:```        | Check or Unchecked, accepts boolean values.          | false   |

<a name='di_checkbox_get'/> ```di_checkbox_get``` - Returns the current state of the specified checkbox.

Arguments:
| Required              | Description                                    |
| --------------------- | ---------------------------------------------- |
| ```args```            | Enables api calls.                             |
| ```checkbox_symbol``` | Accepts a symbol provided to ```di_checkbox``` |

<b> Returns </b> ```true``` if ```state:``` is true for this checkbox. Otherwise <b> returns </b> ```false```
