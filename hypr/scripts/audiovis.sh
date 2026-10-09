#!/bin/sh
tmux new-session -s audiovis 'cava -p ~/.config/cava/cava-mic.conf' \; \
  set-option -t audiovis status off \; \
  split-window -v 'cava -p ~/.config/cava/cava-out.conf' \; \
  select-pane -U \; \
  split-window -h 'cava -p ~/.config/cava/cava-guitar.conf'
