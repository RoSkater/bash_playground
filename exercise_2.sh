#!/bin/bash

# Load YAML data into a Bash variable
blockchain=$(cat $1 | yq .blockchain)

#echo $blockchain

# Loop through each block in the blockchain
for i in $(seq 0 $(echo "$blockchain" | yq '. | length - 1')); do
    #echo "ITERATION $i"
    block=$(echo "$blockchain" | yq ".[$i].block")

    # Print the block index and hash
    block_number=$(echo "$block" | yq ".block_number")
    hash=$(echo "$block" | yq '.hash')
    echo "Block $block_number hash: $hash"

    # Loop through each transaction in the block
    transactions=$(echo "$block" | yq '.transactions')
    for j in $(seq 0 $(echo "$transactions" | yq '. | length - 1')); do
        transaction=$(echo "$transactions" | yq ".[$j]")

        # Print the transaction sender, recipient, and amount
        sender=$(echo "$transaction" | yq '.sender_address')
        recipient=$(echo "$transaction" | yq '.receiver_address')
        amount=$(echo "$transaction" | yq '.amount')
        echo "  Transaction $j: from $sender to $recipient, amount $amount"
    done
done