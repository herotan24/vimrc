# CLAUDE.md — AI Assistant Guide for herotan24/vimrc

## Repository Overview

This is a personal Vim configuration repository maintained by **herotan24** (`yuhua_tan24@sina.com`). It contains:

- A full-featured `vimrc` with plugin configuration and keybindings
- An install script that wires the repo into `~/.vim/`
- Git submodules for all plugins (managed via Vundle)
- Platform-specific scripts for building Vim from source
- YouCompleteMe (YCM) build/install helpers
- Sample config files for YouCompleteMe and Vimspector

---

## Repository Structure

```
vimrc/                         # Repo root — also installed as ~/.vim/vimfiles/
├── vimrc                      # Main Vim config file (symlinked to ~/.vim/vimrc)
├── in.sh                      # Install script: creates symlinks, sets up vimspector
├── submodule.sync.sh          # Retry-loop helper for git submodule init/update
├── .gitmodules                # Git submodule declarations for all plugins
├── .gitignore                 # Ignores *.bz2 and bundle/absl
├── .ycm_extra_conf.py         # Global YouCompleteMe C/C++ flags config
├── notes                      # Tip: use .git/info/exclude to gitignore locally
├── README.md                  # Minimal project description
├── bundle/                    # Plugin submodules + YCM build helpers
│   ├── Vundle.vim/            # Plugin manager (submodule)
│   ├── YouCompleteMe/         # Code completion engine (submodule)
│   ├── vimspector/            # Visual debugger (submodule)
│   ├── nerdtree/              # File tree browser (submodule)
│   ├── nerdtree-git-plugin/   # Git status in NERDTree (submodule)
│   ├── vim-fugitive/          # Git integration (submodule)
│   ├── a.vim/                 # Toggle between .h and .c/.cpp (submodule)
│   ├── bufexplorer/           # Buffer list explorer (submodule)
│   ├── molokai/               # Color scheme (submodule)
│   ├── taglist.vim/           # Tag browser (requires ctags) (submodule)
│   ├── vim-airline/           # Status line (submodule)
│   ├── vim-airline-themes/    # Airline themes (submodule)
│   ├── ctrlp.vim/             # Fuzzy finder (installed but disabled; replaced by LeaderF)
│   ├── LeaderF/               # Fast fuzzy file/tag finder (submodule)
│   ├── vim-mark/              # Colorized word marking (submodule)
│   ├── TagHighlight/          # Enhanced tag-based syntax highlighting (submodule)
│   ├── SrcExpl/               # Source explorer window (submodule)
│   ├── CCTree/                # Call hierarchy via cscope (submodule)
│   ├── ultisnips/             # Snippet engine (installed; disabled in vimrc)
│   ├── vim-snippets/          # Snippet library (installed; disabled in vimrc)
│   ├── codeium.vim/           # AI code completion — manual trigger (submodule)
│   ├── vim-go/                # Go language support (submodule)
│   ├── README.ycm.md          # YCM install instructions (online + offline)
│   ├── vimspector.README.md   # Vimspector setup notes
│   ├── ycm.build.sh           # Script: build YCM (online)
│   ├── ycm.in.net.install.1st.manual.download.sh  # Offline YCM step 1: download
│   ├── ycm.in.net.install.2nd.clean.submodules.sh # Offline YCM step 2: clean
│   └── ycm.in.net.install.3rd.use.local.dowloads.sh # Offline YCM step 3: apply
├── scripts/
│   ├── YouCompleteMe/
│   │   └── python.ycm_extra_conf.py  # Sample YCM config for Python projects
│   └── vimspector/
│       ├── c.vimspector.json         # Sample .vimspector.json for C/C++ (cpptools/lldb)
│       └── python.vimspector.json    # Sample .vimspector.json for Python (debugpy)
└── vim/
    └── build/                        # Scripts for compiling Vim from source
        ├── ubuntu/
        │   ├── 0th_dep.sh            # Install libncurses-dev
        │   ├── 1st_sys.sh            # Remove old Vim, install ctags/cscope
        │   └── 2nd_build_vim.sh      # Configure and build Vim (Python 3, cscope)
        ├── centos/
        │   ├── 1st_sys.sh            # Install ncurses-devel, ctags, cscope
        │   └── 2nd_build.sh          # Configure and build Vim
        ├── mac/
        │   └── build_vim.sh          # Configure and build Vim (uses pyenv Python 3.8)
        └── win/
            ├── 2nd_build.cmd         # Windows build via MSVC nmake
            ├── 3rd_install.cmd       # Windows: copy build artifacts
            └── 4th_path.txt          # Notes on PATH setup for Windows
```

---

## Installation

```sh
# Clone the repo
git clone --recurse-submodules <repo-url>

# Or, if already cloned:
sh submodule.sync.sh   # retries until all submodules are fully initialized

# Install (creates symlinks and sets up vimspector packadd path)
sh in.sh
```

`in.sh` does the following:
1. Backs up any existing `~/.vim/vimfiles` and `~/.vim/vimrc`
2. Symlinks this repo as `~/.vim/vimfiles`
3. Symlinks `./vimrc` as `~/.vim/vimrc`
4. Creates `~/.vim/pack/plugins/opt/vimspector` symlink (required for `packadd! vimspector`)

---

## Plugin Manager: Vundle

Plugins are declared in `vimrc` between `call vundle#begin(...)` and `call vundle#end()`. To install or update plugins:

```vim
:PluginInstall    " install new plugins
:PluginUpdate     " update all plugins
:PluginClean      " remove unused plugins
```

Plugin paths:
- **macOS / Linux**: `~/.vim/vimfiles/bundle/`
- **Windows**: `%HOME%/vimfiles/bundle/`

---

## Installed Plugins & Purpose

| Plugin | Purpose | Status |
|--------|---------|--------|
| YouCompleteMe | Semantic code completion (C/C++/Go/Python) | Active |
| codeium.vim | AI completion (manual trigger only) | Active |
| vimspector | Visual debugger (DAP protocol) | Active |
| vim-go | Go build/run/test/format/rename | Active |
| NERDTree | File tree sidebar | Active |
| nerdtree-git-plugin | Git status icons in NERDTree | Active |
| vim-fugitive | Git commands inside Vim | Active |
| vim-airline | Enhanced status/tab line | Active |
| vim-airline-themes | Themes for airline (current: badwolf) | Active |
| LeaderF | Fuzzy file and tag finder | Active |
| taglist.vim | Tag browser window (requires ctags) | Active |
| SrcExpl | Source definition preview window | Active |
| CCTree | Call tree visualization via cscope | Active |
| vim-mark | Highlight and cycle through word marks | Active |
| TagHighlight | Color variables/members/defines via tags | Active |
| a.vim | Toggle between header and source files | Active |
| bufexplorer | Browse open buffers | Active |
| molokai | Color scheme | Active |
| ctrlp.vim | Fuzzy finder | Installed, disabled (use LeaderF instead) |
| ultisnips | Snippet engine | Installed, disabled |
| vim-snippets | Snippet content library | Installed, disabled |

---

## Key Configuration Details

### General Settings

```vim
set nocompatible     " Vim mode, not Vi
set history=200      " Command history
set nowrap           " No line wrapping
set hlsearch         " Highlight search results
set incsearch        " Incremental search
set nu               " Line numbers
set ignorecase       " Case-insensitive search
set mouse=a          " Mouse support in all modes
colorscheme molokai  " Color scheme
set t_Co=256
set termguicolors    " True color support
set keywordprg=man\ 3   " K looks up man section 3 (library functions)
```

### Indentation (C-style)

```vim
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab        " Tabs → spaces
set cindent
set smartindent
set autoindent
```

### Cscope Integration

Cscope is auto-loaded from `cscope.out` in the current directory (or `$CSCOPE_DB`). Results go to the quickfix list.

### vimspector Base Dir

Hardcoded in `vimrc`:
```vim
let g:vimspector_base_dir='/home/tanyuhua/.vim/vimfiles/bundle/vimspector'
```
**Update this path** if deploying on a different machine. On macOS the path would be something like `/Users/<username>/.vim/vimfiles/bundle/vimspector`.

### YCM Extra Conf

The global YCM config is set per platform:
```vim
" macOS
let g:ycm_global_ycm_extra_conf = '$HOME/.vim/vimfiles/.ycm_extra_conf.py'
" Linux
let g:ycm_global_ycm_extra_conf = '~/.vim/vimfiles/.ycm_extra_conf.py'
```

For Python projects, copy `scripts/YouCompleteMe/python.ycm_extra_conf.py` to the project root and adjust the interpreter path.

---

## Key Bindings Reference

`<leader>` is `\` (Vim default).

### Navigation

| Key | Action |
|-----|--------|
| `<C-n>n` | Toggle NERDTree |
| `<C-n>f` | NERDTree: find current file |
| `<F8>` | Toggle Taglist window |
| `<F7>` | Toggle SrcExpl window |
| `<F11>` | SrcExpl: previous definition |
| `<F12>` | SrcExpl: next definition |
| `<leader>ff` | LeaderF: fuzzy file search |
| `<leader>ft` | LeaderF: fuzzy tag search |
| `<leader>fg` | vimgrep word under cursor (`**`) |
| `<leader>vgrep` | vimgrep word under cursor (`**/*`) |

### Quickfix

| Key | Action |
|-----|--------|
| `<F9>` / `<C-k>` | `:cprev` — previous quickfix item |
| `<F10>` / `<C-j>` | `:cnext` — next quickfix item |
| `<leader><F9>` | `:cfirst` |
| `<leader>cc` | `:cclose` |

### Cscope (`<leader>cs*`)

| Key | Query type |
|-----|-----------|
| `<leader>css` | Symbol |
| `<leader>csg` | Definition |
| `<leader>csd` | Called by |
| `<leader>csc` | Callers |
| `<leader>cst` | Text string |
| `<leader>cse` | egrep pattern |
| `<leader>csf` | File |
| `<leader>csi` | Files including this |
| `<leader>csa` | Assignments |
| `<leader>cso` | Load `cscope.out` |
| `<leader>csk` | Unload `cscope.out` |

### YouCompleteMe (`<leader>y*`)

| Key | Action |
|-----|--------|
| `<leader>ygd` | GoTo (definition) |
| `<leader>ygr` | GoToReferences |
| `<leader>ygt` | GoToType |
| `<leader>ygcr` | GoToCallers |
| `<leader>yfw` | Find symbol in workspace |
| `<leader>yfd` | Find symbol in document |
| `<C-l>` (insert) | Toggle YCM signature help |

### Vimspector Debug (`<leader>d*`)

| Key | Action |
|-----|--------|
| `<leader>dl` | Launch debugger |
| `<leader>de` | Reset/stop session |
| `<leader>dc` | Continue |
| `<leader>ds` | Stop |
| `<leader>dr` | Restart |
| `<leader>dp` | Pause |
| `<leader>dn` | Step over |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dd` | Disassemble |
| `<leader>dbl` | Toggle breakpoint |
| `<leader>dbc` | Toggle conditional breakpoint |
| `<leader>dbf` | Add function breakpoint |
| `<leader>dbw` | Show breakpoints window |
| `<leader>drc` | Run to cursor |
| `<leader>dgc` | Go to current line |
| `<leader>duf` | Up frame |
| `<leader>ddf` | Down frame |
| `<leader>djnb` | Jump to next breakpoint |
| `<leader>djpb` | Jump to previous breakpoint |
| `<leader>djpc` | Jump to program counter |
| `<leader>dv` | Evaluate (balloon) |
| `<leader>dm` | Read memory at cursor address |
| `<leader>dw` | Add watch expression |

### vim-go (`<leader>g*`, Go files only)

| Key | Action |
|-----|--------|
| `<leader>gb` | Build |
| `<leader>gR` | Run |
| `<leader>gt` | Test |
| `<leader>gr` | Referrers |
| `<leader>gd` | Go to definition |
| `<leader>gn` | Rename |
| `<leader>gf` | Format |

### Codeium AI (insert mode)

| Key | Action |
|-----|--------|
| `<C-l>` | Trigger / cycle forward through suggestions |
| `<C-j>` | Next suggestion |
| `<C-k>` | Previous suggestion |

> **Note**: `<C-l>` and `<C-k>` in insert mode conflict with YCM bindings. Codeium is set to manual mode (`g:codeium_manual = v:true`).

### Formatting

| Key | Action |
|-----|--------|
| `<leader>fc` (visual) | `clang-format` selected code |
| `<leader>fc` (normal) | `clang-format` entire file |
| `<leader>jfmt` | Format JSON (`python3 -m json.tool`) |

### Misc

| Key | Action |
|-----|--------|
| `<leader>n` | Clear all vim-mark highlights |
| `<leader>ntcp` | Open current file in new tab, hide line numbers (for tmux copy) |
| `<leader>excp` | Restore line numbers and close copy tab |
| `<C-w><C-z>` | Maximize current window |
| `gf` | Search for word under cursor (remapped from `*<C-o>`) |
| `Q` | Format (gq), not Ex mode |

---

## Building Vim from Source

Scripts are in `vim/build/<platform>/`. Run them in order (numbered prefix = order).

### Ubuntu

```sh
apt-get install -y libncurses-dev          # 0th_dep.sh
bash vim/build/ubuntu/1st_sys.sh           # removes old vim, installs ctags/cscope
# inside vim source dir:
sh vim/build/ubuntu/2nd_build_vim.sh       # build with Python3 + cscope support
```

### CentOS

```sh
bash vim/build/centos/1st_sys.sh           # install deps
sh vim/build/centos/2nd_build.sh           # build
```

### macOS

```sh
# Prerequisites: pyenv with Python 3.8.19
sh vim/build/mac/build_vim.sh
```

### Windows

Run `vim/build/win/2nd_build.cmd` in a Visual Studio Developer Command Prompt, then `3rd_install.cmd`.

---

## Building YouCompleteMe

### Online (network access available)

```sh
cd bundle
sh ycm.build.sh
```

This runs `YouCompleteMe/install.py --all --verbose --force-sudo` in a retry loop.

### Offline (air-gapped environment)

Three-step process documented in `bundle/README.ycm.md`:

1. **On a machine with internet**: `sh ycm.in.net.install.1st.manual.download.sh`
   - Downloads LLVM/clang/clangd tarballs and clones abseil-cpp
2. **On the air-gapped machine**: `sh ycm.in.net.install.2nd.clean.submodules.sh`
   - Cleans any cross-platform submodule artifacts
3. **On the air-gapped machine**: `sh ycm.in.net.install.3rd.use.local.dowloads.sh`
   - Copies downloaded files into the right places and patches CMakeLists.txt

---

## Setting Up Vimspector

1. Vimspector is loaded via `packadd! vimspector` (the symlink created by `in.sh`).
2. Install debug adapters from within Vim:
   ```vim
   :VimspectorInstall! debugpy vscode-cpptools CodeLLDB
   ```
3. Place a `.vimspector.json` in your project root. Sample configs:
   - **C/C++**: `scripts/vimspector/c.vimspector.json`
   - **Python**: `scripts/vimspector/python.vimspector.json`
4. **macOS remote-session note**: If debugger hangs with permission errors, start a local `tmux` session first, then attach remotely.

---

## Platform-Specific Notes

| Setting | macOS | Linux | Windows |
|---------|-------|-------|---------|
| Vundle path | `~/.vim/vimfiles/bundle/Vundle.vim` | `~/.vim/vimfiles/bundle/Vundle.vim` | `%HOME%/vimfiles/bundle/Vundle.vim/` |
| ctags path | `/opt/homebrew/bin/ctags` | `/usr/bin/ctags` | `ctags.exe` |
| YCM conf | `$HOME/.vim/vimfiles/.ycm_extra_conf.py` | `~/.vim/vimfiles/.ycm_extra_conf.py` | `$VIM/vimfiles/.ycm_extra_conf.py` |
| vimspector base | `/Users/<user>/.vim/vimfiles/bundle/vimspector` | `/home/<user>/.vim/vimfiles/bundle/vimspector` | N/A |

---

## Conventions for AI Assistants

### What to Know

- **Do not add or remove plugins** in `vimrc` without explicit instruction. Plugin declarations are carefully ordered.
- **`vimspector_base_dir`** at `vimrc:451` is hardcoded to a specific user path. When modifying vimrc for a different user/machine, this must be updated.
- **Comments in vimrc are in Chinese** — this is intentional. Do not translate them unless asked.
- **Commented-out sections** (e.g., ctrlp.vim configuration, UltiSnips) represent intentionally disabled features. Do not uncomment without instruction.
- **`.ycm_extra_conf.py`** at the repo root is the global fallback. Project-specific configs should be placed in the project root.
- **`submodule.sync.sh`** is a simple retry loop — it is not broken, it just retries on network failure.

### Making Changes

- **Keybinding conflicts**: `<C-l>` is bound both to YCM signature help (normal) and Codeium cycle (insert). `<C-j>`/`<C-k>` in insert mode are Codeium; in normal mode they are quickfix navigation. Be careful when adding new bindings.
- **Indentation**: All new Vimscript should use 4-space indentation (matching existing style).
- **Platform guards**: Use `if has("mac")` / `elseif has("unix")` / `elseif has("win32")` patterns for platform-specific settings.
- **No trailing whitespace** in vimrc lines.
- **Submodules**: Adding a new plugin requires both a `Plugin '...'` line in vimrc AND `git submodule add <url> bundle/<name>`.

### Testing Changes

There is no automated test suite. Manual testing:
1. Source the updated vimrc: `:source ~/.vim/vimrc` or restart Vim
2. Verify no errors in `:messages`
3. Test the specific keybinding or plugin that was changed

### Git Workflow

- Development branch for AI changes: `claude/add-claude-documentation-WhFex`
- Commit messages historically use Chinese for feature descriptions; English is also acceptable
- No CI/CD pipeline exists
