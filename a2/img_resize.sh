#!/bin/bash

# Check if ImageMagick is installed
if ! command -v convert >/dev/null 2>&1; then
    echo " ImageMagick is not installed. Install it with: sudo apt install imagemagick"
fi

# Get image input
if [ -z "$1" ]; then
    read -p "Enter the image file or directory: " INPUT_PATH
else
    INPUT_PATH="$1"
fi

# Get size input
if [ -z "$2" ]; then
    read -p "Enter the new size (e.g., 50% or 800x600): " NEW_SIZE
else
    NEW_SIZE="$2"
fi

# Validate if file/directory exists
if [ ! -e "$INPUT_PATH" ]; then
    echo " Error: '$INPUT_PATH' does not exist."
fi

# Create an output directory if it doesn't exist
OUTPUT_DIR="resized_imgs"
mkdir -p "$OUTPUT_DIR"

# Function to resize an image
resize_img() {
    local image="$1"
    local filename=$(basename "$image")
    local output_image="$OUTPUT_DIR/resized_$filename"
    local original_dimensions=$(identify -format "%wx%h\n" "$image")

    convert "$image" -resize "$NEW_SIZE" "$output_image"
    local new_dimensions=$(identify -format "%wx%h\n" "$output_image")
    echo "Resized: $image → $output_image"
    echo "Original image dimensions: $original_dimensions"
    echo "New image dimensions: $new_dimensions"
    echo " "
}

# Resize single or multiple images
if [ -f "$INPUT_PATH" ]; then
    resize_img "$INPUT_PATH"
elif [ -d "$INPUT_PATH" ]; then
    find "$INPUT_PATH" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) | while read -r img; do
        resize_img "$img"
    done
else
    echo "Please provide a valid file or directory."
fi

echo "FINISHED. All images have been resized and saved in '$OUTPUT_DIR'."

