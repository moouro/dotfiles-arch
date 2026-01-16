# 🏠 Dotfiles Arch Linux

Repositório de arquivos de configuração personalizados (dotfiles) para Arch Linux com GNOME. Este conjunto de configurações visa automatizar e agilizar a configuração de novos sistemas Arch Linux, proporcionando um ambiente de desenvolvimento moderno e produtivo desde o início.

## 📋 Requisitos

- **Sistema Operacional**: Arch Linux com GNOME Desktop Environment
- **Shell**: Fish (incluído na instalação)
- **Gerenciador de Pacotes**: Pacman + Yay (AUR Helper)

## 🚀 Instalação Rápida

### 1. Clone este repositório
```bash
git clone <seu-repositorio> ~/dotfiles
cd ~/dotfiles
```

### 2. Instale os pacotes necessários
```bash
# Pacotes oficiais do Arch
sudo pacman -S --needed - < pkglist_native.txt

# Pacotes do AUR
yay -S --needed - < pkglist_aur.txt
```

### 3. Configure o ambiente
```bash
# Crie links simbólicos para as configurações
mkdir -p ~/.config
ln -s ~/dotfiles/config/fish ~/.config/fish
ln -s ~/dotfiles/config/starship.toml ~/.config/starship.toml
ln -s ~/dotfiles/config/mise ~/.config/mise
ln -s ~/dotfiles/config/alacritty ~/.config/alacritty

# Recarregue o shell ou abra um novo terminal
source ~/.config/fish/config.fish
```

### 4. Instale ferramentas de desenvolvimento via Mise
```bash
~/.local/bin/mise install
```

## ⚙️ Configurações Incluídas

### Shell (Fish)
- **Prompt**: Starship com tema Gruvbox dark
- **Navegação**: Zoxide (cd inteligente)
- **Aliases modernos**: 
  - `ls` → `eza --icons --group-directories-first`
  - `cat` → `bat` (syntax highlighting)
  - `cd` → `z` (via zoxide)
- **Gerenciamento de pacotes**:
  - `up` → `sudo pacman -Syu`
  - `in` → `sudo pacman -S <pacote>`
  - `rm` → `sudo pacman -Rs <pacote>`
  - `clean` → `sudo pacman -Sc`
  - `yin` → `yay -S <pacote>`

### Terminal (Alacritty)
- **Fonte**: JetBrainsMono Nerd Font 12pt
- **Cursor**: Bloco piscante
- **Opacidade**: Configurável (padrão: 1.0)
- **Padding**: 10px horizontal e vertical

### Ambiente de Desenvolvimento
Gerenciado via Mise:
- **Node.js**: v24
- **Rust**: Latest
- **Elixir/Erlang**: Latest
- **Ruby**: v4
- **PNPM**: Gerenciador de pacotes JavaScript

### Prompt (Starship)
Módulos configurados:
- Sistema operacional (Arch Linux: 󰣇)
- Usuário e diretório
- Git (branch e status)
- Linguagens de programação
- Docker, Conda, Pixi
- Time (desabilitado por padrão)

## 🛠️ Ferramentas Instaladas

### Utilitários de Terminal
- `eza` - Listagem de arquivos moderna com ícones
- `bat` - Visualizador de arquivos com syntax highlighting
- `fd` - Busca de arquivos rápida
- `ripgrep` - Busca de conteúdo rápido
- `fzf` - Fuzzy finder
- `bottom` - Monitor de recursos
- `gdu` - Analisador de uso de disco

### Git
- `git` - Controle de versão
- `lazygit` - Interface TUI para Git
- `git-delta` - Pager melhorado para diff

### Desenvolvimento
- `docker` & `docker-compose` - Containerização
- `neovim` - Editor de texto moderno
- `cmake` - Sistema de build
- `wget` - Download de arquivos

### Áudio e Multimídia
- `pipewire` - Servidor de áudio
- `easyeffects` - Efeitos de áudio
- Vários plugins LV2 para produção musical

### Sistema
- `timeshift` - Snapshots do sistema
- `zram-generator` - Compressão de RAM
- `flatpak` - Aplicativos sandboxed

## 📁 Estrutura de Arquivos

```
dotfiles/
├── README.md                      # Este arquivo
├── pkglist_native.txt            # Lista de pacotes oficiais do Arch (86 pacotes)
├── pkglist_aur.txt               # Lista de pacotes do AUR (7 pacotes)
├── config/
│   ├── fish/
│   │   └── config.fish           # Configuração do shell Fish
│   ├── starship.toml             # Configuração do prompt Starship
│   ├── mise/
│   │   └── config.toml           # Versões de ferramentas de desenvolvimento
│   └── alacritty/
│       └── alacritty.toml        # Configuração do terminal Alacritty
└── AGENTS.md                     # Guia para agentes de IA
```

## 🔧 Manutenção e Atualizações

### Atualizar pacotes do sistema
```bash
up                    # Atualiza pacotes oficiais
yay                   # Atualiza pacotes do AUR
```

### Atualizar ferramentas de desenvolvimento
```bash
mise install          # Atualiza ferramentas gerenciadas pelo Mise
mise ls               # Lista versões instaladas
```

### Adicionar novos pacotes
Quando instalar novos pacotes, adicione-os aos arquivos correspondentes:
- Pacotes oficiais → `pkglist_native.txt`
- Pacotes AUR → `pkglist_aur.txt`

### Atualizar configurações
1. Edite os arquivos de configuração em `~/dotfiles/config/`
2. Teste as mudanças:
   - Fish: `source ~/.config/fish/config.fish`
   - Starship: `starship module <módulo>`
   - Alacritty: Reinicie o terminal
3. Comite as mudanças: `git commit -am "Descrição da mudança"`

## 🎨 Personalização

### Mudar o editor padrão
Edite `config/fish/config.fish`:
```fish
set -gx EDITOR seu-editor-preferido
```

### Mudar a opacidade do terminal
Edite `config/alacritty/alacritty.toml`:
```toml
[window]
opacity = 0.9  # Entre 0.0 (transparente) e 1.0 (sólido)
```

### Adicionar novos aliases Fish
Edite `config/fish/config.fish`:
```fish
abbr -a atalho 'comando'
```

### Adicionar nova linguagem de desenvolvimento
Edite `config/mise/config.toml`:
```toml
[tools]
linguagem = "versão"
```

## 🐛 Solução de Problemas

### Starship não aparece
```bash
starship init fish | source
```

### Mise não está disponível
```bash
~/.local/bin/mise activate fish | source
```

### Ícones não aparecem no terminal
Certifique-se de que a fonte JetBrainsMono Nerd Font está instalada:
```bash
pacman -S ttf-jetbrains-mono-nerd
```

### SSH key não é carregada automaticamente
Verifique se a chave existe:
```bash
ls ~/.ssh/id_ed25519
```

## 📝 Notas Importantes

- Este repositório é específico para Arch Linux com GNOME
- Alguns pacotes podem não ser necessários para o seu uso
- Revise as listas de pacotes antes da instalação completa
- Mantenha este repositório sincronizado entre suas máquinas

## 🤝 Contribuições

Este é um repositório pessoal, mas sinta-se livre para adaptar para suas necessidades!

## 📄 Licença

Este repositório é de uso pessoal e não possui uma licença específica.

---

**Autor**: [Seu Nome]
**Última atualização**: 2026-01-16
