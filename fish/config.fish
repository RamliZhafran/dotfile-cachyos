if status is-interactive
    # Starship custom prompt
    command -v starship &> /dev/null && starship init fish | source

    # Direnv + Zoxide
    command -v direnv &> /dev/null && direnv hook fish | source
    command -v zoxide &> /dev/null && zoxide init fish --cmd cd | source

    # EDIT (FNM): Integrasi Fast Node Manager
    command -v fnm &> /dev/null && fnm env --use-on-cd | source

    # Better ls
    command -v eza &> /dev/null && alias ls='eza --icons --group-directories-first -1'

    # Abbrs
    abbr lg 'lazygit'
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l 'ls'
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'
    abbr linoffice '/home/artemis/.local/bin/linoffice/src/linoffice.sh'

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end


    # Custom fish config
    set -q XDG_CONFIG_HOME && set -l cConf $XDG_CONFIG_HOME/caelestia || set -l cConf $HOME/.config/caelestia
    source $cConf/user-config.fish 2> /dev/null
end

# fnm default node bin (permanent, non-interactive safe)
fish_add_path /home/artemis/.local/share/fnm/aliases/default/bin

# opencode
fish_add_path /home/artemis/.opencode/bin

# claude
fish_add_path /home/artemis/.local/bin

# === 9Router for Claude Code ===
set -gx ANTHROPIC_BASE_URL http://localhost:20128          # no /v1 suffix
set -gx ANTHROPIC_AUTH_TOKEN sk-b22761d0e74fb741-1d7o5d-7404b60a # bearer token
set -gx ANTHROPIC_MODEL kr/auto
set -gx CLAUDE_CODE_ENABLE_GATEWAY_MODEL_DISCOVERY 1
set -gx CLAUDE_CODE_DISABLE_UNKNOWN_MODEL_WINDOW_ENFORCEMENT 1
# === End 9Router ===