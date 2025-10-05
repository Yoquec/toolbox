# `whichdate`

CLI tool that turns natural language relative dates into timestamps.

```bash
# Image it's January 1st 1970...
$ wd next week
> 01-05-1970

# But I wanted the exact day in a week
$ wd in a week
> 01-08-1970

# Also works for last week
$ wd 14 of next month
> 02-14-1970
```

## Installation

It is required that you have `experimental-features = "nix-command flakes"` in your neovim configuration.

```sh
nix profile install "github:yoquec/toolbox#whichdate"
```
