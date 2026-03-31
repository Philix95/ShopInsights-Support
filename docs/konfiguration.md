# Konfiguration

Shop Insights hat **keine Plugin-eigene Konfigurationsseite** in den Shopware-Systemeinstellungen. Das Plugin ist direkt nach der Aktivierung einsatzbereit – alle Einstellungen werden interaktiv in der jeweiligen Ansicht vorgenommen.

Die folgenden Abschnitte beschreiben alle Steuerelemente und ihre Standardwerte.

---

## Dashboard-Einstellungen

### Zeitintervall

Bestimmt, nach welcher Zeiteinheit die Bestelldaten gruppiert werden.

| Option | Beschreibung | Standard |
|---|---|---|
| Tag | Umsatz pro Kalendertag | – |
| Woche | Umsatz pro Kalenderwoche (ISO-Format `YYYY-Www`) | – |
| Monat | Umsatz pro Monat (Format `YYYY-MM`) | ✓ Standard |
| Quartal | Umsatz pro Quartal (Format `YYYY-Q1` bis `YYYY-Q4`) | – |
| Jahr | Umsatz pro Kalenderjahr | – |

**Empfehlung:** Für den täglichen Überblick eignet sich „Monat" gut. Für langfristige Trends ist „Quartal" oder „Jahr" übersichtlicher.

---

### Datumsbereich

Legt den Zeitraum fest, den das Dashboard anzeigt. Der Standardwert hängt vom gewählten Intervall ab:

| Intervall | Standardzeitraum (Von) |
|---|---|
| Tag | Vor 1 Monat |
| Woche | Vor 3 Monaten |
| Monat | Vor 12 Monaten |
| Quartal | Vor 2 Jahren |
| Jahr | Vor 3 Jahren |

Das Enddatum ist immer das heutige Datum. Beide Felder lassen sich über den Shopware-Datepicker frei anpassen.

---

### Bestellstatus-Filter

Filtert die angezeigten Daten auf bestimmte Bestellstatus. Die verfügbaren Status werden dynamisch aus Shopware geladen (State Machine `order.state`).

| Option | Beschreibung | Standard |
|---|---|---|
| Alle Status | Keine Filterung, alle Bestellungen werden angezeigt | ✓ Standard |
| Einzelne Status | Nur Bestellungen mit dem gewählten Status werden angezeigt | – |
| Mehrere Status | Kombination beliebiger Status möglich | – |

**Empfehlung:** Für eine saubere Umsatzauswertung empfiehlt es sich, nur abgeschlossene Bestellungen (z. B. Status „Abgeschlossen") einzuschließen und Stornierungen auszuschließen.

---

## Report-Builder-Einstellungen

### Kennzahl (Metric)

Definiert, was gemessen wird.

| ID | Bezeichnung | Aggregation | Beschreibung |
|---|---|---|---|
| `revenue` | Umsatz (Summe) | Summe | Summiert `amountTotal` aller Bestellungen |
| `order_count` | Anzahl Bestellungen | Anzahl | Zählt die Bestellungen |
| `avg_order_value` | Avg. Warenkorbwert | Durchschnitt | Durchschnittlicher Bestellwert |
| `items_sold` | Verkaufte Artikel | Summe | Summe aller Positionen (`lineItems.quantity`) |

Standard: `revenue`

---

### X-Achse (Dimension)

Bestimmt die Gruppierung der Daten auf der X-Achse.

**Zeitbasierte Dimensionen:**

| ID | Bezeichnung | Intervall |
|---|---|---|
| `time_year` | Zeitraum (Jahr) | Jährlich |
| `time_quarter` | Zeitraum (Quartal) | Quartalsweise |
| `time_month` | Zeitraum (Monat) | Monatlich |
| `time_week` | Zeitraum (Woche) | Wöchentlich |
| `time_day` | Zeitraum (Tag) | Täglich |

**Entitäts-Dimensionen:**

| ID | Bezeichnung | Shopware-Entity |
|---|---|---|
| `category` | Produktkategorie | `category` |
| `manufacturer` | Hersteller | `product_manufacturer` |
| `payment_method` | Zahlungsart | `payment_method` |
| `shipping_method` | Versandart | `shipping_method` |
| `customer_group` | Kundengruppe | `customer_group` |
| `country` | Land | `country` |
| `sales_channel` | Verkaufskanal | `sales_channel` |
| `order_status` | Auftragsstatus | `state_machine_state` |

Standard: `time_month`

---

### Aufschlüsselung (Breakdown, optional)

Eine optionale zweite Dimension, die die Daten weiter segmentiert. Es stehen dieselben 13 Dimensionen wie für die X-Achse zur Verfügung.

Standard: `order_status` (kann auf „Keine" gesetzt werden)

**Empfehlung:** Aufschlüsselung nur nutzen, wenn die X-Achse eine Zeit-Dimension ist – sonst kann das Diagramm schnell unübersichtlich werden.

---

### Diagrammtyp

| ID | Bezeichnung | Empfohlen wenn |
|---|---|---|
| `line` | Linie | Zeitbasierte X-Achse |
| `bar` | Balken (gruppiert) | Kategorische X-Achse ohne Aufschlüsselung |
| `stacked_bar` | Balken (gestapelt) | Kategorische X-Achse mit Aufschlüsselung |
| `pie` | Torte | Wenige Kategorien, kein Zeitbezug |

Das Plugin schlägt automatisch den passenden Diagrammtyp vor. Mit dem Button „Auto" wird die automatische Erkennung wieder aktiviert.

---

### Datumsbereich (Report Builder)

Standard: Letzte 12 Monate (Von: heute minus 1 Jahr, Bis: heute). Der Bereich kann frei über den Shopware-Datepicker angepasst werden.

---

### Top-N-Filter

Begrenzt die angezeigten Einträge auf die N größten Werte. Nützlich bei kategorischen Dimensionen mit vielen Einträgen (z. B. alle Länder).

Standard: Alle (kein Limit). Empfohlener Wert bei vielen Kategorien: 10.
