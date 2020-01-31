---
title: "Beyondauth"
date: 2019-10-31T12:04:51+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["side project", "golang", "authentication", "openid connect", "traefik", "kubernetes", "deprecated" ]
description: "A poor mans identity aware proxy"
showFullContent: false
---

## tl;dr

A poor mans version of [beyondcorp](https://cloud.google.com/beyondcorp/), using traefik and openID Connect on kubernetes to create an Identity Aware Proxy.

# history

As I was running more and more services on my kubernetes "cluster", I got sick of logging in to all of them individually. So I set out to create a poor mans single sign on solution.  
It uses [traefik](https://containo.us/traefik/)'s [ForwardAuth](https://docs.traefik.io/middlewares/forwardauth/) option to authenticate and authorize every request received by traefik. If the auth server returns a 2xx response, traefik will proxy the request to the resource's backend. Any other response is realyed to the requesting client.

It basically works like this:

- user requests example.com
- traefik first calls the auth server before proxying the request
- auth server determines if user is logged in
    - if user is logged in, and allowed to access the resource returns a 200 response (with some optional headers)
    - if user is logged in, and not allowed to access the resource, it returns a 403
    - if user is not logged, user gets redirected to the sign in page (which in itself redirects to an openID connect endpoint) and after successful auth the request is retried
- logging in to the beyondauth endpoint sets a domain wide cookie that is used to determine the users identity

### rules

The BeyondAuth endpoint allows setting up rules to allow or deny access based on e-mail address, e-mail domain and source ip. You can also mark a resource as public which is very useful for resources that have their own auth scheme (like minio).

An example rules file:


```toml
defaultPolicy = "deny" #default policy is always deny

[groups.admin]
domains = [ "gnur.nl" ]

[groups.anyone]
domains = [ "gmail.com", "gnur.nl" ]

[groups.home]
subnets = [ "0.0.0.0/32" ]

[groups.superadmin]
users = [ "erwin@example.com" ]

[hosts."s3.example.com"]
public = true

[hosts."booksing.example.com"]
allowedGroups = [ "anyone" ]

[hosts."memgo.example.com"]
public = false
allowedGroups = [ "home", "admin" ]

[hosts."quice.example.com"]
public = false
allowedGroups = [ "superadmin" ]
```

## technologies

- openID Connect
- go
- kubernetes
- traefik
- JWT
