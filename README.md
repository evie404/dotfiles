# dotfiles

idk... collection of bash aliases mostly to make sure typos don't get into the way of productivity™.

## Installation

I typically store projects under `~/workspace`, but feel free to put this wherever you want.

### 1. Git clone to your workspace

```bash
cd ~/workspace && git clone https://github.com/evie404/dotfiles.git
```

### 2. Add this line to your bash profile:

```bash
[[ -s "${HOME}/workspace/dotfiles/evie.bash" ]] && source "${HOME}/workspace/dotfiles/evie.bash"
```

-or-

```bash
echo '[[ -s "${HOME}/workspace/dotfiles/evie.bash" ]] && source "${HOME}/workspace/dotfiles/evie.bash"' > ~/.bash_profile
```

for the lazy.
