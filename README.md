# My dotfiles

This repository contains a collection of useful scripts, configurations, and tools that make daily development work more efficient. The repository is organized to help with various tasks including Git operations, file management, system administration, and project navigation.

## What's Inside

### 📁 Repository Structure

```
dotfiles/
├── bin/                    # Executable scripts (the main tools)
├── install.md              # Detailed installation instructions in Czech
└── bookmarks               # List of frequently accessed directories and URLs
```

### 🛠️ Main Tools in `/bin`

The `/bin` directory contains over 50 useful scripts. Here are the most important categories:

#### **Git Workflow Tools** 🔄
- `git-commands` - Lists all available git scripts with documentation
- `git-o2-*` scripts - Specialized tools for O2 development workflow
- `git-merge-feature` - Merges feature branches safely
- `git-pull-requests` - Manages pull requests
- `git-pat-*` scripts - Personal Access Token management
- `git-c` - Quick commit with smart messaging

#### **File Management & Navigation** 📂
- `fzfm` - **Powerful fuzzy file manager** with preview, bookmarks, and multi-select
- `fcd-script` / `fcd-feature-script` - Quick directory navigation using fzf
- `mark` - Bookmark current directory for quick access
- `preview-file.sh` - Smart file preview for various formats

#### **Network & Mounting** 🌐
- `fmount` / `fumount` - Interactive CIFS mounting/unmounting
- `netmount` / `netumount` - Network drive management
- `set-proxy*` scripts - Proxy configuration management

#### **Development & Deployment** 💻
- `mcp` - Teradata MCP server launcher
- `dpo` / `dpl` - PDC deployment script selection
- `acr-login` - Azure Container Registry authentication
- `code-here.sh` - Opens VS Code in current directory

#### **System Utilities** ⚙️
- `commands` - Lists all available scripts with documentation
- `is-valid-json` - JSON validation utility
- `daily-backup` / `usb-backup*` - Backup management tools
- `basic-func.sh` - Library of common functions (logging, git checks)

### 📍 Key Features

#### **Smart File Manager (`fzfm`)**
An advanced fuzzy file manager with:
- **File preview** with syntax highlighting
- **Bookmark navigation** (Alt+M)
- **Hidden files toggle** (Alt+I)
- **Multi-select copy/paste** (Alt+X, Alt+V)
- **Feature directory navigation** (Alt+F)
- **Smart file opening** based on MIME types

#### **Bookmark System**
- Shared bookmark file for consistent navigation
- Web URLs and local directories
- Integration with multiple tools

#### **Git Workflow Optimization**
- Automated feature branch management
- Bulk repository operations
- O2-specific development patterns
- Token management for enterprise environments

### 🚀 Getting Started

1. **Review Dependencies**: Check `install.md` for required packages:
   ```bash
   sudo apt install fzf ripgrep fd-find eza git-flow stow
   ```

2. **Add to PATH**: Add the `bin` directory to your PATH:
   ```bash
   export PATH="$HOME/dotfiles/bin:$PATH"
   ```

3. **Explore Available Tools**:
   ```bash
   commands           # List all available scripts
   git-commands       # List git-specific tools
   ```

4. **Try the File Manager**:
   ```bash
   fzfm              # Launch the fuzzy file manager
   ```

5. **Set Up Bookmarks**:
   ```bash
   mark              # Bookmark current directory
   fcd-script        # Navigate using bookmarks
   ```

### 📋 Common Usage Patterns

#### **File Management**

Keyboard shortcuts in terminal:

- Alt+C : chdir to subdir
- Alt+M : chdir to bookmark
- Ctrl+F : launch fzfm
- Ctrl + T : find a file or subdir

```bash
fzfm                         # Launch file manager
# Inside fzfm:
# Alt+M: Navigate bookmarks
# Alt+X: Save selection
# Alt+V: Copy saved files
# Alt+I: Toggle hidden files
```

#### **System Administration**

```bash
fmount                       # Mount network drives
daily-backup                 # Run backup routine
set-proxy-on                 # Enable proxy
```

### 🎯 Target Audience

Myself 😀

### 📝 Documentation

Each script includes inline documentation accessible via:
```bash
commands           # Overview of all scripts
git-commands       # Git-specific tools
grep "# doc:" bin/* # Find documentation in scripts
```

### 📚 Dependencies

Key external tools used:
- **fzf** - Fuzzy finder (core dependency)
- **eza** - Modern `ls` replacement
- **ripgrep** - Fast text search
- **git-flow** - Git workflow management
- **stow** - Symlink farm manager

See `install.md` for complete dependency list and installation instructions.

