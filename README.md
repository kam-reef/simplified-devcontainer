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

*Tip:* The Dockerfile is only needed for customization beyond the devontainer.json For example, if you need additional non-devcontainer features or to copy configuraiton files into the container. 


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

*Tip:* You can select a specific base container image [build tag](https://mcr.microsoft.com/v2/devcontainers/python/tags/list) to utilize a specific version in your devcontainer.

### Security

**TLDR:** This JSON creates a hybrid security model by **splitting ownership**. It combines strict, automated security controls provided by external trusted cloud registries with isolated, non-root user controls managed locally inside your container.

Here is the breakdown of how it works in plain English:

### 1. Trusted Cloud Supply Chain (The "Top-Down" Security)
* **Verified Base Image:** By using `mcr.microsoft.com` (Microsoft Artifact Registry), you are pulling a base operating system that is officially maintained, scanned for vulnerabilities, and cryptographically signed. 
* **Official Managed Features:** Instead of manually running arbitrary, unverified install scripts (`apt-get install` or random `curl | bash` commands), the `"features"` block pulls signed, official building blocks directly from GitHub's verified registry (`ghcr.io`). This prevents "supply chain attacks" where a malicious dependency could slip into your system.

### 2. Guarded Local Sandbox (The "Bottom-Up" Security)
* **No Root Access:** The line `"remoteUser": "vscode"` is the anchor of the local security model. By default, containers run as `root` (administrator). If a piece of malicious code runs inside a root container, it could potentially break out and compromise your host machine. By forcing the container to run as a standard, restricted user (`vscode`), the blast radius of any code execution is strictly contained.
* **Isolated Tools:** Your host machine stays perfectly clean. Tools like the Azure CLI, Terraform, and Python are trapped inside this specific sandbox. They cannot touch your actual host operating system, configuration files, or other local network resources unless you explicitly allow it. 

### In Short
The hybrid model ensures that **where the tools come from** is verified and secured by cloud providers, while **how the tools behave** on your machine is sandboxed as a non-privileged user.