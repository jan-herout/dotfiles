# Ralph Wiggum coding s pomocí Copilot CLI

## Izolace kontejneru

Základním bezpečnostním opatřením je kompletní izolace stroje. Toho dosáhneme pomocí použití docker nebo podman image, například takto.

Image bude mít přístup pouze ke složce `~/ralph` namapované na `/home/ralph` a jinam ne.

```bash
podman run -it --name ralph \
  -v /home/$(whoami)/ralph:/home/ralph:Z \
  --workdir /home/ralph \
  -e HOME=/home/ralph \
  ubuntu:latest bash
```

- Do kontejneru následně vsoupíme přes `podman start ralph` nebo `podman exec -it ralph bash`, pokud běží.
- Kontejner kdykoliv můžeš strhnout přes `podman stop ralph` a `podman rm ralph`

## Použití kontejneru

Všechny další aktivity provádíme uvnitř kontejneru.

### Instalace potřebného

Instalace npm, nodejs, a copilot. Viz [docs](https://docs.github.com/en/copilot/how-tos/set-up/install-copilot-cli).

```bash
apt update && apt install -y nodejs npm
npm install -g @github/copilot
```

- Během instalace dochází ke knfiguraci časové zóny, počítej s tím že jde o interaktivní proces. Zadáváš Europe (`8`) a Prague (`39`)

Následně, podle návodu z [blogu](https://gordonbeeming.com/blog/2025-10-03/taming-the-ai-my-paranoid-guide-to-running-copilot-cli-in-a-secure-docker-sandbox) provedu instalaci základních toolů.

```bash
apt-get install -y 
  curl \
  gpg \
  git \
  gosu \
  git \
  vim

curl -LsSf https://astral.sh/uv/install.sh | sh
```

## Autentikace copilot CLI

Protože jste v izolovaném kontejneru, proces přihlášení (autentizace) probíhá tak, že kontejner vygeneruje unikátní kód, který vy pak zadáte do prohlížeče na svém hostitelském systému.

Uvnitř kontejneru zadej toto, a dostaneš instrukce jak se autentikovat.

```bash
copilot -i auth
```

V copilotu zadej `/login` a postupuj podle instrukcí. Bude to obnášet login na github a zadání kódu.
 
Přihlašovací údaje se uloží na hostiteli do `$HOME/ralph/.config/github-copilot-cli/hosts.json`, protože `$HOME/ralph` jsem namapoval na HOME nového kontejneru.


**Important** - právě jsi mu dal kompletní práva k celé organizaci na Githubu, kterou spravuješ. Potenciální riziko.

## Nakopírování podkladů pro ralpha

Nakopíruj si následující do nasdílené složky, do konkrétního projektového adresáře.

```bash
cp -r ~/dotfiles/ralph/*.* ~/ralph/<projekt>
```

Unleash the Ralph - tohle spustíš v kontejneru a pomodlíš se. Poslední parametr je počet iterací, které Ralf má k dispozici.

```bash
./ralph.sh --prompt prompts/default.txt --allow-profile dev 20
```