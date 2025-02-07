+++
title = "Yak Shavers Monthly 2"
date = "2025-02-02T18:02:12+01:00"
draft = true
author = "Erwin de Keijzer"
tags = ["yakshaving", "tooling"]
description = "Welcome to the second iteration of Yak Shavers monthly"
showFullContent = false
hideComments = true
+++

# tl;dr

- zellij config, cmd-t, cmd-n, cmd-g, cmd-d

## what is yak shaving?

Yak shaving is a hobby / way of life for the people that use the sharpest knives and demand perfection in the tools they use.
Also for the people that can spend weeks perfecting their neovim setup because that fucking indent keeps happening in 1 fucking yaml file.

Or, officially it is something along the lines of:

> Any apparently useless activity which, by allowing one to overcome intermediate difficulties, allows one to solve a larger problem.

Small example: while writing this post I found out that the autosave functionality of Helix doesn't seem to work when helix is opened within a zellij pane in Ghostty and switching windows. It does work when switching zellij panes. And it does work when using it without zellij in Ghostty. So I spent at least 30 minutes getting it to work.. Which I didn't. But I did upgrade Helix to the latest release with Mise (which is awesome). But then I also broke syntax highlighting in Helix, so I switch to using brew again for install Helix, which did fix the syntax highlighting, but still no autosave. But I did find out how to get proper kubernetes yaml definitions completions and error reporting.

### what is yak shaving monthly?
Mostly a collection of tools and their configuration to allow everyone to have shaven yak without doing all the shaving yourself.
