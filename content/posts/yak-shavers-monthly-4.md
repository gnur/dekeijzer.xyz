+++
title = "Yak Shavers Monthly 3"
date = "2025-04-29T14:17:41+01:00"
draft = false
author = "Erwin de Keijzer"
tags = ["yakshaving", "cli", "fish"]
description = "Shell tab completions in 2025"
showFullContent = false
readingTime = false
hideComments = true
+++

# tl;dr

With tools like [carapace](https://carapace.sh/) and [inshellisense](https://github.com/microsoft/inshellisense) your tab completions will just work.

# tab completions

If you've used the CLI in any way or form somewhere in the last 50 years you must have noticed that tab-completions can be a blessing and a curse. If they work they are great, but if ill-configured they turn into a nightmare. Sometimes you luck into a linux distro that does it really well (like fedora, thank you) but more often than not, you are left on your own to configure them correctly. The thing is, every tool has to provide their own tab completions. Depending on context and position in the command different things should be returned. Use a tool like [inshellisense](https://github.com/microsoft/inshellisense) or [carapace](https://carapace.sh/) to improve your tab completions.
