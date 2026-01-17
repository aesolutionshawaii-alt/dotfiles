# Josh's Dotfiles

Personal shell configuration and scripts, synced between MacBooks.

## Quick Start

```bash
# Clone on a new machine
git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/.dotfiles

# Install symlinks
~/.dotfiles/install.sh

# Apply changes
source ~/.zshrc
```

## What's Included

### Scripts (`~/bin/`)

| Command | Description |
|---------|-------------|
| `warm-cloudinary` | Pre-warm Cloudinary CDN for Reel Addiction III |
| `scrape-news` | Scrape news sources for JN Chevrolet content |
| `post-metricool` | Schedule posts to Metricool |
| `generate-visual` | Create styled visuals for social media |
| `run-demo` | Run terminal demos for screenshots |
| `generate-icons` | Generate PWA icons from SVG |

### Aliases

See `~/.aliases` for the full list. Highlights:

- `warm` - Quick alias for warm-cloudinary
- `reel` - cd to Reel Addiction III and start dev server
- `proj <name>` - Quick project navigation
- `tools` - Show available custom tools

### Functions

- `proj <name>` - Jump to project directory
- `mkcd <dir>` - Create directory and cd into it
- `tools` - List custom tools
- `dotfiles-sync` - Commit and push dotfiles
- `dotfiles-pull` - Pull and reinstall dotfiles

## Syncing Between Machines

**Push changes:**
```bash
dotfiles-sync
```

**Pull on another machine:**
```bash
dotfiles-pull
```

## Structure

```
~/.dotfiles/
├── bin/           # Executable scripts (symlinked to ~/bin)
├── aliases        # Shell aliases (symlinked to ~/.aliases)
├── zshrc          # Zsh config (symlinked to ~/.zshrc)
├── install.sh     # Symlink installer
└── README.md
```

## Notes

- Scripts are wrappers that call the actual Node scripts in project directories
- If a project isn't at the expected path, the script will error
- Machine-specific config can go in `~/.dotfiles/local.zsh` (git-ignored)
