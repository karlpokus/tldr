# tldr
Homemade TL;DR for the man page

# install
```bash
$ git clone [repo]
# add a config
$ echo 'DATADIR=path/to/data' > ~/.tldr.cfg
# optional: make an alias
$ alias tldr=bash path/to/tldr.sh
```

# usage
```bash
$ tldr [-e] <file>
# if file is missing you get a prompt to create one
# -e to edit existing file
```

# todos
- [x] installing
- [x] basic usage
- [x] add [--edit]
- [x] prompt to create file
- [ ] more options in .tldr.cfg like $EDITOR and $PAGER
- [ ] search file contents too?
- [ ] select if multiple matches
- [ ] autocompletion

# license
MIT
