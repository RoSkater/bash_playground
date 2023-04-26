#!/bin/bash

echo "-------------------"

jq -c '.[].nodes[]' "$1" | while read node; do

    # Extract the ID, key pair and peers list from the current node object
    id=$(echo "$node" | jq -r '.id')
    public_key=$(echo "$node" | jq -r '.key_pair.public_key')
    private_key=$(echo "$node" | jq -r '.key_pair.private_key')
    peers=$(echo "$node" | jq -c '.peers[].id')

    # Print the ID and key pair for the current node
    echo "Node ID: $id"
    echo "Public Key: $public_key"
    echo "Private Key: $private_key"
    echo -n "Peers: "
    #Get each peer printed in the same line
    for peer in $peers; do
        echo -n "$peer "
    done
    echo ""
    echo "-------------------"

done