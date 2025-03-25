#!/bin/bash
# write by zuyan
# Check if Fish is installed
if ! command -v fish &>/dev/null; then
    echo "Fish shell is not installed. Installing now..."
    
    # Install Fish in Termux
    pkg update && pkg install -y fish

    echo "Fish shell installed successfully!"
else
    echo "Fish shell is already installed."
fi

# Set Fish as the default shell in Termux
echo "Setting Fish as the default shell for Termux..."
chsh -s fish

# Create Fish config directory if it doesn't exist
mkdir -p ~/.config/fish

# Ask for user input for the prompt name
read -p "Enter your name: " username

# Save custom Fish prompt
cat <<EOF > ~/.config/fish/config.fish
clear
set fish_greeting ""
echo "Welcome to $username's Shell! Enjoy your session."
if status is-interactive
    function fish_prompt
        set_color normal
        echo -n "╭──("

        set_color red
        echo -n "$username"

        set_color normal
        echo -n ")-["

        set_color green
        echo -n (date +'%H:%M:%S')

        set_color yellow
        echo -n "•"

        set_color cyan
        echo -n (prompt_pwd)

        set_color normal
        echo -n "]"

        echo ""

        set_color white
        echo -n "╰────> "

        set_color normal
    end
end
EOF

echo "Fish prompt updated! Restart your terminal or run 'source ~/.config/fish/config.fish' to apply changes."