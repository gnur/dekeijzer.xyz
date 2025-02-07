+++
title = "Yak Shavers Monthly 1"
date = "2025-02-02T18:02:12+01:00"
draft = false
author = "Erwin de Keijzer"
tags = ["yakshaving", "tooling"]
description = "Welcome to the first iteration of Yak Shavers monthly"
showFullContent = false
hideComments = true
+++

# tl;dr

- helix
- zellij
- ghostty
- firefox


## what is yak shaving?

Yak shaving is a hobby / way of life for the people that use the sharpest knives and demand perfection in the tools they use.
Also for the people that can spend weeks perfecting their neovim setup because that fucking indent keeps happening in 1 fucking yaml file.

Or, officially it is something along the lines of:

> Any apparently useless activity which, by allowing one to overcome intermediate difficulties, allows one to solve a larger problem.

Small example: while writing this post I found out that the autosave functionality of Helix doesn't seem to work when helix is opened within a zellij pane in Ghostty and switching windows. It does work when switching zellij panes. And it does work when using it without zellij in Ghostty. So I spent at least 30 minutes getting it to work.. Which I didn't. But I did upgrade Helix to the latest release with Mise (which is awesome). But then I also broke syntax highlighting in Helix, so I switch to using brew again for install Helix, which did fix the syntax highlighting, but still no autosave. But I did find out how to get proper kubernetes yaml definitions completions and error reporting.

### what is yak shaving monthly?
Mostly a collection of tools and their configuration to allow everyone to have a shaven yak without doing all the shaving yourself.


## helix
[helix](https://helix-editor.com/) is a _post-modern_ text editor (their own words). It is almost how it would be to use neovim fully decked out with plugins and perfectly tweaked configuration. But without having to configure anything. Out of the box it has support for lsp, Tree-sitter, modal editing (like kakoune, not like vim) and the keyboard shortcuts are discoverable. If you press `<space>` it will pop up a menu that explains what pressing any key after that will do. `<space> f` (after each other) will pop up a dynamic file chooser like fzf. It has support for multiple cursors and is an alround joy to use.

## zellij
[zellij](https://zellij.dev/) is A terminal workspace with batteries included (their own words again). This is tmux or screen for the year 2025. Lots of things are included and work out of the box. No need to remember keyboard shortcuts because the bottom bar shows you what to do.
It allows you to easily split your terminal in multiple prompts and even allow you to super impose floating prompts on top of your other prompts for quick commands or whatever you want.
With some proper keybindings you can even use cmd+t to create a new tab and cmd+1/2/3 to switch tabs.

## ghostty
[ghostty](https://ghostty.org/) is a fast, feature-rich, and cross-platform terminal emulator that uses platform-native UI and GPU acceleration (their own words).
It is terminal emulator (like kitty, alalacritty, wezterm, iterm2) that is made to feel at home on all platforms. It is fast and easy to configure. It was released just before 2025 and already feels quite mature. Configuration is done using a simple text file which allows you to use any dotfile manager you want.

## firefox
Firefox doesn't need an introduction, but with plugins and configuration it does make it a yak shavers dream. There is two things I'd like to highlight right now.

### multi account containers
This allows you to create tabs that belong to a certain group, all tabs from such a group have the same cookies, but tabs from a different group have their own cookies. This allows you to be logged in with different user accounts on all websites. Making it trivial to manage multiple AWS environments without resorting to separate browsers. You can even configure it to open certain (sub)domains in specific tab groups, making it seamless to open facebook links in a completely seperate group and limit tracking.

### vimium
Vimium is an extension that allows you to use vim like keyboard shortcuts to navigate the web. The single best thing this enables is that you can just press the `f` on your keyboard and all links on the page get a unique two-key shortcut to press that link, this really enables you to quickly navigate the web without reaching for your mouse. So pressing `fdd` will navigate to the link highlighted with dd, pretty cool.
