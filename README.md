# Lazy Neovim Dots

This is my personal Neovim setup, optimized for efficiency and featuring various plugins and custom configurations.

## Prerequisites

Ensure you are using Ubuntu (or any Debian-based distribution). You need to install the latest version of Neovim first.

### Step 1: Install Neovim

1. Open a terminal.

2. Use the following commands to download and install the latest version of Neovim from the official website:

```bash
# Install required dependencies
sudo apt update

# Add the Neovim stable release PPA
wget -qO- https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz | tar xz -C /opt

# Add Neovim to your PATH
echo 'export PATH=$PATH:/opt/nvim-linux64/bin' >> ~/.bashrc

# Source your bashrc to update the PATH
source ~/.bashrc

# Verify Neovim installation
nvim --version
```

### Step 2: Clone the Repository

Once Neovim is installed, you can proceed by cloning the repository containing the Neovim setup. Execute the following command:

```bash
git clone https://github.com/HHDVasishtPranav/Lazy-neovim-dots ~/.config/nvim
```

This will clone the repository to the default Neovim configuration directory (`~/.config/nvim`).

### Step 3: Install Language Servers and Plugins

This setup relies on `lazy.nvim` to manage plugins. In order to install the required language servers and plugins, follow these instructions:

1. **Install Language Servers:**

   The following language servers are necessary for proper functionality based on the languages in use:

   - **Python (Pyright):**

     ```bash
     npm install -g pyright
     ```

   - **HTML and CSS (vscode-langservers-extracted):**

     ```bash
     npm install -g vscode-langservers-extracted
     ```

   - **C/C++ (Clangd):**

     ```bash
     sudo apt install clangd
     ```

2. **Install Plugins:**

   To install the required plugins, open Neovim and run the following command:

   ```bash
   nvim
   ```

   Inside Neovim, execute:

   ```bash
   :PackerSync
   ```

   This command will install and sync all the plugins listed in the configuration.

### Step 4: Customize the Configuration

You can further personalize your Neovim setup by modifying the `init.lua` configuration file, located at `~/.config/nvim/init.lua`. In this file, you can adjust key mappings, plugin settings, appearance, and other preferences to suit your workflow.

---
