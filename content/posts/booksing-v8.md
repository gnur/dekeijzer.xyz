---
title: "Booksing V8"
date: 2020-12-11T14:43:31+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["sidequest", "books", "golang", "production", "bootstrap", "static"]
description: ""
showFullContent: false
---

## tl;dr

~~A web UI built with vue and buefy, with an index stored in firebase for searching and downloading ebooks.~~ 

A web UI built for searching and downloading epubs, without any external dependencies.

# history

As you can see in a old post ([booksing](/posts/booksing/)), the previous iteration of Booksing was built with quite some external dependencies. It worked really well if you hosted in on Google App Engine, but the setup was quite involved.

To make it more self-hostable I made some changes.

- google authentication was removed
- [asdine/storm](https://github.com/asdine/storm) is used for storing the metadata in a database
- [blevesearch](https://blevesearch.com/) is used for making all the metadata searchable
- In stead of Vue and some big single page application I switched to using Go templates with bootstrap to make it more snappy

This actually makes it work automatically without configuration. If you run it it will start immediately, and if you put some books in the import directory it will index them and show them in the web interface. Epic :).


# technologies

- golang
- bootstrap
