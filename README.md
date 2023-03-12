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

### Howto
1. Get your documentation in order! All articles have to be numerated in the exact order you want them to appear in your resulting doc. I personally did that through adding a number to the article title. Like "A1. Abstract", "A2. What is this for", "B1. Common terms", "B2. Common elements" etc. Yeah, the trick is getting them all sortable alphabetically, cuz when you export your directory as md every article is gonna be a separate md file.
2. Export your documentation from Notion using "Export all as markdown"
3. Unpack the downloaded archive
4. Cd to the resulting folder
5. launch troubledlarry
6. Do not be offended by the lad, he means well

### Additional notes on Larry
I have already said that but Larry requires to be launched in the working folder, you cannot navigate it to the folder containing your .md files after you've summoned Larry.
