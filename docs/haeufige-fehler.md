# Häufige Fehler

---

## 1. Plugin lässt sich nicht installieren

**Problem:** Nach dem Hochladen erscheint das Plugin nicht unter „Meine Erweiterungen", oder die Installation schlägt mit einem Fehler fehl.

**Mögliche Ursachen:**
- Der Plugin-Ordner trägt nicht den Namen `ShopInsights`
- Die Shopware-Version ist nicht kompatibel (mindestens 6.7.0 erforderlich)
- PHP-Version ist zu alt (mindestens 8.2 erforderlich)
- Composer-Autoloader ist nicht aktuell

**Lösung:**
```bash
# 1. Sicherstellen, dass der Ordnername stimmt
ls custom/plugins/
# Erwartet: ShopInsights/

# 2. Plugin-Liste aktualisieren
bin/console plugin:refresh

# 3. Autoloader neu generieren
composer dump-autoload

# 4. Plugin installieren
bin/console plugin:install --activate ShopInsights

# 5. Cache leeren
bin/console cache:clear
```

Prüfe außerdem die Shopware-Logs unter `var/log/` auf detaillierte Fehlermeldungen.

---

## 2. Dashboard zeigt keine Daten

**Problem:** Das Umsatz-Dashboard ist leer, das Diagramm zeigt keine Linien oder die Datentabelle bleibt leer.

**Mögliche Ursachen:**
- Der gewählte Datumsbereich enthält keine Bestellungen
- Der Bestellstatus-Filter schließt alle relevanten Bestellungen aus
- Es existieren noch keine Bestellungen in der Shopware-Instanz (z. B. frische Testinstallation)
- Die API-Anfrage schlägt still fehl (Berechtigungsfehler oder Netzwerkproblem)

**Lösung:**
1. Setze den Datumsbereich auf einen weiten Zeitraum (z. B. 01.01.2020 bis heute)
2. Stelle sicher, dass im Statusfilter mindestens ein Status aktiv ist oder alle ausgewählt sind
3. Öffne die Browser-Entwicklertools (F12) → Tab „Netzwerk" → suche nach Anfragen an `/api/shop-insights/revenue` und prüfe den Statuscode und die Antwort
4. Prüfe die Shopware-Logs auf API-Fehler: `var/log/shopware_*.log`

---

## 3. Fehler nach Shopware-Update

**Problem:** Nach einem Shopware-Update zeigt das Plugin einen Fehler oder die Administration lädt nicht mehr korrekt.

**Mögliche Ursachen:**
- Der Admin-Build ist veraltet
- Die Shopware-Version ist nicht mehr kompatibel (prüfe [Kompatibilitätstabelle](kompatibilitaet.md))
- Interne API-Änderungen in Shopware betreffen die Plugin-Endpunkte

**Lösung:**
```bash
# 1. Cache leeren
bin/console cache:clear

# 2. Falls der Admin-Build veraltet ist
bin/console bundle:dump
bin/build-administration.sh

# 3. Plugin-Kompatibilität prüfen
bin/console plugin:refresh
```

Prüfe anschließend unter **Erweiterungen → Meine Erweiterungen**, ob das Plugin noch als „Aktiv" angezeigt wird. Bei Inkompatibilitäten: erstelle ein [Issue](../../issues/new) mit der Shopware-Version und der genauen Fehlermeldung.

---

## 4. Admin-Build schlägt fehl

**Problem:** Der Befehl `bin/build-administration.sh` schlägt mit einem Fehler fehl oder das Shop-Insights-Modul wird nicht in den Build einbezogen.

**Mögliche Ursachen:**
- Node.js oder npm ist nicht installiert oder zu alt
- Der `bin/console bundle:dump`-Schritt wurde übersprungen
- Fehlende Schreibrechte im `public/`-Verzeichnis

**Lösung:**
```bash
# 1. Node-Version prüfen (empfohlen: Node 20+)
node --version
npm --version

# 2. Bundle-Dump aktualisieren
bin/console bundle:dump

# 3. Administration neu bauen
bin/build-administration.sh

# 4. Bei Berechtigungsfehlern
chmod -R 775 public/
```

> **Hinweis:** Shop Insights liefert einen vorcompilierten Build mit (`src/Resources/public/administration/`). In den meisten Shopware-Installationen ist daher **kein manueller Build nötig**. Wenn das Plugin-Modul trotzdem nicht lädt, reicht oft ein Cache-Leerung.

---

## 5. Performance-Probleme bei großen Datenmengen

**Problem:** Das Dashboard oder der Report Builder laden sehr langsam oder das Browser-Tab friert ein.

**Mögliche Ursachen:**
- Zu viele Bestellungen im gewählten Zeitraum
- Feingranulares Intervall (z. B. „Tag") über mehrere Jahre
- Dimensionen mit vielen Entitäten (z. B. alle Produktkategorien oder Länder)

**Lösung:**
- **Zeitraum einschränken:** Reduziere den Datumsbereich auf einen sinnvollen Zeitraum (z. B. letztes Jahr statt alle Zeit)
- **Intervall vergröbern:** Wechsle von „Tag" auf „Monat" oder „Quartal"
- **Top-N-Filter nutzen:** Im Report Builder den Top-N-Wert auf z. B. 10 setzen, um die Datenmenge zu begrenzen
- **Statusfilter nutzen:** Im Dashboard nur relevante Bestellstatus auswählen

Technischer Hinweis: Das Plugin lädt alle passenden Bestellungen in den PHP-Arbeitsspeicher und verarbeitet sie dort. Bei sehr großen Shops (>100.000 Bestellungen) kann die Serverauslastung spürbar sein. Eine Optimierung mit datenbankbasierter Aggregation ist für zukünftige Versionen geplant.

---

## 6. Berechtigungsfehler

**Problem:** Das Dashboard oder der Report Builder zeigt keine Daten und im Browser (F12 → Netzwerk) ist ein HTTP-401- oder HTTP-403-Fehler bei API-Anfragen sichtbar.

**Mögliche Ursachen:**
- Der angemeldete Shopware-Admin-Nutzer hat keine ausreichenden Berechtigungen
- Die Admin-Session ist abgelaufen
- Fehlkonfiguration der Shopware-API-Zugriffsrechte

**Lösung:**
1. Melde dich in der Administration ab und erneut an, um die Session zu erneuern
2. Prüfe unter **Einstellungen → Benutzer & Rechte → Rollen**, ob die Rolle des Nutzers Zugriff auf die API hat
3. Stelle sicher, dass keine Firewall oder ein Reverse-Proxy die API-Anfragen an `/api/shop-insights/*` blockiert
4. Prüfe die Shopware-Logs: `var/log/shopware_*.log`

Bei anhaltenden Berechtigungsfehlern stelle sicher, dass du als **Administrator** angemeldet bist – nur Administratoren haben standardmäßig Zugriff auf alle API-Routen.
