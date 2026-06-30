# Simplified DevContainer

## The Problem
Standard DevContainers can become bloated and difficult to manage, often requiring complex, manual setup for cross-platform development environments.

## The Solution
This project provides a clean, minimal boilerplate for `devcontainer.json` and `Dockerfile` to standardize development environments across Windows (WSL) and macOS. See [devcontainer.json](./devcontainer.json).

## The How
I prioritized a **hybrid security model** that splits ownership: leveraging the trust of official cloud registries (Microsoft/GitHub) for the supply chain, while enforcing local sandboxing (non-root execution) for container behavior.

## Key Features
- [ ] Cross-platform compatibility (WSL/macOS)
- [ ] Minimal boilerplate architecture
- [ ] Rootless execution (non-privileged user `vscode`)
- [ ] Verified supply chain integration

## Setup Instructions

### Platform Prerequisites
Before using these DevContainers, ensure your environment meets these requirements:

#### Windows 11
1. **[WSL 2](https://learn.microsoft.com/en-us/windows/wsl/install):** Must be installed and running a supported Linux distribution (e.g., Ubuntu).
2. **[Docker Desktop](https://docs.docker.com/desktop/install/windows-install/):** Ensure WSL 2 integration is enabled in the Docker Desktop settings.
3. **[VS Code](https://code.visualstudio.com/):** Installed on Windows, with the **[Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)** extension installed.

#### macOS
1. **[Docker Desktop](https://docs.docker.com/desktop/install/mac-install/):** Ensure Docker is running.
2. **[VS Code](https://code.visualstudio.com/):** Installed on macOS, with the **[Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)** extension installed.

> **Quick Verification:** Before initializing, run `docker --version`. If it fails, the DevContainer engine cannot build your image.

### Step 1: Initialize Project Directory
```bash
mkdir -p ~/projects/code/.devcontainer
cd ~/projects/code
```

### Step 2: Copy the example files
Copy the example `devcontainer.json` and `Dockerfile` into the `.devcontainer` folder.

*Tip:* The `Dockerfile` is only needed for customization beyond the `devcontainer.json` (e.g., additional system dependencies or custom config file injection).

### Step 3: Open and Run Workspace
1. Open **VS Code**.
2. Mount the workspace directory:
   * **Windows/WSL:** Open your remote terminal, **File > Open Folder...** and select your project root.
   * **macOS:** **File > Open Folder...** and select your project root.
3. Press `Ctrl + Shift + P` / `Cmd + Shift + P` to open the Command Palette.
4. Select **Dev Containers: Reopen in Container**.

## Maintenance
* **Rebuilds:** Editing `devcontainer.json` triggers a rebuild. If you need to force a rebuild, use the **Dev Containers: Rebuild Container** command from the Command Palette `Ctrl + Shift + P` / `Cmd + Shift + P`.
* **Updates:** Base images are available via the [Microsoft Artifact Registry](https://mcr.microsoft.com/en-us/catalog?search=devcontainer). You can pin specific [build tags](https://mcr.microsoft.com/v2/devcontainers/python/tags/list) for version consistency.

## Security
This hybrid model enforces security by splitting ownership:

### 1. Trusted Cloud Supply Chain (Top-Down)
* **Verified Base Images:** Pulling from `mcr.microsoft.com` ensures officially maintained, scanned, and signed base layers.
* **Managed Features:** Using the `"features"` block from `ghcr.io` avoids arbitrary install scripts, mitigating supply chain risks.

### 2. Guarded Local Sandbox (Bottom-Up)
* **No Root Access:** `"remoteUser": "vscode"` restricts the container to a non-privileged user, dramatically reducing the blast radius if an process is compromised.
* **Tool Isolation:** Host machine configuration remains clean; the container sandboxes all tools (Azure CLI, Terraform, Python) within the project scope.

## License
MIT
