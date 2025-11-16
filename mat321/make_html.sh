#!/bin/bash

# Function to remove hardcoded kernel metadata from notebook
remove_kernel_metadata() {
    local notebook="$1"
    conda run -n recovar_dev python3 <<EOF
import json

with open('$notebook', 'r') as f:
    nb = json.load(f)

# Remove kernelspec from metadata if it exists
if 'metadata' in nb and 'kernelspec' in nb['metadata']:
    del nb['metadata']['kernelspec']
    # If metadata is now empty, we can optionally remove it, but it's fine to keep it

with open('$notebook', 'w') as f:
    json.dump(nb, f, indent=1)
EOF
}

# Convert problem sets
echo "Converting problem sets..."
for i in {1..5}; do
    notebook="problem_sets/hw$i/hw$i.ipynb"
    if [ -f "$notebook" ]; then
        echo "  Executing and converting $notebook"
        remove_kernel_metadata "$notebook"
        conda run -n recovar_dev jupyter nbconvert --execute --to html --ExecutePreprocessor.kernel_name=recovar_dev "$notebook"
    else
        echo "  Warning: $notebook not found, skipping"
    fi
done

# Convert precepts
echo "Converting precepts..."
for i in {1..12}; do
    notebook="precepts/$i/precept$i.ipynb"
    if [ -f "$notebook" ]; then
        echo "  Converting $notebook (clearing outputs)"
        conda run -n recovar_dev jupyter nbconvert --ClearOutputPreprocessor.enabled=True --to html "$notebook"
    else
        echo "  Warning: $notebook not found, skipping"
    fi
done

echo "Done!"
