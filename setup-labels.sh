#!/bin/bash
# Setup script for GitHub issue labels
# Usage: Run this after creating the repo
# Prerequisite: GitHub CLI (gh) installed and authenticated
#   Install: https://cli.github.com/
#   Auth: gh auth login

REPO="Philix95/ShopInsights-Support"

echo "Setting up labels for $REPO..."

# Remove default labels that we don't need
gh label delete "documentation" --repo $REPO --yes 2>/dev/null
gh label delete "duplicate" --repo $REPO --yes 2>/dev/null
gh label delete "good first issue" --repo $REPO --yes 2>/dev/null
gh label delete "help wanted" --repo $REPO --yes 2>/dev/null
gh label delete "invalid" --repo $REPO --yes 2>/dev/null
gh label delete "wontfix" --repo $REPO --yes 2>/dev/null

# Category labels (set by issue templates)
gh label create "bug" --description "Fehlermeldung" --color "d73a4a" --repo $REPO --force
gh label create "enhancement" --description "Feature Request" --color "a2eeef" --repo $REPO --force
gh label create "question" --description "Frage zur Nutzung" --color "d876e3" --repo $REPO --force
gh label create "triage" --description "Noch nicht kategorisiert" --color "fbca04" --repo $REPO --force

# Source labels (set by automation)
gh label create "source:github" --description "Direkt über GitHub erstellt" --color "0075ca" --repo $REPO --force
gh label create "source:email" --description "Per E-Mail eingegangen" --color "0075ca" --repo $REPO --force
gh label create "source:store" --description "Aus Shopware Store übertragen" --color "0075ca" --repo $REPO --force

# Priority labels (set by automation or manually)
gh label create "priority:low" --description "Nice-to-have" --color "c5def5" --repo $REPO --force
gh label create "priority:medium" --description "Wichtig" --color "f9d0c4" --repo $REPO --force
gh label create "priority:high" --description "Kritisch / Blocker" --color "e11d48" --repo $REPO --force

# Status labels (set by automation or manually)
gh label create "status:known" --description "Bekanntes Problem" --color "bfdadc" --repo $REPO --force
gh label create "status:planned" --description "In Roadmap aufgenommen" --color "bfdadc" --repo $REPO --force
gh label create "status:in-progress" --description "In Bearbeitung" --color "bfdadc" --repo $REPO --force
gh label create "status:awaiting-response" --description "Warten auf Rückmeldung" --color "fef2c0" --repo $REPO --force
gh label create "status:draft-response" --description "Antwort-Entwurf vorhanden" --color "c2e0c6" --repo $REPO --force

# Area labels (matching template dropdowns)
gh label create "area:dashboard" --description "Dashboard / Übersicht" --color "ededed" --repo $REPO --force
gh label create "area:report-builder" --description "Report Builder" --color "ededed" --repo $REPO --force
gh label create "area:product-performance" --description "Produkt-Performance" --color "ededed" --repo $REPO --force
gh label create "area:abc-analysis" --description "ABC-Analyse" --color "ededed" --repo $REPO --force
gh label create "area:inventory" --description "Bestandsoptimierung" --color "ededed" --repo $REPO --force
gh label create "area:installation" --description "Installation / Setup" --color "ededed" --repo $REPO --force

echo "Done! Labels configured for $REPO"
