---
title: "garage door opener (GDO V3)"
date: 2022-09-21T19:00:09+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["sidequest", "golang", "grpc", "kubernetes", "cloudflared", "tailscale" ]
description: "raspberry pi zero + garage remote + time = web ui to open a garage door"
showFullContent: false
---

## tl;dr v3

Dropped custom secure tokens, split backend and frontend.

# history

As you can read in the previous post on [gdo](/posts/gdo) I automated my garage door. Since then, a few issues surfaced.

- The "relay soldered to a remote" solution turned out to be not so robust
- The pi zero w is remarkably stable, but the wifi in the garage is really slow sometimes
- Development got tricky sometimes because my dev station does not have GPIO pins
- The spaghetti code was mixing responsibilities a bit too much
- I wanted to trigger the garage with my Apple Watch as well

# physical solution

I found out that motor unit actually had 3 eyelets that allow you to control the unit. I quickly changed the relay connection from the remote to those eyelets and now the trigger is way more reliable. Before this change, 90% of the non-triggers where related to the remote not triggering the unit correctly. But now, it usually is my code that is too blame! (much better I guess)

# software solution

In GDO V3 I had a few goals, I wanted it to be simpler, better DevEx and easier to grant access to others.

In V3 a lot of code was removed and refactored, I split up GDO in 2 parts: gdo-pgio and gdo-gui.  
__gdo-gpio__ lives on the raspberry pi zero w in my garage and through GRPC it allows the gui to control and get status updates.  
__gdo-gui__ can run anywhere within my [tailnet](https://tailscale.com/kb/1136/tailnet/) and uses GRPC to connect to gdo-gpio. This allows me to devel the gui and connect to a mock-gdo. This allows me to test features without having to actually trigger my garage door.

These 2 components have a very clear boundary and this allows them both to be a lot simpler. 1 just handles GPIO, the other is a gui. No longer is presentation mixed with business logic (at least, it's less now). 

The gui also shows if there is an active GRPC connection to the backend and if they are talking the same version. Very useful when debugging why the friggin door won't open again.

Another change is to use cloudflare argo tunnels to route the traffic to the gui. This also allows the gui to live anywhere, because the tunnel will connect to cloudlfare and no incoming connections are required. Combined with cloudflare access rules, all users now need to sign in to access the ui, and the gdo-gui no longer has to handle any acl/token stuff. (but in V3.5 / V4 that might come back cause I want to host it on [fly](https://fly.io)

Also, I'm running this all using weave flux, with sealed secrets on self hosted k8s cluster.  
I thought splitting the back and fronted would make it easier, I was wrong. But the interface does load faster and more reliably now.



## technologies

- go lang
- kubernetes
- grpc
- cloudflared (argo tunnel)
