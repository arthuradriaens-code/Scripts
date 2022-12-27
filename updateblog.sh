#!/bin/sh
rsync -uvrP --delete-after /home/arthur/website/blog/ root@arthuradriaens.com:/var/www/blog
