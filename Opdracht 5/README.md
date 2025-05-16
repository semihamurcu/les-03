# Opdracht 5 – Proxmox VM Backup Playbook

## Beschrijving

Dit Ansible playbook maakt backups van alle virtuele machines op een Proxmox Hypervisor.  
De Proxmox API wordt gebruikt om automatisch backups te starten en op te slaan in de opgegeven storage.

---

## Gebruikte parameters

- **API gebruiker:** `test`  
- **API wachtwoord:** `test`  
- **API host:** `node1`  
- **Backup storage:** `backup_vm`

---

## Voorwaarden

- Proxmox community Ansible module moet geïnstalleerd zijn.  
- Toegang tot de Proxmox API met bovenstaande credentials.

---

## Playbook gebruiken

Run het playbook met:

```bash
ansible-playbook -i inventory.ini proxmox_backup.yml
