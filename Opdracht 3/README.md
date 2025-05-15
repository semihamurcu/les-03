# Opdracht 3 – Terraform deployment met cloud-init op ESXi

## Bron
https://chatgpt.com/share/6825f095-25d8-8002-ad84-8aaf723c2ca9

## 📌 Doel
In deze opdracht wordt een virtuele machine (VM) gedeployed op een lokale ESXi-host met behulp van Terraform. Tijdens de deployment wordt cloud-init gebruikt om automatisch gebruikersinstellingen, SSH-toegang en eventuele software-installaties te configureren.

## 🛠️ Benodigdheden
- Lokale ESXi-host (IP-adres, gebruikersnaam en wachtwoord)
- Terraform geïnstalleerd (v1.6+ aanbevolen)
- SSH-sleutelpaar aanwezig op het systeem
- Ubuntu 24.04 cloud image (OVF of OVA) geïmporteerd op de ESXi-host

## 📂 Bestanden in deze opdracht
| Bestand               | Uitleg |
|------------------------|--------|
| `main.tf`             | Terraform-configuratie voor het aanmaken van de VM en het koppelen van cloud-init. |
| `variables.tf`        | Variabelen die gebruikt worden in de configuratie, zoals VM-naam of netwerk. |
| `userdata.yaml`       | Cloud-init configuratie met o.a. gebruikers, SSH-sleutels en packages. |
| `📄 metadata.yaml.tftpl` | Templatebestand voor metadata t.b.v. cloud-init, bevat o.a. hostname. |
| `README.md`           | Deze handleiding voor het uitvoeren van de opdracht. |

## ▶️ Uitvoeren van de code

1. **Initialiseer Terraform**
   ```bash
   terraform init

2. **Pas de configuratie**
   ```bash
   terraform apply

   
c:\Users\Semih.Hamurcu\OneDrive - Windesheim Office365\24-25\4. Infrastructure as Code\les-03\Opdracht 3\Opdracht 3 .mp4


<video controls src="Opdracht 3 .mp4" title="Title"></video>
