# repex

Replace string and execute script.

## Usage

````
source repex.sh

repex -f [file] -s [search] -r [replace] -d [delimiter]
````

## Security

**THIS WILL EXECUTE THE CONTENTS OF THE FILE THAT IS PASSED IN. BE SURE THIS IS WHAT YOU WANT TO DO.**

This script is intended to be used in cases where you want to quickly replace a line of code / variable / etc. and then execute *trusted* code.

For example, if a script is written to work for a specific hardcoded path but you would like to change the path to something else, you could use this script to change the path and execute the script without bothering the original engineer. While modifying their code to enable both the original usage and the required usage and filing a pull request is the proper avenue, this script will provide a quick fix in the interim.
