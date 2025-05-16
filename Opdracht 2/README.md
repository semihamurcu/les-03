# ⚙️ Opdracht 2 – Provisioning met Ansible op gedeployde Ubuntu VM

In deze opdracht wordt met behulp van Ansible een reeks configuraties toegepast op een eerder gedeployde Ubuntu 24.04 VM, uitgerold via Terraform op een lokale ESXi-omgeving. Hierbij wordt gebruikgemaakt van een automatisch gegenereerde inventory, SSH key-authenticatie en meerdere playbooks die specifieke beheertaken uitvoeren.

---

## 📚 Bronnen

- **Brightspace Week 3 - Infrastructure as Code: Ansible**  
  [https://leren.windesheim.nl/d2l/le/lessons/98305/topics/1223773](https://leren.windesheim.nl/d2l/le/lessons/98305/topics/1223773)

- **Prompt engineering en ondersteuning met behulp van AI**  
  [https://chat.openai.com/share/...](https://chat.openai.com/share/...)

---

## 🛠️ Functionaliteit Ansible Playbooks

De volgende taken worden uitgevoerd op de VM(s), verdeeld over meerdere playbooks:

| Playbook             | Beschrijving                                                             |
|----------------------|---------------------------------------------------------------------------|
| `update_system.yml`  | Voert een `apt update` en `apt upgrade` uit                              |
| `edit_hosts.yml`     | Voegt een regel toe aan `/etc/hosts` met IP + ESXi hostnaam              |
| `add_user.yml`       | Maakt een gebruiker `test` aan met sudo-rechten                          |
| `copy_file.yml`      | Kopieert `opdracht2.txt` vanuit `files/`-map naar de VM                  |
| `backup_cron.yml`    | Maakt een backupscript + cronjob voor `/etc` en `/var/www`               |
| `full_task.yml`      | Combineert alle bovenstaande taken in één playbook voor gebruiksgemak    |

---

## 📁 Structuur en Bestanden

| Bestand               | Functie                                                                 |
|-----------------------|-------------------------------------------------------------------------|
| `inventory.ini`       | Automatisch gegenereerde inventory met IP + SSH-sleutel                |
| `files/opdracht2.txt` | Tekstbestand dat wordt overgezet naar de VM                            |
| `generate_inventory.sh` | Script dat de inventory aanmaakt op basis van Terraform output        |

---

## 🔐 Authenticatie

Er is gebruikgemaakt van een zelfgegenereerde SSH-sleutel genaamd `devhostnieuw`, die via Cloud-Init is toegevoegd aan de VM (`authorized_keys`).

---

## ▶️ Uitvoeren

1. **Alle taken in één keer uitvoeren:**

Gebruik het samengestelde playbook `full_task.yml` om alle configuratiestappen in één run uit te voeren:


ansible-playbook -i inventory.ini full_task.yml

Je kunt er ook voor kiezen om elke taak afzonderlijk uit te voeren met de losse playbooks:
ansible-playbook -i inventory.ini update_system.yml
ansible-playbook -i inventory.ini edit_hosts.yml
ansible-playbook -i inventory.ini add_user.yml
ansible-playbook -i inventory.ini copy_file.yml
ansible-playbook -i inventory.ini backup_cron.yml

## Aantoonbaarheid van scripts

pm4 toont:
* Scripts worden samen in full_task.yml uitgevoerd.
* Daarna wordt er ingelogd in de vm doormiddel van ssh.
* Alles wordt nagelopen om te controleren of het is gelukt.
