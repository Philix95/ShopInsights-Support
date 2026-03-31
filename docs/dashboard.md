# Dashboard

Das **Umsatz-Dashboard** bietet einen schnellen Überblick über den Umsatzverlauf deines Shops. Es visualisiert Bestelldaten aus Shopware als interaktives Liniendiagramm – aufgeschlüsselt nach Bestellstatus und frei konfigurierbarem Zeitraum.

Das Dashboard ist in der Administration unter **Katalog → Shop Insights → Umsatz-Dashboard** zu finden.

---

## Übersicht der Funktionen

### Liniendiagramm

Das zentrale Element des Dashboards ist ein interaktives Liniendiagramm (basierend auf ApexCharts über das native Shopware `sw-chart`-Komponente):

- **Eine Linie pro Bestellstatus** – Jeder Status (z. B. „Offen", „In Bearbeitung", „Abgeschlossen") erhält eine eigene farbige Linie.
- **Gestrichelte Gesamtlinie** – Eine zusätzliche Linie zeigt die Summe aller Status.
- **Lückenlose Zeitachse** – Zeiträume ohne Bestellungen werden mit dem Wert 0 angezeigt, sodass die Achse immer vollständig ist.
- **Dynamische Farbgebung** – Jeder Status bekommt automatisch eine eindeutige Farbe aus einer 10-Farben-Palette.
- **Horizontales Scrollen** – Bei vielen Zeitintervallen ist das Diagramm horizontal scrollbar.

---

### Datentabelle

Unterhalb des Diagramms wird eine sortierbare Tabelle angezeigt:

- **Spalten:** Ein Eintrag pro Zeitintervall (z. B. `2024-03`, `2024-04`, …)
- **Zeilen:** Ein Eintrag pro Bestellstatus plus eine **Summenzeile** am Ende
- **Sticky Header:** Die Kopfzeile bleibt beim Scrollen sichtbar
- **Sortierbar:** Durch Klick auf einen Spaltenkopf lässt sich die Tabelle sortieren

---

## Steuerelemente

### Zeitintervall-Wähler

Ein Slider zum Wechseln zwischen den fünf Zeitintervallen:

| Intervall | Typischer Einsatz |
|---|---|
| **Tag** | Kurzfristige Analyse, max. wenige Wochen |
| **Woche** | Wochentliche Trends, typisch 3 Monate |
| **Monat** | Standard-Ansicht, typisch 12 Monate |
| **Quartal** | Saisonale Vergleiche, typisch 2 Jahre |
| **Jahr** | Langfristige Entwicklung, typisch 3 Jahre |

Beim Wechsel des Intervalls passt sich der Standardzeitraum automatisch an.

---

### Datumsbereich

Zwei Datumsfelder (Shopware-Datepicker) ermöglichen das freie Einschränken des Zeitraums:

- **Von** – Startdatum der Auswertung
- **Bis** – Enddatum der Auswertung (Standard: heute)

Die Daten werden bei jeder Änderung sofort neu geladen.

---

### Bestellstatus-Filter

Ein Dropdown-Filter ermöglicht die Einschränkung auf bestimmte Bestellstatus:

- Die verfügbaren Status werden live aus Shopware geladen (State Machine `order.state`)
- **Suche:** Eingabefeld zum schnellen Finden eines Status
- **Alle auswählen / Alle abwählen:** Mit einem Klick alle Status ein- oder ausblenden
- Standardmäßig sind alle Status eingeschlossen (kein Filter aktiv)

---

## Tipps zur effektiven Nutzung

**Stornierungen ausblenden:** Deaktiviere im Status-Filter den Status „Storniert", um nur tatsächlich realisierten Umsatz zu sehen.

**Umsatz vs. Bestelleingang:** Das Dashboard zeigt `amountTotal` (Gesamtbetrag inkl. MwSt.) zum Zeitpunkt der Bestellung. Rückerstattungen oder nachträgliche Änderungen werden nicht automatisch berücksichtigt.

**Leeres Diagramm:** Wenn keine Daten angezeigt werden, überprüfe zuerst den Datumsbereich und den Statusfilter. Mehr dazu unter [Häufige Fehler → Dashboard zeigt keine Daten](haeufige-fehler.md#2-dashboard-zeigt-keine-daten).

**Großer Zeitraum:** Bei sehr langen Zeiträumen (z. B. „Tag" über mehrere Jahre) kann die Ladezeit steigen. Empfehlung: Zeitraum einschränken oder auf ein größeres Intervall wechseln.
