# Kompatibilität

## Plugin-Version und Shopware-Version

| Plugin-Version | Shopware-Version | Status |
|---|---|---|
| 1.0.0 | 6.7.x | ✅ Unterstützt |
| 1.0.0 | 6.6.x und älter | ❌ Nicht unterstützt |

> Shop Insights setzt auf die Shopware-eigene `sw-chart`-Komponente (ApexCharts) und das Shopware-eigene `sw-datepicker`. Diese wurden in ihrer heutigen Form ab Shopware 6.7.0 eingeführt.

---

## Unterstützte PHP-Versionen

| PHP-Version | Status |
|---|---|
| 8.2 | ✅ Unterstützt |
| 8.3 | ✅ Unterstützt |
| 8.1 und älter | ❌ Nicht unterstützt |
| 8.4 | ⚠️ Nicht getestet |

Die Mindestanforderung an PHP ergibt sich aus den Shopware-6.7-Systemanforderungen. Das Plugin selbst nutzt PHP-8.2-Features (readonly Properties, Fibers sind nicht erforderlich, aber `match`-Expressions werden genutzt).

---

## Bekannte Inkompatibilitäten

**Shopware 6.6.x und älter**
Das Plugin ist ausdrücklich nicht für Shopware 6.6 oder ältere Versionen getestet oder freigegeben. Die Nutzung der `sw-chart`-Komponente und des `sw-datepicker` in ihrer heutigen Form ist versionsabhängig. Eine Installation auf 6.6 kann zu JavaScript-Fehlern in der Administration führen.

**Drittanbieter-Chart-Bibliotheken**
Falls ein anderes Plugin eine eigene Version von ApexCharts oder Chart.js global überschreibt, kann es zu Darstellungsfehlern in den Shop-Insights-Diagrammen kommen. In diesem Fall: Prüfe die Browser-Konsole (F12) auf JavaScript-Fehler und versuche, alle anderen Plugins temporär zu deaktivieren.

**Reverse-Proxy / CDN-Konfigurationen**
Wenn die Shopware-Installation hinter einem Reverse-Proxy betrieben wird, der API-Anfragen an `/api/shop-insights/*` blockiert oder umleitet, sind die Shop-Insights-Seiten nicht funktionsfähig. Stelle sicher, dass der Proxy API-Anfragen korrekt weiterleitet.

---

## Hinweise zu Breaking Changes bei Shopware-Updates

### Shopware 6.7.x → zukünftige Versionen

Shopware gibt vorab bekannt, wenn Komponenten wie `sw-chart`, `sw-datepicker` oder die Admin-Navigationsstruktur geändert oder entfernt werden. Achte auf folgende Punkte:

- **`sw-chart`-Komponente:** Wird diese in einer zukünftigen Shopware-Version entfernt oder ersetzt, muss Shop Insights angepasst werden. Prüfe nach jedem Shopware-Minor-Update, ob das Dashboard noch korrekt rendert.
- **`sw-datepicker`-Komponente:** Gilt analog – bei Änderungen am Datepicker kann die Datumsauswahl im Dashboard und Report Builder betroffen sein.
- **Admin-Navigationsstruktur:** Shop Insights hängt sich unter dem Navigationspunkt `sw-catalogue` ein. Sollte Shopware die Menüstruktur grundlegend überarbeiten, kann der Menüpunkt verschwinden oder falsch positioniert sein.
- **API-Authentifizierung:** Das Plugin nutzt die Standard-Shopware-Admin-API-Authentifizierung. Änderungen am Auth-Mechanismus in Shopware können die API-Aufrufe des Plugins betreffen.

**Empfehlung:** Teste Shop Insights nach jedem Shopware-Update in einer Staging-Umgebung, bevor du auf Produktion aktualisierst. Öffne dabei kurz das Dashboard und den Report Builder und prüfe, ob Daten geladen werden.

---

## Changelog

Eine vollständige Liste aller Änderungen ist im [Changelog des Plugin-Repos](../../ShopInsights/store-listing/CHANGELOG.md) zu finden.
