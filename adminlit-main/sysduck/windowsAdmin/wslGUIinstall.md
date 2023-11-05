# WSL GUI Installation Guide

This guide provides steps to update and set WSL 2 as the default version and install graphical Ubuntu.

## Steps

1. **Open Command Prompt as an administrator:**
    - Press Windows key + X.
    - Select Command Prompt (Admin) or Windows PowerShell (Admin).

2. **Update Windows Subsystem for Linux (WSL) to the latest version:**
    - Enter the following command:
    ```powershell
    wsl --update
    ```

3. **Set WSL 2 as the default version:**
    - Enter the following command:
    ```powershell
    wsl --set-default-version 2
    ```

4. **Install the Windows Subsystem for Linux:**
    - Enter the following command:
    ```powershell
    wsl --install
    ```

5. **Restart your computer:**
    - Enter Y to confirm the restart.

6. **Install a graphical Ubuntu distribution (e.g., Ubuntu 20.04):**
    - Open the Microsoft Store.
    - Search for "Ubuntu" and select the desired version (e.g., "Ubuntu 20.04 LTS").
    - Click the Install button.

7. **Launch and configure Ubuntu:**
    - Open the Start menu and locate the installed Ubuntu app.
    - Click on it to launch Ubuntu.
    - Wait for the installation to complete and create a new user account.
    - Set a username and password as prompted.

8. **Install a graphical user interface (GUI) for Ubuntu (e.g., Xfce):**
    - In the Ubuntu terminal, enter the following command to update the package lists:
    ```bash
    sudo apt update
    ```
    - Then, install the Xfce desktop environment by entering:
    ```bash
    sudo apt install xfce4
    ```

9. **Install a Windows X server to enable GUI applications:**
    - Download and install a Windows X server such as VcXsrv from the following link:
    [https://sourceforge.net/projects/vcxsrv/](https://sourceforge.net/projects/vcxsrv/)

10. **Configure the X server:**
    - Launch the installed X server (e.g., VcXsrv) and accept the default settings.
    - When prompted, check the box for "Disable access control" to allow connections.
    - Keep the X server running in the background.

11. **Configure Ubuntu to use the X server:**
    - In the Ubuntu terminal, enter the following command to open the ~/.bashrc file:
    ```bash
    nano ~/.bashrc
    ```
    - Add the following lines at the end of the file:
    ```bash
    export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0.0
    export LIBGL_ALWAYS_INDIRECT=1
    ```
    - Press Ctrl + X to exit, then press Y to save the changes.

12. **Restart Ubuntu:**
    - Close the Ubuntu terminal window.
    - Launch the Ubuntu app again from the Start menu.
    - The graphical user interface should now be available.