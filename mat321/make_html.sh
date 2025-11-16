#!/bin/bash

# Convert problem sets
echo "Converting problem sets..."
for i in {1..5}; do
    notebook="problem_sets/hw$i/hw$i.ipynb"
    if [ -f "$notebook" ]; then
        echo "  Converting $notebook"
        jupyter nbconvert --to html "$notebook"
    else
        echo "  Warning: $notebook not found, skipping"
    fi
done

# Convert precepts
echo "Converting precepts..."
for i in {1..12}; do
    notebook="precepts/$i/precept$i.ipynb"
    if [ -f "$notebook" ]; then
        echo "  Converting $notebook"
        jupyter nbconvert --to html "$notebook"
    else
        echo "  Warning: $notebook not found, skipping"
    fi
done

echo "Done!"
