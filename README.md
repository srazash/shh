# shh

```
███████╗██╗  ██╗██╗  ██╗██╗
██╔════╝██║  ██║██║  ██║██║
███████╗███████║███████║██║
╚════██║██╔══██║██╔══██║╚═╝
███████║██║  ██║██║  ██║██╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝
```

## Intro

A local-first secret manager inspired by AWS Secrets Manager and Azure Key Vault.

## Features (planned for the initial release)

- Secrets locally stored in SQLite database
- All secrets encrypted at rest with AES-256
- Master password protects access to secrets
- Secrets queryable via STDIN/STDOUT (scriptable) and interactively in the terminal
