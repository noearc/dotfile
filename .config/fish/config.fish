if status is-interactive
  and not set -q TMUX
    exec tmux
    # Commands to run in interactive sessions can go here
end
# begin; set -lx EDITOR neovim; crontab -e; end
alias bat "batcat"
alias scsynth "/mnt/c/Program\ Files/SuperCollider-3.10.2/scsynth.exe"  
alias ghci "/mnt/d/ghcup/bin/ghci.exe"  
fish_add_path ~/.cargo/bin
fish_add_path /snap/bin
fish_add_path ~/.config/emacs/bin
fish_add_path ~/.local/bin
fish_add_path ~/.ghcup/bin
fish_add_path ~/.local/share/nvim/mason/bin

starship init fish | source
