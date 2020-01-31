---
title: "How I Work"
date: 2020-01-31T13:50:41+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["tools"]
description: "my setup"
showFullContent: false
---

# tl;dr

I use a lot of tools.  

I've spend a lot of time trying to save time, I'm pretty sure I should read this [xkcd:1205](https://xkcd.com/1205/) next time I want to save time.

# alfred
Alfred is a powerhouse, it's my personal assistant. I've used since I started using macs about 10 years ago. The most important things I make it do are:

- generate random strings
- quick math
- open projects in VSCode
- generate UUIDs
- get emoji's for pasting in my commit messages
- quickly open github pages for the projects I visit the most

Most of these I use at least once or twice a day, so I've probably haven't even saved any time setting them up so far, but it feels really good when I quickly open a project with just a few presses on the keyboard when a colleague is standing next to me 😁.

I've found that I'm not using alfred that often for launching applications, mostly because I leave my firefox and editor open most days anyway.  

---

# editors setup

## vscode

I use VSCode for most of my dayjob coding, and the most important extensions I use are:

### Remote - SSH
For some projects I want to be able to edit them on the go if I have an idea. These projects are setup on a server running in my home and I use the remote ssh extension to edit them with vscode. And, if needed, I can also ssh into this machine and use neovim to edit them directly.

### Settings Sync
I've found that I switch machines more often then I'd like to admin, as I'm on my fourth laptop in 3 years. And settings sync has allowed every switch to be almost painless.

### Code Spell Checker
It's just very convenient to have spell check available in your editor. Even though I have to add at least 20 project specific words / abbreviations to every project, it's still totally worth it to catch the easy spellign errors.


### Vim
I should have probably started with this one. Since I started using vim about 10 years ago my muscle memory doesn't allow me to use other keyboard schemes anymore. My google docs documents are littered with cc's and dG's. Not to mention the plethora of random j's showing up literally everywhere.

---

## neovim
I've setup neovim as well because sometimes it's just more convenient to not leave the command line, especially when working on multiple projects / directories at a time. For neovim, the most important plugins I use are:

### fzf / fzf.vim
With an alias of `<leader>f` I can quickly call upon a file finder that is incredibly fast thanks to fd and fzf. Even running from my root directory I can find all files I want with milliseconds (I'm probably not that fast, but fd is)

### coc / languageclient / vim-go
Plugins to make efficient use of the go language server. I think `gd` to go to a definition and `ctrl+o` to go back are probably my most used shortcuts.

### vim-airline / vim-airline-themes / vim-nightfly-guicolors
Mainly eye-candy, but also very useful for a quick overview of filetype, line number and open buffers

### NERDtree
I still have it installed, but I don't use quite that often anymore.

----

# firefox
I use firefox pretty much like everyone else should, the main reason for switching to firefox after years of chrome usage are the containers. Together with the excellent temporary containers extension it allows me to easily log in to multiple google, office 365 and AWS accounts at a time.

----

# tmux
I've used tmux for as long I can remember now, I have a tmux.conf that has become so much part of me that I often mess up when using a plain terminal.  
The way I can easily split views on both local and remote connections and re-enter them at a later time have made `s` the first command I enter on any ssh connection, which is present in any .bashrc and .zshrc as: `alias s='tmux attach -d || tmux new'`

---

# fzf / fd / bat
I use fzf and fd extensively to quickly find and edit files on my device, I have these functions defined in my .bashrc / .zshrc

```bash
# proj - open project with VSCode
proj() {
  local dir
  dir=$(fd --full-path ~/ -t d 2> /dev/null | fzf +m) &&
  code "$dir" 
  #and on my headless machine
  #cd "$dir" && vi . +":Files" && cd - 
}

# e - edit file in neovim
e() {
  export FZF_DEFAULT_COMMAND='fd -t f -H'
  vi $(fzf)
}
```

So for quick edits to my vim config (`~/.config/nvim/init.vim`) I can do:
```
$ e
# nvini<enter>
```



# tools
- fzf
- fd
- bat
- neovim
- tmux
- iterm2
- firefox
- microsoft To Do
- alfred
