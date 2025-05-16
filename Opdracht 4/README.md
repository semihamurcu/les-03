# Opdracht 4 – Ansible Playbook voor Web en Database Server Installatie

Deze opdracht hoort bij de `productie` branch van het project. In deze fase automatiseren we de installatie van software op de eerder gedeployde virtuele machines.

## Bron

https://chatgpt.com/c/6824b518-84ec-8002-972f-05f32110c11a?src=history_search


## 🔧 Doel

Het playbook `install_packages.yaml` installeert automatisch:
- 📦 `nginx` op de **webservers** (`web1`, `web2`)
- 🗃️ `mariadb-server` op de **database server** (`db1`)

De installatie gebeurt op basis van de groepen `[web]` en `[db]` in het Ansible `inventory.ini` bestand dat in opdracht 3 automatisch gegenereerd werd.

---

## 📁 Bestanden

| Bestand                | Uitleg                                                             |
|------------------------|--------------------------------------------------------------------|
| `install_packages.yaml` | Het Ansible playbook dat nginx en mariadb installeert            |
| `inventory.ini`        | Automatisch gegenereerde Ansible inventory (van opdracht 3)       |

---

## 🚀 Gebruik

Zorg dat je in de `productie` branch zit en voer de playbook uit:

ansible-playbook -i inventory.ini install_packages.yaml

## Video

pm4 toont deployment van NGINX en MariaDB.
