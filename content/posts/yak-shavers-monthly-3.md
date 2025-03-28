+++
title = "Yak Shavers Monthly 3"
date = "2025-03-28T14:17:41+01:00"
draft = false
author = "Erwin de Keijzer"
tags = ["yakshaving", "tooling", "helix", "yazi", "zellij", "shortcuts"]
description = ""
showFullContent = false
readingTime = false
hideComments = true
+++

# tl;dr

Use Super key shortcuts in your terminal for quick access to frequently used features and applications.


# zellij

Within zellij it is possible to configure shortcuts with the super key, this allows you to access commonly used features with ergonomic shortcuts. Especially if you don't use any of your terminal emulators' native features (like tabs or splits) this can be very useful.
For example, I've set up zellij to switch to specific tabs with the following config:

```
  bind "Super t" { NewTab; }
  bind "Super 1" { GoToTab 1; }
  bind "Super 2" { GoToTab 2; }
  bind "Super 3" { GoToTab 3; }
```

This makes zellij feel like a native macos app and allows me to quickly switch tabs.

I've used Warp for a while but recently switched to ghostty, one of the native features in warp is splitting panes with `cmd-d` and `cmd-D`. To emulate this I added this to my `config.kdl` in zellij:

```kdl
  bind "Super d" { NewPane; }
  bind "Super D" { NewPane "down"; }
```

But the 2 shortcuts I use the most are these 2:

```kdl
  bind "Super n" {
    Run "hx" "~/notes/notes.md" {
      close_on_exit true
      floating true
      x "10%"
      y "15%"
      width "80%"
      height "70%"
    }
  }
  bind "Super g" {
    Run "gitui" {
      close_on_exit true
      floating true
      x "10%"
      y "15%"
      width "80%"
      height "70%"
    }
  }
```

So whenever I'm in my terminal I can do `cmd-n` and instantly access my notes. And whenever I'm in a code repo I can run `cmd-g` to access [gitui](https://github.com/gitui-org/gitui) (an awesome git tui).

# helix with yazi file picker

After reading a reddit post I came across this [PR](https://github.com/sxyazi/yazi/pull/2461) in the yazi github repository. Which uses features that are already merged into main for both projects but not in a release yet. But it definitely is worth it to compile them yourselves to get this functionality.

This is a snippet from my zellij config:

```toml
[keys.normal]
L = "goto_next_buffer"
H = "goto_previous_buffer"
"ret" = "goto_word"
Z = { Z = ":wq" }
Cmd-z = ":wq"
Cmd-r = ":reload-all"
Cmd-y = [
  ':sh rm -f /tmp/unique-file',
  ':insert-output GO_ROOT=1 yazi %{buffer_name} --chooser-file=/tmp/unique-file',
  ':insert-output echo "\x1b[?1049h" > /dev/tty',
  ':open %sh{cat /tmp/unique-file}',
  ':redraw',
]
```

The last shortcut allows me to press `cmd-y` (y for yazi) to switch from helix to yazi and if I select a file in yazi it will open in the existing helix session!

Which brings an IDE like experience a bit closer in native helix. If only helix would get plugins soon...

An alternative for this is [zide](https://github.com/josephschmitt/zide). Which does things in a different but similar way.
