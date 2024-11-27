### dotfiles
John's dotfiles repository.  Make terminals great!

## Set up

You'll need git (obviously) and stow.  Both can be easily installed by your OS' package manager.


For example, on MacOS

```
$ brew install git
$ brew install stow
```

## Shell Tools

I consider these shell tools essential as well:
fzf - Fuzzy finding
zoxide
ripgrep
tree

```
$ brew install fzf
$ brew install zoxide
$ brew install ripgrep
$ brew install tree
```

## Optional Set up

If you do all these steps, you'll have all the tools you need to start NeoVim, Ruby/Rails, Node, Postgres
and Rust development.

```
$ brew install nvim
$ brew install rbenv

$ brew install nvm
$ nvm install node

$ brew install postgresql@17
$ createdb $USER

$ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```
$ git clone git@github.com/jbedworth/dotfiles.git
$ cd dotfiles
```

Then use GNU stow to create simlinks

```
$ stow .
```


