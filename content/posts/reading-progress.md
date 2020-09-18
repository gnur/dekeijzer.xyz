---
title: "Reading Progress"
date: 2020-01-31T11:32:53+01:00
draft: false
author: "Erwin de Keijzer"
tags: ["books", "typescript", "firebase", "firestore", "svelte", "sidequest"]
description: "a real time view into my reading progress"
showFullContent: false
---

## tl;dr

Librera (ebook reader app on Android) stores reading progress in google drive, a firebase function loads this file and stores it in firebase, a svelte frontend shows real-time reading progress.  

[https://book-progress-storer.web.app/](https://book-progress-storer.web.app/)


# history

Ever since I discovered goodreads I've been almost obsessed with tracking what I read and obtaining as much stats as possible. 

At first, to get real time insights in my reading progress of books, I looked into extracting information from my kindle. Whispersync syncs the progress of the books I'm reading to something at Amazon. However, there is no public API to get this information out. I actually tried sniffing the traffic and using phantomJS to extract stuff from the cloud reader. But this all felt a bit hacky.

However, this all changed when I switched to reading my books with [librera](https://librera.mobi/) on my Android phone. (I switched to reading on my phone because I have it with me all the time)  
It can sync your reading progress to Google Drive and after a short examination of the files stored on Google Drive I found out it was simply storing JSON.

Example of this file:

```json

{
   "V_E_Schwab-Vicious.epub":{
      "cp":false,
      "d":0,
      "dc":false,
      "dp":false,
      "lk":1,
      "p":0.5742,
      "s":120,
      "sp":false,
      "t":1565986186029,
      "x":0,
      "y":0,
      "z":100
   },
   "V_E_Schwab-Vengeful.epub":{
      "cp":false,
      "d":0,
      "dc":false,
      "dp":false,
      "lk":1,
      "p":1,
      "s":120,
      "sp":false,
      "t":1566495998899,
      "x":0,
      "y":0,
      "z":100
   }
}

```

With some basic testing I Found out `t` is the unix timestamp of the update and `p` is the progress (where 0.57 means you are at 57%).

I quickly threw together a firebase cloud function to load this JSON file from google drive (apparently it is enough to share the file with `${firebase-project-name}@appspot.gserviceaccount.com` to grant your cloud function access).

This function now loads this file every 30 minutes, parses every book, checks if the current "stats" from Librera are stored in firestore already and otherwise adds it, and it marks it as finished if you are over 98.5%. 

## showing progress 

I found this awesome [tutorial](https://fireship.io/lessons/svelte-v3-overview-firebase/) on how to use firebase with svelte and threw together a small site to show live progress of my reading.  

And with that, I also wanted to add some calculations. My reading target for 2020 is 25 books, so I track the overall progress, when the next book is due and when the current book is estimated to be done.


## technologies

- svelte
- milligram css
- firebase
- firestore
