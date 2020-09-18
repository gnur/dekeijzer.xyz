+++
title = "booksing"
date = "2020-01-25T13:51:36+0100"
author = "Erwin de Keijzer "
tags = ["sidequest", "books", "golang", "production", "GAE", "firestore"]
description = "a fast web UI for searching your ebooks"
showFullContent = false
+++

## tl;dr

A web UI built with vue and buefy, with an index stored in firebase for searching and downloading epubs.

# history

An acquaintance told me he had a big collection of ebooks and that the windows file explorer wasn't sufficient for handling the collection.  
It also contained a lot of duplicate books with slightly different file names and titles.  
So I started browsing github and found this project: [BookBrowser](https://github.com/geek1011/BookBrowser/) which is a webUI for managing epubs.  
And it did the job quite okay, but startup was slow and searching was exact and not fuzzy, so I started making some "improvements" to my fork:

- web UI based on bulma with vue
- deduplication based on normalized author / title
- client side parser
- storage in S3 (selfhosted with minio)
- firestore as scalable database (used to be mongodb, and a completely self-hostable version version with stormDB is on my wishlist)
- store the author / title as [metaphone keys](https://en.wikipedia.org/wiki/Metaphone) so searches don't have to be exact
- added authentication with firebase auth (google)


## technologies

- go lang
- google app engine
- vue
- bulma css
- buefy
- firebase authentication
- firestore
