# grep

```bash
grep [OPTION...] PATTERNS [FILE...]
grep [OPTION...] -e PATTERNS ... [FILE...]
grep [OPTION...] -f PATTERN_FILE ... [FILE...]
```

## matching control

switch | long form        | what
------ | ---------------- | -------------------------------------------
`-i`   | `--ignore-case`  | ignore case (default is `--no-ignore-case`)
`-v`   | `--invert-match` | only lines/files that **do not match**

## basic output control

switch | long form                 | what
------ | ------------------------- | ------------------------------------------------------------
`-l`   | `--files-with-matches`    | only filenames
`-n`   |                           | line numbers
`-L`   | `--files-without-matches` | only filenames, **no match**
`-c`   | `--count`                 | Suppress normal output; instead print a count lines for file

## pattern syntax

switch | long form           | what
------ | ------------------- | ---------------------------
`-E`   | `--extended-regexp` | pattern is a ERE regexp
`-P`   | `--perl-regexp`     | pattern is a PCRE regex
`-F`   | `--fixed-strings`   | pattern is a string literal

## Context line control

switch     | long form                | what
---------- | ------------------------ | ----------------------------------------------------------
`-A <num>` | `--after-context <num>`  | Print NUM lines of trailing context after matching lines.
`-B <num>` | `--before-context <num>` | Print NUM lines of trailing context befire matching lines.
`-C <num>` | `--context <num>`        | Print NUM lines before and after

## files and directory selection

switch | long form             | what
------ | --------------------- | ----------------------------------------------------------------------------------------------------
`-r`   | `--recursive`         | recurse into subdirs; **does not follow symlinks!** (`-R` does)
       | `--exclude=GLOB`      | Skip any command-line file with a name suffix that matches the pattern GLOB, using wildcard matching
       | `--exclude-from=FILE` | Exclude, read globs from a file
       | `--exclude-dir=GLOB`  | Skip any command-line directory with a name suffix that matches the pattern GLOB
       | `--include=GLOB`      | Only include files that have this GLOB

# examples

```bash
# najdi všechny markdowny, které NEOBSAHUJÍ zadanou frázi
grep -rL --include="*.md" "identifikace inkrementu" . 

# Check if the line exists in the file
if grep -qF "$line_to_check" "$file"; then
    echo "The line exists in the file."
else
    echo "The line does not exist in the file."
fi
```
