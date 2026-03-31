# Report Builder

Der **Report Builder** ermöglicht das freie Kombinieren von Kennzahlen und Dimensionen, um individuelle Auswertungen deiner Shopware-Bestelldaten zu erstellen. Er ist unter **Katalog → Shop Insights → Report Builder** erreichbar.

---

## Wie ein Report aufgebaut ist

Jeder Report besteht aus bis zu vier Parametern:

1. **Kennzahl** – Was wird gemessen? (z. B. Umsatz, Anzahl Bestellungen)
2. **X-Achse** – Wonach wird gruppiert? (z. B. nach Monat, nach Land)
3. **Aufschlüsselung** *(optional)* – Eine zweite Dimension zur weiteren Segmentierung
4. **Zeitraum** – Welcher Zeitraum wird ausgewertet?

Der Report wird bei jeder Änderung automatisch neu geladen.

---

## Verfügbare Kennzahlen

| Kennzahl | Beschreibung |
|---|---|
| **Umsatz (Summe)** | Summiert den Gesamtbetrag (`amountTotal`) aller Bestellungen im gewählten Zeitraum |
| **Anzahl Bestellungen** | Zählt die Anzahl der Bestellungen |
| **Avg. Warenkorbwert** | Durchschnittlicher Bestellwert im gewählten Zeitraum |
| **Verkaufte Artikel** | Summiert die Artikelmenge aus allen Bestellpositionen |

---

## Verfügbare Dimensionen (X-Achse & Aufschlüsselung)

Es stehen 13 Dimensionen zur Verfügung, die für X-Achse und Aufschlüsselung frei kombiniert werden können.

**Zeitbasierte Dimensionen** – für X-Achse besonders geeignet:

| Dimension | Beschreibung |
|---|---|
| Zeitraum (Jahr) | Gruppiert nach Kalenderjahr |
| Zeitraum (Quartal) | Gruppiert nach Quartal (`YYYY-Q1` bis `YYYY-Q4`) |
| Zeitraum (Monat) | Gruppiert nach Monat (`YYYY-MM`) |
| Zeitraum (Woche) | Gruppiert nach ISO-Kalenderwoche (`YYYY-Www`) |
| Zeitraum (Tag) | Gruppiert nach Kalendertag (`YYYY-MM-DD`) |

**Entitäts-Dimensionen** – für Segmentierungen und Aufschlüsselungen:

| Dimension | Beschreibung |
|---|---|
| Produktkategorie | Kategorie der bestellten Produkte |
| Hersteller | Hersteller der bestellten Produkte |
| Zahlungsart | Gewählte Zahlungsmethode der Bestellung |
| Versandart | Gewählte Versandmethode der Bestellung |
| Kundengruppe | Kundengruppe des Bestellers |
| Land | Rechnungsland der Bestellung |
| Verkaufskanal | Shopware-Verkaufskanal der Bestellung |
| Auftragsstatus | Aktueller Status der Bestellung |

---

## Diagrammtypen

| Diagrammtyp | Automatisch gewählt wenn |
|---|---|
| **Linie** | X-Achse ist eine Zeit-Dimension |
| **Balken (gruppiert)** | X-Achse ist kategorisch, keine Aufschlüsselung |
| **Balken (gestapelt)** | X-Achse ist kategorisch, mit Aufschlüsselung |
| **Torte** | Manuell wählbar, empfohlen bei wenigen Kategorien |

Der Diagrammtyp wird automatisch vorgeschlagen. Über das Dropdown lässt er sich manuell überschreiben. Der Button **„Auto"** setzt die automatische Erkennung zurück.

---

## Anleitung: Einen Report erstellen

### Beispiel 1: Monatlicher Umsatz aufgeschlüsselt nach Zahlungsart

1. **Kennzahl:** Umsatz (Summe)
2. **X-Achse:** Zeitraum (Monat)
3. **Aufschlüsselung:** Zahlungsart
4. **Zeitraum:** letzten 12 Monate

→ Ergebnis: Gestapeltes Balken- oder Liniendiagramm, das zeigt, wie viel Umsatz pro Monat über welche Zahlungsart erzielt wurde.

---

### Beispiel 2: Top-10-Länder nach Bestellanzahl

1. **Kennzahl:** Anzahl Bestellungen
2. **X-Achse:** Land
3. **Aufschlüsselung:** Keine
4. **Top-N:** 10
5. **Zeitraum:** letztes Jahr

→ Ergebnis: Balkendiagramm mit den 10 Ländern, aus denen die meisten Bestellungen kamen.

---

### Beispiel 3: Verkaufte Artikel pro Hersteller und Quartal

1. **Kennzahl:** Verkaufte Artikel
2. **X-Achse:** Zeitraum (Quartal)
3. **Aufschlüsselung:** Hersteller
4. **Zeitraum:** letzten 2 Jahre

→ Ergebnis: Gestapeltes Balkendiagramm, das zeigt, wie viele Artikel je Quartal und Hersteller verkauft wurden.

---

## Datentabelle

Unterhalb des Diagramms wird eine vollständige Datentabelle angezeigt:

- **Spalten:** X-Achsen-Werte (z. B. Monate oder Kategorien)
- **Zeilen:** Ein Eintrag pro Aufschlüsselungs-Segment plus eine **Summenzeile**
- **Sticky Header:** Kopfzeile bleibt beim Scrollen sichtbar
- **Sortierbar:** Durch Klick auf Spaltenköpfe sortierbar

---

## Export-Funktionen

In der aktuellen Version (1.0.0) gibt es **keinen direkten Export-Button**. Die Datentabelle lässt sich jedoch manuell kopieren und in Excel oder ein anderes Tool einfügen. Ein CSV- oder Excel-Export ist für eine zukünftige Version geplant.

---

## Hinweise und Einschränkungen

**Performance bei großen Datenmengen:** Dimensionen wie „Produktkategorie" oder „Hersteller" laden alle Bestellpositionen inklusive der verknüpften Produkte. Bei sehr großen Bestellmengen kann die Ladezeit steigen. Der Top-N-Filter hilft, die Anzeige auf die relevantesten Werte zu begrenzen.

**Avg. Warenkorbwert:** In der aktuellen Version entspricht der Wert der Summe der Bestellbeträge im Intervall (nicht dem echten Durchschnitt pro Bestellung). Für echte Durchschnittswerte eignet sich die Kombination aus „Umsatz (Summe)" geteilt durch „Anzahl Bestellungen" als manuelle Berechnung.

**Aufschlüsselung bei Zeitachse:** Wenn X-Achse und Aufschlüsselung beide Zeit-Dimensionen sind, kann das Ergebnis leer oder unerwünscht sein. Empfehlung: Mische Zeit-Dimensionen immer mit Entitäts-Dimensionen.
