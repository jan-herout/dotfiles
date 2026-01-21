# find

## basic modifiers

```bash
find . -type d              # directories
find . -type f              # files
find . -type f -mtime +2    # files with modification time >2 days ago
```

## depth limitation

```bash
find . -mindepth 1 -maxdepth 1 -type d
```


## exec a program on each found item

```bash
find . --exec <command> <options> {} ; # spawns a new process for each item
find . --exec <command> <options> {} + # all items are concatenated into args and one process is spawned
```

## recepies 

### rename to lowercase

```bash
find . -type f -name "*.tab" -exec bash -c 'mv "$1" "${1%.tab}.sql"' _ {} \; # *.tab => *.sql
```

