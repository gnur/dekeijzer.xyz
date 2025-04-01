+++
title = "Yak Shavers Monthly 2"
date = "2025-03-01T18:02:12+01:00"
draft = false
author = "Erwin de Keijzer"
tags = ["yakshaving", "tooling", "ai", "llm"]
description = "Adding LLMs to the terminal"
showFullContent = false
hideComments = true
+++

# tl;dr

LLMs in the terminal.

- aider
- smartcat
- elia
- parllama
- claude code

## Aider


[aider](https://aider.chat/) is AI pair programming in your terminal. It's basically a chat interface for an LLM that provides the context of your codebase in your session. It allows you to write comments like `//implment this function and use recursion. AI!` and it will be picked up by a model of your choosing. It can also answer questions about your codebase and help you plan big changes.

## smartcat

[smartcat](https://github.com/efugier/smartcat) (`sc` in the CLI) is a CLI interface to LLMs. In the true spirit of UNIX it does one thing well and is very composable. Can be very useful when working in helix with the `|` command that allows you to pipe your selection into an external command and allows it be replaced with the output of the command. Allowing you to use a model of your choosing to quickly implement functions.

## elia & parllama

Both [elia](https://github.com/darrenburns/elia) and [parllama](https://github.com/paulrobello/parllama) offer a TUI to LLMs. You can configure multiple LLMs and LLM providers so doesn't matter if you want to use chat gippity, gemini, Claude or even run it yourself with ollama. 

## claude code

A bit of a last minute addition, claude code was just announced by anthropic as a command line tool to help you code. It doesn't allow you to use any model you want, it's always claude. And claude is not cheap, just initializing claude on a new project cost me 6 cents. While my 2 hour coding session with gemini flash 2 in aider cost me less than 1 cent..
