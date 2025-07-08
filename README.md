# passwordless-ssh-login-setup

Automate root SSH access and passwordless login on a Linux server (e.g., AWS EC2) using three simple scripts:

* **enable-root-login.sh**: Enable root login, password authentication, and set initial passwords.
* **configure-ssh-access.sh**: Generate an SSH key locally and install it on the target VM.
* **harden-target.sh**: Disable password authentication and enforce key-only root login.

## Quickstart

1. **Bootstrap the target VM**

   ```bash
   # As user-data or root
   ./enable-root-login.sh
   ```
2. **Install your SSH key**

   ```bash
   chmod +x configure-ssh-access.sh
   ./configure-ssh-access.sh
   # Then verify:
   ssh -i ~/.ssh/ssh-new/ssh-new-id root@<TARGET_IP>
   ```
3. **Harden the server**

   ```bash
   chmod +x harden-target.sh
   sudo ./harden-target.sh
   ```

## Security

* **Change default password** (`hello2323`) immediately.
* **Protect private keys**: `chmod 600 ~/.ssh/ssh-new/ssh-new-id`.
* **Restrict SSH access** via firewall/security groups.

## License

MIT License. See [LICENSE](LICENSE)
