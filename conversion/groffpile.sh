#!/bin/sh

groff -e -t -ms -U $1 -T pdf > $2
