---
title: "Cli Revolution 2022"
date: 2022-01-18T09:28:40+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["cli", "rust", "zsh"]
showFullContent: false
---

It's 2022, the year I turn 33, just like the Bash shell. Something that might feel a lot younger, zsh, was actually released in 1990, only a year younger than bash. Fish had its first relase in 2005, 17 years ago.

Even though these shells are old enough to have teenage children, they are stil lvery relevant and are still used by a lot of dev/ops/sre every single day.  
But the last few years there has been a silent revolution in the toolkit of these CLI warriors. They do embrace the POSIX mindset, but provide modern alternatives to the tools that have existed for over 30 years.
It appears that the more modern languages like Go and Rust have triggered developers into thinking about how to improve the shell experience.

(to be fair, the first 2 aren't really embracing the POSIX mindset of being composable tools, but they are very useful)

## starship (prompt)

[starship](https://starship.rs/) is a tool, written in Rust, that provides an alternative way to manage your shell prompt. By default your shell prompt might look like this:

```bash
bash-3.2$ ls -ltr
```

With starship, in zsh, in a git repo it could look like this:
![starship prompt](/starship-prompt.png)

This might look a bit complex, but it does give us a lot of information, and the tool itself will actually tell us what is going on:

![starship prompt with explainations](/starship-explain.png)

As you can see, you instantly get your current directory, git branch, git status, go version and kubernetes context. It is also very fast, adding just 30ms to your prompt. And if you want to speed it up it is also very configurable. Check it out.

## gitui

[gitui](https://github.com/extrawurst/gitui) provides a TUI (Terminal User Interface) for working with git. Even if you are used to working with the git CLI, gitui is a lot more user friendly because it has a discoverable interface with keyboard shortcuts always visible. Staging all changes can be done simply by pressing the `a` key, starting a commit is a single `c` and pushing the changes afterwards can be done with a press of the `p` key. Compare that to typing `git add .`, `git commit` and `git push` and you've saved at least half a second of typing! 

It also allows you to easily see a diff of the changes you've made. Browse files in the git log and easily manage stashes.

## fd (find alternative)

[fd](https://github.com/sharkdp/fd) is an alternative for `find`, it is very fast and a bit more use friendly.

A simple comparison, if I do `find .` in my home dir, it takes 11 seconds. If I do a `fd` (the current dir is used by default) it only takes 1 second, over 10 times faster, and it finds over 35000 files/folders.

## fzf (fuzzy finder)

[fzf](https://github.com/junegunn/fzf) is an interactive fuzzy finder for the cli. It takes stdin and allows you to easily select one or more options. 
This allows you to easily create interactive menus from shell scripts and functions. In combination with a very fast file finder, it can be used to create shell functions like this:

```bash
func ccd () {
  cd
  f=$(fd --type d --hidden | fzf --no-mouse)
  if [[ -z $f ]]; then
    return
  fi

  cd "$f"
}
```

It searches all directories in your home dir and allows you to fuzzily `cd` into them. So in stead of typing `cd ~/code/src/github.com/gnur/dekeijzer.xyz/` I just do: `ccd [enter] deke [enter]`.
Another function I created to quickly edit a file:

```bash
func e() {
  cd ~
  f=$(fd --type f --hidden | fzf --no-mouse)
  if [[ -z $f ]]; then
    return
  fi

  vi "$f"
}
```

But it can be used for so much more, you could use it to quickly find a command from your history, kill a process or checking out a git branch.

## rg (ripgrip, grep alternative)

[rg](https://github.com/BurntSushi/ripgrep) is a grep alternative that is really fast and a bit more user friendly. By default, it also respects your `.gitignore` file, so that big `node_modules` directory is ignored, providing a cleaner output and quicker response time.


## exa (ls alternative)

[exa](https://the.exa.website/) is a tool like `ls`. It can show you icons, git status, extended attributes and much more. The `ls` command is probably one of the first shell commands you learn, is used the most and is very hard to replace. I haven't completely replaced `ls` with `exa` yet, but all aliases I defined to use with `ls` have been replaced with `exa` and I haven't looked back:

```bash
#quickly show the contents of a dir with filesize, date, icon and color coded
alias x="exa --long --classify --icons --no-user --no-permissions"
#same, but sort based on modification, showing most recently modified at the bottom
alias ltr="exa --long --classify --icons --no-user --no-permissions --sort=modified"
```

## atuin (shell history)

[atuin](https://github.com/ellie/atuin) is a tool that replaces your existing shell history with additional context and stores it in an SQLite. You can also (optionally!!) sync it with a sync server to share your shell history across different servers.  
It shows you the runtime and exit code when searching your history, and the latest release allows you to fuzzily search your history, which allows you to search for something like `git cl hub` to show you all git clone commands from github.


# tl;dr

Cool tools can make your shell experience a lot more pleasant and, somehow,  they often are written in Rust

`gitui [enter] [a] [c] new post [enter] [p]`
