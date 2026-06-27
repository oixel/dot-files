#!/bin/bash
printf '\033]P020201e' > /dev/tty1 || true  # Custom black
printf '\033]P3F5C35A' > /dev/tty1 || true  # Custom yellow
printf '\033]P7DADADA' > /dev/tty1 || true  # Custom white
printf '\033[2J\033[H' > /dev/tty1 || true  # Clear to reset colors
exit 0
