# Setup Instructions

## Step 1: Initialize Project Directory

### For Windows (Run inside WSL Terminal)
```bash
cd ~
mkdir -p ~/projects/code/.devcontainer
cd ~/projects/code
```

### For macOS (Run inside Standard Terminal)
```bash
mkdir -p ~/projects/code/.devcontainer
cd ~/projects/code
```

## Step 2: Copy the example files
Copy the example files devcontainer.json and Dockerfile into the .devcontainer folder


## Step 3: Open and Run Workspace

1. Open **VS Code**.
2. Mount the workspace directory target:
   * **Windows:** Open your WSL remote terminal window first, select **File > Open Folder...**, then choose `/home/yourname/projects/krss-enterprise-dev`.
   * **macOS:** Choose **File > Open Folder...** and select `~/projects/krss-enterprise-dev`.
3. Press `Ctrl + Shift + P` (Windows) or `Cmd + Shift + P` (Mac) to open the Command Palette.
4. Type **`Dev Containers: Reopen in Container`** and hit Enter.

