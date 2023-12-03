if status is-interactive
  and not set -q TMUX
    exec tmux
    # Commands to run in interactive sessions can go here
end
# begin; set -lx EDITOR neovim; crontab -e; end
set -Ux OPENAI_API_KEY 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
set -gx EDITOR /usr/bin/nvim
alias zi "NVIM_APPNAME=zh-nvim nvim"
alias maiden "maiden-remote-repl --host 192.168.43.179"
alias bat "batcat"
alias mvi "~/neov/bin/nvim"
alias scsynth "/mnt/c/Program\ Files/SuperCollider-3.10.2/scsynth.exe"  
alias vi "nvim"
alias lua "lua5.4"
alias ts "tree-sitter"
alias py '/usr/bin/python3.10'
# alias ghci "/mnt/d/ghcup/bin/ghci.exe"  
fish_add_path ~/.cargo/bin
fish_add_path ~/im-select
fish_add_path /snap/bin
fish_add_path ~/.config/emacs/bin
fish_add_path ~/.local/bin
fish_add_path ~/.ghcup/bin
fish_add_path ~/.local/share/nvim/mason/bin
fish_add_path ~/julia-1.8.1/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/go/bin
starship init fish | source
set -e XDG_RUNTIME_DIR
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/n451/.ghcup/bin # ghcup-env

# opam configuration
source /home/n451/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
