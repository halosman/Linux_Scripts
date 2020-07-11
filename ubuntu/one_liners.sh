# This is not meant to be executed on it's own, but instead a collection of one-liners that can be modified for use

# Script was used to prepare library for import into calibre. In Calibre for books that have multiple formats
# the easiest way to import them is to put them in one folder.
# In my case the books were strucutred like /mnt/calibre/{filetype}/{filename}.{filetype} but they needed to be structured 
# like /mnt/calibre/calibre-library/{filename}/{filename}.{filetype} (don't ask about destination path :(). 
# This one liner accomplishes this; note that xargs is needed because file names have special characters (like space and parenthesis).
for i in /mnt/calibre/*/*.*; do filename=$(basename -- "$i"); dirname=/mnt/calibre/calibre-library/${filename%.*}; mkdir -p $dirname && xargs -0 cp -n $i $dirname/$filename; done
