# Výuková data L08

## Pobřežní krabi

Soubor `krabi.csv` obsahuje původních 200 řádků a osm proměnných z `MASS::crabs` 7.3-66. Jeden řádek představuje jednoho pobřežního kraba rodu *Leptograpsus*; modrou a oranžovou barevnou formu považují autoři studie za samostatné druhy. Učební materiály, prezentace i praktikum z tabulky vybírají barevnou formu, pohlaví, délku a zadní šířku krunýře; praktikum navíc hloubku těla.

Data pocházejí z práce Campbell, N. A. a Mahon, R. J. (1974), *A multivariate study of variation in two species of rock crab of the genus Leptograpsus*, *Australian Journal of Zoology* 22, 417–425. Výukovou kopii reprodukovatelně exportuje `R/prepare_crab_data.R` z verze balíčku připnuté v `renv.lock`; řádky, sloupce a hodnoty nemění.

Balíček MASS distribuuje tuto tabulku pod svou licencí GPL-2 nebo GPL-3. CSV je převzatý datový obsah z tohoto balíčku a nevztahuje se na něj licence původního výukového textu v kořenovém `LICENSE.md`. Při dalším šíření zachovejte tento záznam původu, citaci a podmínky balíčku MASS.

SHA-256 souboru `krabi.csv`: `bbd2a2c36e5cfe41fdde3868d06ab184360548f545cd46d0070f32d1c614c1de`.

## Střemcha pozdní

Soubor `stromy.csv` obsahuje původních 31 řádků a tři proměnné z tabulky `trees` v základním balíčku R `datasets`. Jeden řádek představuje jeden pokácený strom střemchy pozdní (*Prunus serotina*). Sloupec `Girth` je podle dokumentace R ve skutečnosti průměr kmene v palcích měřený ve výšce 4 stopy 6 palců (asi 1,37 m) nad zemí, `Height` je výška stromu ve stopách a `Volume` objem dřeva v krychlových stopách. Učební materiály, prezentace i praktikum hodnoty převádějí ve viditelném kódu na centimetry, metry a krychlové metry.

Data pocházejí z knihy Meyer, H. A. (1953), *Forest Mensuration*, Penns Valley Publishers, a jsou převzata přes Ryan, T. A., Joiner, B. L. a Ryan, B. F. (1976), *The Minitab Student Handbook*, Duxbury Press. Dokumentace R neuvádí místo ani způsob výběru stromů. Výukovou kopii reprodukovatelně exportuje `R/prepare_tree_data.R`; řádky, sloupce a hodnoty nemění.

Balíček `datasets` je součástí R a je distribuován pod licencí GPL-2 nebo GPL-3. CSV je převzatý datový obsah z tohoto balíčku a nevztahuje se na něj licence původního výukového textu v kořenovém `LICENSE.md`. Při dalším šíření zachovejte tento záznam původu a citaci.

SHA-256 souboru `stromy.csv`: `07d02f124e798c97d979079c3a8e61f6879c4486cd6953d272e17d8c733e4286`.
