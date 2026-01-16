# AGENTS.md - Repository Guidelines for Coding Agents

## Project Overview
This is a personal dotfiles repository for an Arch Linux system with GNOME desktop environment. It configures shell environments, development tools, and system utilities using modern tooling.

## Build/Lint/Test Commands
**Note**: This is a configuration repository, not a software project. No traditional build/lint/test commands are available.

### Configuration Management
- **Shell reload**: `source ~/.config/fish/config.fish` (for Fish configuration changes)
- **Package management**: 
  - System updates: `sudo pacman -Syu` or `yay`
  - Install packages: `sudo pacman -S <package>` or `yay -S <package>`
- **Development tools**: Managed via Mise (`mise install <tool> <version>`)

### Testing Configuration Changes
- Test Fish changes by opening a new terminal or running `source ~/.config/fish/config.fish`
- Test Starship changes with `starship module <module_name>` for specific modules
- Test Alacritty changes by restarting the terminal

## Code Style Guidelines

### File Organization
```
config/
├── fish/config.fish          # Shell configuration and aliases
├── starship.toml             # Prompt configuration
├── mise/config.toml          # Development tools version management
└── alacritty/alacritty.toml  # Terminal emulator settings
```

### Configuration Languages
- **TOML**: Use for Starship, Alacritty, and Mise configurations
- **Fish script**: Use for shell configuration and aliases
- **Comments**: Use Portuguese for user-facing text and comments

### Shell Configuration (Fish)
- **Modern tooling preference**: Replace traditional commands with modern alternatives
  - `ls` → `eza --icons --group-directories-first`
  - `cat` → `bat` (syntax highlighting)
  - `cd` → `zoxide` (intelligent navigation)
- **Abbreviations**: Use Fish abbreviations (`abbr -a`) for command aliases
- **Environment variables**: Set with `set -gx` for global exports
- **Interactive-only**: Wrap configuration in `if status is-interactive` blocks

### Starship Prompt Configuration
- **Color scheme**: Use Gruvbox dark palette
- **Format**: Powerline-style with rounded separators (, , )
- **Language modules**: Include all supported languages (C/C++, Rust, Go, Node.js, PHP, Java, Kotlin, Haskell, Python)
- **Git integration**: Always show branch and status
- **OS detection**: Display Arch Linux symbol (󰣇)
- **Directory truncation**: Limit to 3 levels with "…/" prefix

### Alacritty Terminal Configuration
- **Font**: JetBrainsMono Nerd Font, 12pt size
- **Window padding**: 10px horizontal and vertical
- **Cursor**: Block shape, always blinking
- **Opacity**: Configurable (default 1.0 for solid)

### Mise Configuration
- **Development tools**: Specify exact versions where possible
- **Supported languages**: Node.js 24, Rust latest, Elixir/Erlang latest, Ruby 4
- **Format**: Simple `[tools]` section with tool = "version" pairs

## Naming Conventions
- **Files**: Use lowercase with underscores for configuration files
- **Directories**: Use lowercase for config directories
- **Abbreviations**: Use short, memorable abbreviations (e.g., `up`, `in`, `rm` for package management)
- **Environment variables**: Use UPPERCASE with underscores (e.g., `PNPM_HOME`, `EDITOR`)

## Import/Dependency Guidelines
- **Fish configuration**: Source tools in order of dependency (Starship, Zoxide first)
- **TOML files**: Include schema references where available (e.g., Starship config schema)
- **Tool integration**: Use official integration methods (e.g., `starship init fish | source`)

## Error Handling
- **SSH agent**: Check if socket exists before starting (`if not set -q SSH_AUTH_SOCK`)
- **PATH management**: Check if paths already exist before adding
- **Package management**: Use appropriate package managers (pacman for native, yay for AUR)

## Formatting Standards
- **TOML**: Standard TOML formatting with 2-space indentation
- **Fish script**: Use Fish's built-in formatting conventions
- **Comments**: Use `#` for comments, add descriptive section headers with `---`

## Security Considerations
- **SSH keys**: Load SSH agent and add identity silently (`>/dev/null 2>&1`)
- **Environment variables**: Avoid exposing sensitive information in prompts
- **Package installation**: Use official repositories and trusted AUR packages

## Language-Specific Guidelines

### JavaScript/Node.js
- **Package manager**: PNPM preferred (configured in PATH)
- **Version**: Use Node.js 24 via Mise
- **Project structure**: Standard npm/yarn project layouts

### Rust
- **Version**: Use latest stable via Mise
- **Toolchain**: Standard rustup/mise integration
- **Projects**: Cargo-based project structure

### Elixir/Erlang
- **Version**: Use latest via Mise
- **Build tools**: Mix, Rebar3 as needed
- **Projects**: Standard Mix project structure

### Ruby
- **Version**: Use Ruby 4 via Mise
- **Package management**: Standard gem/bundler workflow
- **Projects**: Gemfile-based project structure

## Testing Configuration
- **Shell aliases**: Test by running abbreviated commands
- **Prompt modules**: Test with `starship module <module_name>`
- **Terminal settings**: Restart terminal to apply changes
- **Development tools**: Verify with `mise ls` and tool-specific commands

## Maintenance
- **Package lists**: Update `pkglist_native.txt` and `pkglist_aur.txt` when installing new packages
- **Configuration backup**: Commit changes to track configuration evolution
- **Tool updates**: Regularly update development tools via Mise
- **System updates**: Keep Arch Linux system updated with Pacman/Yay