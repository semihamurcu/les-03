# Opdracht 1 – Terraform VM deployment op ESXi

# Bron
https://chatgpt.com/share/6824b421-e684-8007-ba81-ee9c8f4900c3

## 📌 Doel
In deze opdracht wordt er met behulp van Terraform een virtuele machine (VM) uitgerold op een lokale ESXi-host. Na deployment wordt automatisch een Ansible-inventorybestand aangemaakt waarin de VM is opgenomen. SSH-toegang tot de VM wordt geregeld via een SSH-sleutel.

## 🛠️ Benodigdheden
- Lokale ESXi-host (met IP, gebruikersnaam en wachtwoord)
- Terraform geïnstalleerd
- SSH-sleutelpaar gegenereerd (`devhostnieuw` en `devhostnieuw.pub`)
- Een geldig Ubuntu 24.04 cloud image OVF

## 📂 Bestanden in deze opdracht
| Bestand         | Uitleg |
|------------------|--------|
| `main.tf`        | Terraform-configuratie voor het deployen van de VM en het genereren van de inventory. |
| `providers.tf`   | Bevat de configuratie voor de gebruikte Terraform-providers (`esxi`, optioneel `azurerm`). |
| `inventory.ini`  | Wordt automatisch gegenereerd met het IP-adres van de VM en Ansible-configuratie. |
| `~/.ssh/devhostnieuw` | Privésleutel voor SSH-toegang (lokaal aanwezig, niet gecommit). |
| `~/.ssh/devhostnieuw.pub` | Publieke sleutel die aan de VM gekoppeld kan worden (lokaal aanwezig, optioneel gebruikt met cloud-init). |
| `metadata.yaml	` | Cloud-init metadata met o.a. de hostname van de VM.
| `userdata.yaml	` | Cloud-init gebruikersdata, zoals SSH-sleutels en gebruikersinstellingen.


## ▶️ Uitvoeren van de code

1. **Initialiseer Terraform**  
   ```bash
   terraform init and apply

# Opdracht 2 – Ansible automatisering

## 📌 Doel
In deze opdracht worden meerdere taken geautomatiseerd uitgevoerd op de VM die is uitgerold in opdracht 1. Hiervoor worden aparte Ansible playbooks gebruikt.

full_task.yml	Voert alle taken uit in één playbook.
update.yml	Alleen apt update & upgrade.
hosts_edit.yml	Voegt regel toe aan /etc/hosts om esxi te koppelen aan een IP.
add_user.yml	Maakt gebruiker test aan.
copy_file.yml	Kopieert lokaal bestand naar de VM (files/opdracht2.txt).
backup_cron.yml	Maakt een script aan en voegt een cronjob toe voor backup.
files/opdracht2.txt	Bestand dat naar de VM wordt gekopieerd.
