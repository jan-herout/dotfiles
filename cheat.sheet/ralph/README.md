# Ralph: PRD workflow s AI agentem

## K čemu je to dobré?
- **Zrychlení návrhu PRD**: Iterativní tvorba a zpřesňování user stories pomocí agenta.
- **Jednotný formát**: Markdown → validní PRD JSON → iterace → hotový dokument.
- **Řízené oprávnění**: Profilované nástroje agenta (safe/dev/locked) s defaultními deny.

## Co tady najdete
- **Utility**: [md-to-prd](md-to-prd) (Markdown ↔ PRD JSON), [ralph](ralph) (harness pro Copilot CLI).
- **Adresáře**: [ideas/](ideas), [plans/](plans), [prompts/](prompts), [skills/](skills).
- **Příklady promptů**: např. [prompts/default.txt](prompts/default.txt).
- **Skills**: např. `skill-prd-prompted`, `skill-prd-interactive`, `skill-python-development`, `skill-golang-development`.

## Jak to použít (use-case)
1) **Připrav Markdown user stories** do [ideas/](ideas). Každá story jako H1:

```
# SEARCH-001: Rychlé vyhledávání

## Description
Uživatel chce najít záznamy do 200 ms při 10k položkách.

## Acceptance criteria
- Odezva ≤ 200 ms pro dataset 10k
- Precision@10 ≥ 85%
```

2) **Konverze do PRD JSON** pomocí [md-to-prd](md-to-prd):

```bash
# Jednorázově z jednoho souboru
./md-to-prd convert --input ideas/search.md --output plans/prd.json

# Opakovaně přidávejte další soubory (merge do stejného JSON)
for f in ideas/*.md; do ./md-to-prd convert --input "$f" --output plans/prd.json; done

# Export zpět do Markdownu (přepis povolte --yes)
./md-to-prd export --input plans/prd.json --output ideas/_export.md --yes
```

3) **Iterace PRD s agentem** přes [ralph](ralph):

```bash
# Základní běh (default profil dev)
./ralph run \
  --prompt prompts/default.txt \
  --prd plans/prd.json \
  --skill prd-prompted \
  3

# Opatrný profil (safe): pouze write + povolené shell(git:*)/shell(pnpm:*)
./ralph run \
  --prompt prompts/default.txt \
  --prd plans/prd.json \
  --skill prd-prompted \
  --allow-profile safe \
  3

# Zámek (locked): jen zápis bez shell nástrojů
./ralph run --prompt prompts/default.txt --prd plans/prd.json --skill prd-prompted --allow-profile locked 2

# Seznam skills
./ralph skills --skills-dir skills

# Nedokončené stories z PRD
./ralph stories --prd plans/prd.json
```

## Co Ralph dělá s PRD
- **Skládá kontext**: načte `skills/<name>/skill.md` (+ volitelně PRD JSON jako text) a [progress.txt](progress.txt).
- **Vytvoří prompt**: spojí kontext a vybraný prompt (např. [prompts/default.txt](prompts/default.txt)).
- **Spustí iterace**: volá Copilot CLI s řízenými oprávněními; končí po značce `<promise>COMPLETE</promise>` nebo po N iteracích.
- **Profily**: `dev` (široké, ale stále deny `shell(rm)`, `shell(git push)`), `safe`, `locked`.

## Bezpečnost: proč kontejner
- **Rizika mimo izolaci**: agent může spouštět shell nástroje, zapisovat soubory, pracovat s Gitem; omyl může poškodit repo či systém.
- **Mitigace**: harness vždy **zakazuje** `shell(rm)` a `shell(git push)`; profily omezují nástroje.
- **Doporučení**: spouštějte v kontejneru (read-only mounty, omezená síť, jen nutné bind-mounty do projektu). Minimalizujte práva, auditujte výstupy.

## Teoretické základy: "Ralph Wiggum" programování
- **Iterativní elaborace**: krátké cykly, přísná struktura PRD (měřitelné KPI, jasná AC), průběžná synchronizace s Markdownem.
- **Skill-first kontext**: explicitní schopnosti (skills) formují chování agenta a kvalitu výstupů.
- **Bez halucinací**: důraz na Discovery (interview), `TBD` místo domněnek, striktní schéma.
- **Human-in-the-loop**: rychlé návraty k uživateli, kontrola rizik, postupné zpřesnění.

## Rychlé tipy
- **Markdown → JSON merge**: přidávejte stories postupně, nástroj zachová `priority/passes/notes` z existujícího PRD.
- **Model**: `MODEL` env lze přepsat `--model` (viz [ralph](ralph)).
- **Transkript**: `--create-transcript` uloží průběh (vyžaduje systémový `script`).
