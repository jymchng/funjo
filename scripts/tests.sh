#!/bin/bash

mojo_directory="src"

find "$mojo_directory" -type f -name 'test_*.mojo' | while IFS= read -r mojo_file; do
    mojo_dir=$(dirname "$mojo_file")
    file_name=$(basename "$mojo_file")
    cd "$mojo_dir" || exit 1
    mojo "$file_name"
done
