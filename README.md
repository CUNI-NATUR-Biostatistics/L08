# L08 — Mění se vztah mezi dvěma znaky podle skupiny?

**Interakce číselného a skupinového prediktoru i dvou skupinových prediktorů**

Tento repozitář obsahuje osmou lekci kurzu [Biostatistika a plánování ekologických pokusů (MB120P163)](https://cuni-natur-biostatistics.github.io/) vyučovaného na Přírodovědecké fakultě Univerzity Karlovy.

Úplný přehled kurzu, rozvrh, pravidla hodnocení a materiály ostatních lekcí najdete na [veřejném HUBu kurzu](https://cuni-natur-biostatistics.github.io/).

## O této lekci

Liší se vztah délky a zadní šířky krunýře mezi samicemi a samci? Osmá lekce navazuje na aditivní modely z L07 a ukazuje, jak modelovat situaci, ve které vztah jednoho prediktoru k odezvě závisí na druhém prediktoru.

Pracujeme s měřeními krabů druhu *Leptograpsus variegatus* z datasetu `MASS::crabs`. Nejprve porovnáme aditivní model s rovnoběžnými přímkami a model s interakcí, který dovoluje samicím a samcům různé sklony. Předpovědi při společné pozorované délce propojujeme s podmíněnými koeficienty a rezidui.

Druhý příklad používá dva skupinové prediktory: barevnou formu a pohlaví. Interakci zde čteme jako rozdíl dvou rozdílů. Lekce tak připravuje studenty na biologicky zdůvodněné porovnávání modelů v L09 a současně připomíná hranici mezi asociací v pozorovacích datech a příčinným tvrzením.

## Výsledky učení

Po prostudování této lekce dokážete:

- rozpoznat biologickou otázku, ve které vztah jednoho prediktoru závisí na druhém;
- fitovat a zobrazit jednoduchý model s interakcí;
- interpretovat předpovědi a podmíněné koeficienty modelu;
- vysvětlit interakci číselného a skupinového prediktoru;
- vysvětlit interakci dvou skupinových prediktorů jako rozdíl dvou rozdílů;
- omezit biologický závěr na pozorovaný rozsah a způsob získání dat.

## Materiály pro studenty

Následující odkazy vedou vždy na nejnovější schválené vydání L08. Rozpracovaná verze ve větvi `main` může být novější, ale není určena jako závazná studijní verze.

| Materiál | Online verze | PDF |
| --- | --- | --- |
| Skripta | [Číst online](https://cuni-natur-biostatistics.github.io/L08/current/learning/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L08/current/learning/skripta.pdf) |
| Prezentace | [Otevřít slidy](https://cuni-natur-biostatistics.github.io/L08/current/presentation/) | [Stáhnout PDF](https://cuni-natur-biostatistics.github.io/L08/current/presentation/presentation.pdf) |
| Praktické cvičení v R | [Stáhnout skript](https://cuni-natur-biostatistics.github.io/L08/current/code/cviceni.R) | — |
| Data pobřežních krabů | [Stáhnout CSV](https://cuni-natur-biostatistics.github.io/L08/current/data/krabi.csv) | — |

- [HUB kurzu](https://cuni-natur-biostatistics.github.io/) je hlavní vstup ke všem veřejným studijním materiálům.
- [Moodle kurzu](https://dl2.cuni.cz/course/view.php?id=106) slouží zapsaným studentům pro oznámení, testy, zadání, odevzdávání a individuální výsledky.

## Pro vyučující a správce

### Zdrojové a vyrenderované soubory

- `Learning_materials/skripta.qmd` je zdroj skript; výsledky jsou `Learning_materials/skripta.html` a `Learning_materials/skripta.pdf`.
- `Presentation/presentation.qmd` je zdroj slidů; výsledky jsou `Presentation/presentation.html` a `Presentation/presentation.pdf`.
- `Exercises/cviceni.R` je schválený studentský skript k praktickému cvičení.
- `data/krabi.csv` je připravená stabilní kopie `MASS::crabs`; původ, citaci a podmínky dalšího použití popisuje `data/README.md`.
- `R/` obsahuje podporované renderovací a tematické nástroje.
- `theme/` obsahuje synchronizovanou lokální kopii společné vizuální identity kurzu.

### Reprodukovatelné prostředí

Repozitář používá `renv`. Po klonování otevřete `L08.Rproj` a v čerstvé R relaci spusťte:

```r
renv::restore()
renv::status()
```

Kompletní lokální render spustíte podporovaným wrapperem:

```r
source("R/render_all.R")
```

Samostatně lze použít `R/render_skripta.R` nebo `R/render_presentation.R`. Přímé volání `quarto render` obchází synchronizaci sdíleného tématu a nemá se používat pro release render.

### Publikování

`website-release.yml` je explicitní seznam souborů povolených ve veřejném balíčku. Větev `main` vytváří veřejný náhled, zatímco stabilní tag `L08-vMAJOR.MINOR.PATCH-YYYYMMDD` vytváří neměnné vydání a aktualizuje cestu `/L08/current/`. Podrobný publikační postup je v [`WEBSITE_RELEASES.md`](WEBSITE_RELEASES.md).

Před vydáním je nutné zkontrolovat vyrenderované HTML a PDF, úplnost manifestu, provenanci a podmínky použití dat a médií a nepřítomnost neveřejných informací v celém repozitáři.

## Licence

Původní výukový obsah je licencován pod CC BY 4.0 a software pod licencí MIT. Přesné vymezení, doporučená citace a výjimky pro převzatá data, média, fonty, loga a další položky jsou v [`LICENSE.md`](LICENSE.md).
