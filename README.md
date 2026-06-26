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

At this point in the steps, VScode may prompt you to build the container. You can read more about building devcontainers [here](https://code.visualstudio.com/docs/devcontainers/create-dev-container#_add-configuration-files-to-a-repository).

## Maintenance

Editing the devcontainer.json file will trigger a container rebuild. When the base container image is updated by the provider, press `Ctrl + Shift + P` (Windows) or `Cmd + Shift + P` (Mac) to open the Command Palette and manually trigger a rebuild.

There are many base container images available for practically any need, see the [Microsoft Artifact Registry](https://mcr.microsoft.com/en-us/catalog?search=devcontainer) for more information.

Tip: You can select a specific base container image [build tag](https://mcr.microsoft.com/v2/devcontainers/python/tags/list) to utilize a specific version in your devcontainer.