#!/bin/bash


grep -rl '10.2.5.25' ./ |xargs sed -i 's/10.2.5.25/10.20.42.91/g'

grep -rl 'loongson-test' ./ |xargs sed -i 's/loongson-test/loongson/g'

grep -rl '60' ./ |xargs sed -i 's/60/3/g'
