# Installation und Setup

## Systemanforderungen

| Komponente | Mindestversion |
|---|---|
| Shopware | 6.7.0 |
| PHP | 8.2 |

> **Hinweis:** Shop Insights benötigt keine zusätzliche Datenbankmigration und legt keine eigenen Tabellen an. Das Plugin liest ausschließlich die vorhandenen Shopware-Bestelldaten.

---

## Installation über den Shopware Store

1. Melde dich in deiner Shopware Administration an.
2. Gehe zu **Erweiterungen → Store → Suche** und suche nach „Shop Insights".
3. Kaufe oder installiere das Plugin.
4. Gehe zu **Erweiterungen → Meine Erweiterungen**, suche „Shop Insights" und aktiviere es.
5. Leere den Cache unter **Einstellungen → System → Caches & Indizes → Cache leeren**.

---

## Installation über Composer (für Entwickler)

Wenn du das Plugin als Entwickler direkt in einer Shopware-Instanz installierst:

```bash
# Plugin-Dateien in den richtigen Ordner kopieren oder klonen
cd /var/www/html/custom/plugins
git clone <repository-url> ShopInsights

# Plugin registrieren und aktivieren
bin/console plugin:refresh
bin/console plugin:install --activate ShopInsights

# Cache leeren
bin/console cache:clear
```

Falls du mit dem Shopware-Docker-Setup arbeitest:

```bash
docker exec -it <container-name> bin/console plugin:refresh
docker exec -it <container-name> bin/console plugin:install --activate ShopInsights
docker exec -it <container-name> bin/console cache:clear
```

---

## Erste Schritte nach der Installation

Nach erfolgreicher Installation erscheint in der Shopware Administration unter **Katalog** ein neuer Menüpunkt **Shop Insights** mit zwei Unterseiten:

- **Umsatz-Dashboard** – Überblick über den Umsatzverlauf nach Zeitraum und Bestellstatus
- **Report Builder** – Flexibler Bericht mit frei wählbaren Kennzahlen und Dimensionen

Das Plugin benötigt keine weitere Konfiguration – es ist nach der Aktivierung sofort einsatzbereit.

---

## Admin-Build (nur bei manuellem Deployment)

Wenn du das Plugin in einer Produktivumgebung ohne automatischen Build-Prozess einsetzt, stelle sicher, dass der Admin-Build aktuell ist. Das Plugin liefert einen vorcompilierten Build mit, sodass in den meisten Fällen **kein manueller Build nötig** ist.

Falls der Build dennoch fehlschlägt oder die Oberfläche nicht korrekt dargestellt wird:

```bash
# Admin-Build neu erstellen (nur wenn nötig)
bin/console bundle:dump
bin/build-administration.sh
```

---

## Häufige Installationsprobleme

**Plugin erscheint nicht unter „Meine Erweiterungen"**
→ Führe `bin/console plugin:refresh` aus und lade die Seite neu.

**Menüpunkt „Shop Insights" fehlt in der Administration**
→ Cache leeren (`bin/console cache:clear`) und den Browser-Cache leeren (Strg+Shift+R).

**Fehler „Class not found" nach der Installation**
→ Prüfe, ob der Autoloader aktuell ist: `composer dump-autoload`

Weitere Fehlerfälle sind unter [Häufige Fehler](haeufige-fehler.md) beschrieben.
