---
title: "garage door opener"
date: 2020-06-18T16:00:09+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["sidequest", "golang", "iot", "production", "svelte", "secure"]
description: "raspberry pi zero + garage remote + time = web ui to open a garage door"
showFullContent: false
---

## tl;dr

I glued together a web UI, a raspberry pi zero w, a relay and my garage door remote to create a secure (I hope) way of opening my garage door remotely.

# history

Halfway through 2019 we moved into a house with a garage with a remote for opening and closing the door. I immediately wanted to make it possible to open this door remotely.  
In the end, I wound up using a raspberry pi zero w I had lying around anyway and soldering the existing remote contacts to a relay I ordered online. After a bit of prototyping this is the solution I ended up with:

![roofbox](/roofbox.jpg)
On the left: raspberry pi zero W  
The orange thing in the middle: the relay  
The black stuff with the wires coming out: the original remote, the wires are soldered to the original button of the remote, both the relay and the blue pushbutton can close the circuit to make the remote send the signal.

# web ui
The web UI uses svelte for the dynamic stuff, which in the end is actually nothing. But it was a nice intro into what svelte can do.

![gdo screenshot](/gdo-screenshot.png)
_Translation: GDO, "Open / close", "Also close?"_

The one feature that turned out to be very useful in the end is the option to close it after a certain amount of time.  
If you click the checkbox it shows a select box that allows you to choose a timeout for the trigger to be sent again. 30 seconds turns out to be an excellent amount of time to get a bike out of the garage.

# security

I wanted to be able to hand out tokens to people that might need it to open the door in a certain timespan. If I want let my brother in next sunday, I want to be able to give him a token today that will grant him access in the future. After all the stuff I heard about JWT I wanted to use an alternative. I quickly found [branca](https://branca.io/), which looked like a nice alternative. However, after taking a look at the actual implementation in Go I wanted to make something that was a bit easier to use. I wound up creating several methods that allow me to quickly encrypt and decrypt a specific go struct by marshalling them with msgpack and encrypting them with chacha20poly1305, and them base62 encoding them to be url safe.

## technologies

- go lang
- iot
- secure tokens with chacha20poly1305
