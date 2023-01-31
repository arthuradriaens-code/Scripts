#!/bin/sh
rsync -uvrP --delete-after root@arthuradriaens.com:/var/www/homepage/ /home/arthur/website/homepage/
