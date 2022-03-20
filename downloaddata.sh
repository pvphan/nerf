#!/bin/bash

mkdir -p ./data
dataDirSize=$(ls ./data | wc -l)
if [[ "$dataDirSize" -eq 0 ]]; then
    pushd ./data
    wget http://cseweb.ucsd.edu/~viscomp/projects/LF/papers/ECCV20/nerf/tiny_nerf_data.npz
    wget http://cseweb.ucsd.edu/~viscomp/projects/LF/papers/ECCV20/nerf/nerf_example_data.zip
    unzip nerf_example_data.zip && rm nerf_example_data.zip
fi

