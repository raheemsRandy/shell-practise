#!/bin/bash

movies=("pushpa2" "salar" "RRR")

echo "first movie is $movies"
echo "second movie is ${movies[-1]}"
echo "second movie is ${movies[1]}"
echo "first movie is ${movies[@]}"