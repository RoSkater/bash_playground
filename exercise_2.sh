#!/bin/bash

# Load the YAML library
source yaml.sh

# Parse the YAML file into a Bash associative array
yaml2array $1 blockchain

# Initialize a variable to hold the total transaction value
total_value=0

# Loop through each block in the blockchain
for (( i=0; i<${#blockchain[@]}; i++ )); do
  # Get the transactions array for the current block
  transactions=$(yaml_get_array blockchain $i.block.transactions)

  # Loop through each transaction in the current block
  for (( j=0; j<${#transactions[@]}; j++ )); do
    # Get the amount for the current transaction
    amount=$(yaml_get_value transactions $j.amount)

    # Add the amount to the total value
    total_value=$(echo "$total_value + $amount" | bc)
  done
done

# Print the total value
echo "Total value of all transactions: $total_value"
