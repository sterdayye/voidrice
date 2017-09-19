#!/bin/bash

wget https://github.com/sterdayye/voidrice/blob/master/voidricearchive.tar.gz
tar -xvzf voidricearchive.tar.gz

rsync -va --delete-after voidricearchive/ ~
