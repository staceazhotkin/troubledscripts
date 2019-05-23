# troubledscripts
this is probably going to be a series but anyway, meet **Larry**
## Larry
Bash script for batch restructuring of raw markdown documentation export from Notion.so and fusing it into a single document.

Troubled Larry is basically an overly talkative pile-of-files-to-single-document converter aimed at making [Notion.so](https://notion.so)-based product documentation printable. Tuned specifically to account for particular nuances in Notion markdown export and does three things:
1. shifts (increments the level of) each heading (except the first one) in each .md file in the current wd
2. drags the resulting files through pandoc and fuses them all into a single documentation file in GFM format
3. talks a lot

Written and tested only locally so far (on MacOS X Mojave, GNU Bash 3.2.57). Looks alive.

### Larry requires
- [pandoc](http://pandoc.org/), installable through `brew install pandoc`

### Additional notes on Larry
Larry requires to be launched in the working folder, you cannot navigate it to the folder containing your .md files after you've summoned Larry.
