# Batch Image Resizer 

## What This Command Does
Automatically resizes single or multiple images all at once. 
After the image is resized, it will be found under the directory 'resized\_imgs'

## Why/When This Command Is Useful
This command is useful if you want all your images to be resized at once, instead of resizing it one at a time. It is also useful if you're using linux without a GUI. 

## How You Can Use This Command
1. Install ImageMagick: ```sudo apt install imagemagick```
2. Create a directory and place all the images (MUST be in jpg/jpeg/png/gif format) you want to resize. If you only want to resize one, you can put it in the same directory as the shell script or in its own dedicated folder.
3. Run the script with two arguments: the image directory and size you wish to resize it to.
	```./img_resize.sh [IMAGE DIRECTORY] [SIZE (in % or 'wxh' format)]```
4. Check in 'resized\_imgs' directory for the new images

## Example Usage
./img\_resize.sh imgs 50%

Output:

Resized: imgs/mountains.jpg → resized\_imgs/resized\_mountains.jpg
Original image dimensions: 612x408
New image dimensions: 306x204
 
Resized: imgs/road.jpg → resized\_imgs/resized\_road.jpg
Original image dimensions: 640x420
New image dimensions: 320x210
 
Resized: imgs/turbines.jpg → resized\_imgs/resized\_turbines.jpg
Original image dimensions: 1024x538
New image dimensions: 512x269
 
FINISHED. All images have been resized and saved in 'resized\_imgs'.
