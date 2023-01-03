#!/bin/sh
rsync -uvrP --delete-after root@arthuradriaens.com:/var/www/blog/ /home/arthur/website/blog/
