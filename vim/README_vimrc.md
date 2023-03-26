# vimrc and its configs - plugins and so on ...

## At first install Vundle for adding the plugins :

> `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

## Use vimrc file 
> create a file named .vimrc in your home directory </br>
> `touch /home/$USER/.vimrc` </br>
> then copy its content to that file </br>

## install plugins 

> open the file with vim and do `:PluginInstall` in command mode. </br>
> wait until all plugin finish installing and it say Done.
![PluginInstall](https://github.com/alimehr75/Linux-Config/blob/master/Vim/PluginInstall.png?raw=true)

### For install the YCM plugin you can do it manually:

[YouCompleteMe: a code-completion engine for Vim](https://github.com/ycm-core/YouCompleteMe#installation)

[Installation in Linux 64-bit](https://github.com/ycm-core/YouCompleteMe#linux-64-bit)


## OneDark Theme 

[one-dark theme](https://github.com/alimehr75/Linux-Config/blob/master/Vim/onedark.vim)

> For adding this theme to your vim : </br>
> `mkdir /home/$USER/.vim/autoload` </br>
> Copy the file to the created directory 




```

" [onedark.vim](https://github.com/joshdick/onedark.vim/)

let s:overrides = get(g:, "onedark_color_overrides", {})

let s:colors = {
      \ "red": get(s:overrides, "red", { "gui": "#E06C75", "cterm": "204", "cterm16": "1" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "#BE5046", "cterm": "196", "cterm16": "9" }),
      \ "green": get(s:overrides, "green", { "gui": "#98C379", "cterm": "114", "cterm16": "2" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "#E5C07B", "cterm": "180", "cterm16": "3" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "#D19A66", "cterm": "173", "cterm16": "11" }),
      \ "blue": get(s:overrides, "blue", { "gui": "#61AFEF", "cterm": "39", "cterm16": "4" }),
      \ "purple": get(s:overrides, "purple", { "gui": "#C678DD", "cterm": "170", "cterm16": "5" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "#56B6C2", "cterm": "38", "cterm16": "6" }),
      \ "white": get(s:overrides, "white", { "gui": "#ABB2BF", "cterm": "145", "cterm16": "15" }),
      \ "black": get(s:overrides, "black", { "gui": "#282C34", "cterm": "235", "cterm16": "0" }),
      \ "foreground": get(s:overrides, "foreground", { "gui": "#ABB2BF", "cterm": "145", "cterm16": "NONE" }),
      \ "background": get(s:overrides, "background", { "gui": "#282C34", "cterm": "235", "cterm16": "NONE" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "#5C6370", "cterm": "59", "cterm16": "7" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "#4B5263", "cterm": "238", "cterm16": "8" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "#2C323C", "cterm": "236", "cterm16": "0" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "#3E4452", "cterm": "237", "cterm16": "8" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "#3E4452", "cterm": "237", "cterm16": "7" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "#3B4048", "cterm": "238", "cterm16": "7" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "#3E4452", "cterm": "59", "cterm16": "7" }),
      \}

function! onedark#GetColors()
  return s:colors
endfunction
```
![OneDark Theme](https://github.com/alimehr75/Linux-Config/blob/master/Vim/OneDark_Theme.png?raw=true)


## Vim & Yaml 
> vim has a little problem with yaml,yml files  
### [yaml.vim : Syntax coloring and functions for YAML](https://www.vim.org/scripts/script.php?script_id=739)

### Here is the above file script 

```vim
" To make this file do stuff, add something like the following (without the
" leading ") to your ~/.vimrc:
" au BufNewFile,BufRead *.yaml,*.yml so ~/src/PyYaml/YAML.vim

" Vim syntax/macro file
" Language: YAML
" Author: Igor Vergeichik <iverg@mail.ru>
" Sponsor: Tom Sawyer <transami@transami.net>
" Stayven: Ryan King <jking@panoptic.com>
" Copyright (c) 2002 Tom Saywer

" Add an item to a gangly list:
"map , o<bs><bs><bs><bs>-<esc>o
" Convert to Canonical form:
"map \c :%!python -c 'from yaml.redump import redump; import sys; print redump(sys.stdin.read()).rstrip()'

if version < 600 
  syntax clear
elseif exists("b:current_syntax")
  finish
endif
syntax clear

syn match yamlDelimiter "[:,-]"
syn match yamlBlock "[\[\]\{\}\|\>]"
syn match yamlOperator "[?^+-]\|=>"

syn region yamlComment  start="\#" end="$"
syn match yamlIndicator "#YAML:\S\+"

```

### [Wrong indentation when editing Yaml in Vim](https://stackoverflow.com/questions/26962999/wrong-indentation-when-editing-yaml-in-vim)

