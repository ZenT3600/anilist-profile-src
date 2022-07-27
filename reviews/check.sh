#!/usr/bin/bash

tr -cd '[:alnum:]' < "$1" | wc -m
