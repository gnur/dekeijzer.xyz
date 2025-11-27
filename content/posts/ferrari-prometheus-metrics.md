---
title: "F1 cheating clarifies power monitoring issue"
date: "2025-11-21T13:27:35+01:00"
author: "Erwin de Keijzer"
cover: ""
tags: ["sidequest", "f1", "prometheus", "metrics"]
description: ""
showFullContent: false
---

## tl;dr

I've been monitoring my power usage for a while now, and the method I've been using is having similar issues to how a manufacturer in F1 allegedly cheated with their fuel pump system.

# history

I've created a prometheus p1 exporter that listens to a p1 port and exports the metrics to prometheus. The P1 protocol works over a serial connection and sends a packet every second. These messages are then parsed and the relevant metrics are exposed to prometheus. The exporter is written in go and can be found [here](https://github.com/gnur/p1-exporter).

Prometheus then scrapes these metrics every 30 seconds and stores them. As you might have guessed already, the accuracy of the data is not perfect.

The P1 protocol both reports current power draw (in Watts) and the total amount of energy used (in kWh). The exporter exports both of these metrics, and with some clever promql queries you can compare the two. In a perfect world these two metrics would be the same, but in the real world they were not. The calculated total kWh was always a bit lower than the reported total kWh.

## epiphany

I realized what was going on when I was reading about the fuel pump system that a manufacturer allegedly used in the 2019 F1 season.  
In F1 the maximum fuel flow is limited. To ensure that the car doesn't exceed this limit, the fuel pump system is constantly monitored by FIA sensor(s?). This sensor takes a reading every x (milli)seconds. However, this allegedly allowed a clever manufacturer to circumvent the limit by making sure the fuel flow was below the limit at the measurement times, but in between it was above the limit.
This allowed the calculated total average fuel flow to be lower than the actual total average fuel flow. This give this manufacturer an unfair advantage by having more power available to them. This was almost exactly what was happening to me. 

## the (possible) fix(es)

- average out the incoming power metrics between scrapes
- use prometheus remote write to ensure all collected P1 packets are stored

None of these have been implemented in the P1 exporter yet. But feel free to create a PR if you want to help out! 
