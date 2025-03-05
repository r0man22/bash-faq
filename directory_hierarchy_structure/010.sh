#cpio
cd -- "$srcdir" && 
find . -type d -print | cpio -dumpv -- "$dstdir"

#pax cd -- "$srcdir" &&
find . -type d -print | pax -rwdv -- "$dstdir"

#tar
cd -- "$srcdir" &&
find . -type d -print | tar c --files-from - --no-recursion | tar x --directory "$dstdir"

#
export distdir
mkdir -p -- "$dstdir" &&
cd -- $srcdir" &&
find . -type d -exec sh -c 'cd -- "$dstdor" && mkdir -- "$@"' sh {} +

#
shopt -s globstar nullglob &&
cd -- "$srcdir" && dirs=(**/) && (( ${#dirs[@]} )) &&
cd -- "$dstdir" && mkdir -- "${dirs[@]}"

#zsh
export srcdir dstdir
zsh -ec '
cd -- "$srcdir"
dirs=(**/*(/D))
cd -- "$dstdir"
mkdir -- $dirs'

#for files (empty)
cd -- "$srcdir" &&
DSTDIR=$dstdir find . -type f -exec sh -c 'for i do touch -r "$i" -- "$DSTDIR/$i"; done' sh {} +


