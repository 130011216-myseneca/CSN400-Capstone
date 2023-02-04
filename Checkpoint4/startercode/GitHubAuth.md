# Authentication to GitHub

You can access and write data in repositories on your GitHub Enterprise Server instance using SSH (Secure Shell Protocol). When you connect via SSH, you authenticate using a private key file on your local machine.

When you set up SSH, you will need to generate a new private SSH key and add it to the SSH agent. You must also add the public SSH key to your account on GitHub Enterprise Server before you use the key to authenticate. To work in Azure Portal CLI shell, you must authenticate to GitHub with SSH. Follow instructions in below steps to configure ssh authentication for GiTHub in your Azure Portal CLI.

### How to configure GitHub SSH Authentication

1. [Generating a new SSH key and adding it to the ssh-agent](https://docs.github.com/en/enterprise-server@3.4/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
2. [Adding a new SSH key to your GitHub account](https://docs.github.com/en/enterprise-server@3.4/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Generating a new SSH key and adding it to the ssh-agent

```bash
# Generating a new SSH key
ssh-keygen -t ed25519 -C "your_email@example.com"

# Start the ssh-agent in the background
eval "$(ssh-agent -s)"

# Add your SSH private key to the ssh-agent
ssh-add ~/.ssh/id_ed25519
```

---

Useful Links:

- [Creating a personal access token - Used for working with ngitHub APIs](https://docs.github.com/en/enterprise-server@3.4cn/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
