#!/bin/sh
rsync -uvrP --delete-after /home/arthur/website/homepage/ root@arthuradriaens.com:/var/www/homepage

