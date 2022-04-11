---
title: "Biggest Productivity Boost 2022"
date: 2022-04-11T08:37:29+02:00
draft: true
author: "Erwin de Keijzer"
tags: ["wezterm", "productivity", "cli"]
description: "hyperlinks in the terminal are awesome"
showFullContent: false
---

## tl;dr 

Modern terminal + modern tooling allow me to have a hyperlink to the web interface of git repos in my prompt

## The future is here

I really am a proper yak shaver. I love to spend time to improve my workflow in various ways, as you might have guessed from [cli revolution 2022]({{< ref "cli-revolution-2022" >}} "cli revolution").  
And even though it is 2022, the terminal is still one of the apps I have open permanently.
And in that spirit I often look at different terminal emulators. I think most mac users are familiar with [iterm2](https://iterm2.com/), perhaps most famously for the quake style dropdown terminal it can provide. And it might seem that it is a solved problem, but it actually is a space with quite a lot of active development. Windows 10 introduced a new terminal emulator that is actually quite decent, and somehow rust inspires other yak shavers to create epic terminals as well.  
Some other cool projects in this space:
- [alacritty](https://alacritty.org/)
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [wezterm](https://wezfurlong.org/wezterm/)
- [warp](https://www.warp.dev/) (Commercial, not sure what I think about a terminal that has telemetry, it does look cool though)


## wezterm

I recently switched to wezterm, because it has a combination of 2 features that alacritty does not have:

- native multiplexing of terminal panes
- excellent support for custom keybindings

I have been a tmux user for basically as long as I remember. I set the shortcut to `ctrl+z` 10 years ago, and my muscle memory automatically does a `ctrl+z` `shift+\` if I want to split a screen for an additional terminal. This works pretty well if you are in tmux, but if you want to scroll your history, or want to copy something, or scroll the terminal that isn't active you have to use a combination of `ctrl+z` commands that are not ideal. But in wezterm the window splitting is native and the keybindings allow me to customize it so it even responds to my ingrained keyboard shortcuts. And to scroll the history I can simply move the mouse to the terminal I want to scroll, even if it isn't active, and scroll it.

# Epic productivity boost

Wezterm also has support for [hyperlinks](https://wezfurlong.org/wezterm/hyperlinks.html), it is 2022 and terminals now start to support hyperlinks. It's the future baby!  
I use it in combination with [starship](https://starship.rs/) to add a custom element to my prompt, it parses the current `$PWD` and if it is in my code directory it creates a clickable 📎 icon that takes me to the gitlab/github/bitbucket repo. This works, because I always use a `giclo.sh` script to put checked out repos in logical directories, inspired by the `$GOPATH` env var. (read: actually required by older Go versions). So this is what my prompt looks like in the hugo repo of this actual page, and the little clippy allows me to immediately go to github :)

![prompt with hyperlink](/prompt-2.0.png)


Below are the snippets I use to achieve this config:

> starship.toml
> ```toml
> [custom.codedirs]
> command = "/Users/erwindekeijzer/bin/repolink.sh"
> when = """ true """
> ```
> repolink.sh
> ```bash
> #!/bin/bash
> 
> if [[ "$PWD" =~ ^/Users/erwindekeijzer/code/src/(.*)$ ]]; then
> 
>   path=$(git rev-parse --show-toplevel)
>   repo=${path#"/Users/erwindekeijzer/code/src/"}
>   url="https://${repo}"
> 
>   printf '\e]8;;'
>   printf $url
>   printf '\e\\📎\e]8;;\e\\ '
> 
> fi
> ```
> giclo.sh
> ```bash
> #!/bin/bash
> 
> basepath=~/code/src
> 
> remote="$1"
> 
> host=$(echo $remote | cut -d\@ -f2 | cut -d\: -f1)
> echo $host
> 
> repopath=$(echo $remote | cut -d\@ -f2 | rev | cut -d. -f2- | rev | sed 's@:@/@g')
> codepath="${basepath}/${repopath}"
> 
> git clone "${remote}" "${codepath}"
> echo ${codepath}
> ```
