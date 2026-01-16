if status is-interactive
    # --- Remove mensagem de boas-vindas ---
    set -g fish_greeting

    # --- Inicialização de Ferramentas (Hooks) ---
    # Inicia o prompt Starship (deixa o terminal bonito e informativo)
    starship init fish | source
    # Inicia o Zoxide (o 'cd' inteligente)
    zoxide init fish | source

    # --- Variáveis de Ambiente ---
    # Define o editor padrão (opcional, pode ser nano, vim, micro)
    set -gx EDITOR nano
    # Integração do FZF com o comando fd (se decidir usar fzf depois)
    set -gx FZF_DEFAULT_COMMAND "fd --type f"

    # --- Abreviações Modernas (Substitutos) ---
    # LS -> EZA (Lista arquivos com ícones e info de git)
    abbr -a ls 'eza --icons --group-directories-first'
    abbr -a ll 'eza --icons --group-directories-first -l'
    abbr -a la 'eza --icons --group-directories-first -la'
    abbr -a tree 'eza --tree --icons'

    # CAT -> BAT (Visualiza arquivos com cores)
    abbr -a cat 'bat'

    # CD -> Zoxide (Navegação rápida)
    # Exemplo: digite 'z www' para ir direto para ~/www
    abbr -a cd 'z' 

    # --- Atalhos de Projetos ---
    # Atalho rápido para ir para sua pasta de trabalho
    abbr -a work 'cd ~/www'

    # --- Pacman & Yay (Do passo anterior) ---
    abbr -a up 'sudo pacman -Syu'
    abbr -a in 'sudo pacman -S'
    abbr -a rm 'sudo pacman -Rs'
    abbr -a clean 'sudo pacman -Sc'
    
    abbr -a yup 'yay'
    abbr -a yin 'yay -S'
    
    abbr -a fixkeys 'sudo pacman-key --refresh-keys'
end
~/.local/bin/mise activate fish | source

# pnpm
set -gx PNPM_HOME "/home/mouro/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

if not set -q SSH_AUTH_SOCK
    eval (ssh-agent -c)
    ssh-add ~/.ssh/id_ed25519 >/dev/null 2>&1
end
