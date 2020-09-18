---
title: "Tobab"
date: 2020-09-18T11:00:09+02:00
draft: false
author: "Erwin de Keijzer"
tags: ["sidequest", "golang", "authentication"]
description: "Another poor mans identity-aware proxy"
showFullContent: false
---

## tl;dr

A poor mans version of [beyondcorp](https://cloud.google.com/beyondcorp/), an identity-aware proxy (IAP) that can authenticate and authorize users with third party authenticators (currently only google is supported.  

Find it on github: [tobab](https://github.com/gnur/tobab)

# history

When I switched from running stuff in my kubernetes cluster to running stuff in Google App Engine, I decided that [beyondauth](/posts/beyondauth/) was now deprecated.  
However, after the initial honeymoon period with GAE, some projects became too expensive to run and I started hosting them on my own devices again.  

After a while it started bothering me again that all the self-hosted projects either had no auth (prometheus) or their own auth solution ([booksing](/posts/booksing/), [gdo](/posts/gdo/), pturn). So I set out to replicate my earlier setup but then a bit simpler. BeyondAuth was pretty good, but it also needed traefik, and both of these were more tedious to maintain and configure then I would like. 

So I set out to build my own solution, and Tobab is the result.

# features

- http proxy
- sign in with google (for now, more identity providers could easily be supported)
- letsencrypt integration (non-optional, http->https redirect is mandatory)
- glob matching based authorization
- routes can be added through the API or the CLI
- stateless, secure tokens with [paseto](https://developer.okta.com/blog/2019/10/17/a-thorough-introduction-to-paseto)


# acknowledgements

Building this I truly started to appreciate the meaning of standing on the shoulders of giants, the Go libraries I've used are extensive and made this application a lot easier to create.


# technologies

- golang
- letsencrypt
- paseto
- openid connect
