---
title: "Kubernetes Complexity"
date: 2024-09-25T18:44:51+02:00
draft: false
author: "Erwin de Keijzer"
tags: ["kubernetes", "opinion"]
description: "Is Kubernetes more complex than the old way?"
showFullContent: false
---

## Kubernetes Complexity

When you start working with Kubernetes you quickly run into the additional tooling that is needed to get stuff working.

- Secrets need to be managed somehow
- You need an ingress to handle traffic coming into the cluster
- You need something to track observability
- You need to build your docker images
- You need to manage your application lifecycle
- You need to manage your application storage
- You need to manage DNS
- You need to manage certificates

All these things probably add some tooling to your cluster, with multiple options and with their own research and maintenance requirements. It is not trivial to manage a fully featured kubernetes cluster. It takes probably at least a single FTEE (second E for Engineer) to manage this stack, they can probably handle multiple (similar) clusters, but is not something that something that you can just on the side. All of these require constant attention. Because bugfixes, releases and CVE's do happen and upgrading often is a lot easier than doing big bang upgrades once every x months and finding out what went wrong in 10 releases across 5 backlogs.

## just bring back the monolith VM

As an alternative, if you just run a monolith on a vm somewhere. You can probably do without 80% of the tooling that is required for a kubernetes deployment. Just write to a local disk, use caddy and systemd unit and you're good to go. And you know what, that actually works. But it isn't a fair comparison. Because in this case you've ignored several of the things that were made explicit by using kubernetes. GitOps is something that is not often heard in a systemd environment. To deploy a new version of your application you're probably using a combination of ssh / scp and restarting systemd units to reach your goal and if you want to do a rollback, you'll have to find an old version of your application, reset the config and pray that it works again. When (not if) an OS level dependency gets updated by doing an `sudo apt get upgrade` or a `sudo pacman -Syu` you don't have the option of doing a rollback (probably). DNS is probably configured by clicking and typing in an interface somewhere, 5 years ago, and when DNS breaks at one point the poor engineer tasked with fixing it will have to call the sysadmin that has moved on to ask where their DNS even is hosted and do a password reset.

## kubernetes makes the complexity explicit

So even the monolith is not without its faults. Better yet, the monolith has the same problems, but they can be ignored more easily. If you are running kubernetes it can be daunting when you realize how many things need solutions and maintenance, but in truth these are the problems that any software deployment has to face. `journalctl` is an excellent tool for viewing logs of a systemd unit, but it doesn't scale. Having your application dependent on host OS level libraries will cause something to break at one point. There is a reason that kubernetes has reached the current adoption worldwide. It __seems__ more complicated than running a single application on a VM somewhere and that is true, but it is also true that creating an additional application deployment on a properly set up kubernetes cluster is trivial. Create a deployment yaml in your GitOps repo and 90% of the work is done. You get observability, auto-restarts, rollbacks, certificates and storage for free! 
