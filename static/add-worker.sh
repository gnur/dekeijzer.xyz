#!/bin/bash

curl -fsSL https://tailscale.com/install.sh | sh

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent" K3S_URL=https://control.goat-gecko.ts.net:6443 \
  K3S_TOKEN="K1060f2e797f8accc796e6adc1fb55ec8136a7d2357dead1a4e94004e5b5a54b247::server:54701ce64c24bdb3294badec6dec7301" sh -s - \
  --vpn-auth="name=tailscale,joinKey=tskey-auth-kMN7suu5rr11CNTRL-vRgi1WKL23P9eRxvE9hsyN7H9876e749J,extraArgs=--ssh"
