# 🧱 Opdracht 1 – VM Deployment met Terraform op ESXi

In deze opdracht wordt met behulp van **Terraform** een Ubuntu 24.04 VM uitgerold op een lokale **ESXi**-server. Hierbij wordt gebruik gemaakt van een publieke OVA, Cloud-Init configuratie, en SSH key authenticatie.

## Bronnen

Opstart van opdracht gebruik gemaakt van Brightspace.
Week 2 - Hello, Terraform!
https://leren.windesheim.nl/d2l/le/lessons/98305/topics/1223766


Vervolgens script verder uitgewerkt doormiddel van AI voor de (Inventory.ini)

https://chatgpt.com/share/6825f095-25d8-8002-ad84-8aaf723c2ca9



---

## 🖥️ Infrastructuurdetails

- **Platform:** ESXi (lokale hypervisor)
- **OS:** Ubuntu 24.04 LTS (cloud image)
- **Provisioning:** Terraform + Cloud-Init
- **Authenticatie:** SSH key-based (geen wachtwoord)
- **Cloud-Init functionaliteit:**
  - Hostnaam instellen
  - User `ubuntu` aanmaken met sudo-rechten
  - SSH authorized key instellen

---

## 📁 Bestanden

| Bestand             | Functie                                         |
|----------------------|-------------------------------------------------|
| `main.tf`            | Terraform manifest voor de VM                 |
| `metadata.yaml`      | Cloud-Init metadata (hostname configuratie)   |
| `userdata.yaml`      | Cloud-Init userdata (user + SSH configuratie) |
| `providers.tf`       | Providerconfiguratie voor ESXi                |
| `inventory.ini`      | Wordt later gegenereerd via Terraform output  |

---

## 🚀 Deployen

1. Pas eventueel je `providers.tf` aan met de juiste ESXi IP + credentials.
2. Zorg dat je SSH key (`~/.ssh/devhostnieuw`) correct is ingesteld.
3. Initieer Terraform:
   ```bash
   terraform init
   terraform apply

Voor resultaat zie video Week1.mp4
Video toont:
* Deployen van een vm naar de ESXI genaamd week3vm.
* Inventory wordt aangemaakt met het IP wat die krijgt.
* Kleine detail is dat de main.tf dus wacht tot die een ip krijgt -> Daarna maakt die een inventory file aan.


