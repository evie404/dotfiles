# dotfiles

## Installation

I typically store projects under `~/workspace`, but feel free to put this wherever you want.


### 1. Git clone to your workspace

```bash
cd ~/workspace && git clone https://github.com/rickypai/dotfiles.git
```

### 2. Add this line to your bash profile:

```bash
[[ -s "${HOME}/workspace/dotfiles/ricky.bash" ]] && source "${HOME}/workspace/dotfiles/ricky.bash"
```

-or-

```bash
echo '[[ -s "${HOME}/workspace/dotfiles/ricky.bash" ]] && source "${HOME}/workspace/dotfiles/ricky.bash"' > ~/.bash_profile
```

for the lazy.
