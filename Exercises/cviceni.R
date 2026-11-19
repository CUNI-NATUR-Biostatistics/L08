#----------------------------------------------------------#
#
#       L08 — Kdy vztah dvou znaků závisí na třetím?
#                  Interakce prediktorů
#                 Praktické cvičení v R
#             Studenti biologie a ekologie
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#

#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít soubory -----
#--------------------------------------------------#
# Ke cvičení potřebujete tři soubory: tento skript cviceni.R a datové
# soubory krabi.csv a stromy.csv. Všechny najdete na webu kurzu:
# https://cuni-natur-biostatistics.github.io/L08/current/code/cviceni.R
# https://cuni-natur-biostatistics.github.io/L08/current/data/krabi.csv
# https://cuni-natur-biostatistics.github.io/L08/current/data/stromy.csv
#
# Jak soubory uložit:
# 1. Vytvořte složku L08_praktikum a v ní podsložku data.
# 2. Soubor cviceni.R uložte do složky L08_praktikum.
# 3. Soubory krabi.csv a stromy.csv uložte do podsložky data. Jejich
#    jména neměňte.
# Pokud prohlížeč uloží soubory rovnou do složky Stažené soubory,
# přesuňte je odtud na uvedená místa. Pokud se soubor v prohlížeči zobrazí
# jako text, uložte ho klávesami Ctrl + S.
#
# Jak otevřít projekt v RStudiu:
# RStudio Project je obyčejná složka, ve které pracujete. RStudio do ní
# přidá soubor .Rproj, pomocí kterého složku příště snadno znovu otevřete.
# Skript, data i výstupy zůstávají samostatnými soubory uvnitř složky.
# 1. V RStudiu zvolte File > New Project > Existing Directory.
# 2. Vyberte složku L08_praktikum a potvrďte Create Project.
# 3. V panelu Files otevřete cviceni.R.
# 4. Přes File > Save As si uložte vlastní kopii, například
#    cviceni_L08_prijmeni.R.
#
# Výsledná složka vypadá takto:
# L08_praktikum/
# ├── L08_praktikum.Rproj
# ├── cviceni.R
# └── data/
#     ├── krabi.csv
#     └── stromy.csv

#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#
# Cílem cvičení je statistika: odhadnout model, přečíst jeho koeficienty
# a predikce a vyložit je biologicky. Načtení a úpravu dat i většinu
# grafů proto dostanete připravené.
#
# Hlavní úlohy U01–U09 řešte v uvedeném pořadí, protože na sebe navazují.
# Tabulky data_krabi, data_modri, data_samice, data_samci a data_stromy
# vytvoří připravený kód v části Připravená data. Další připravený kód
# před úlohami vytvoří tabulky data_30 (U05), data_ctyri (U08)
# a data_porovnani_stromy (U09) a graf před úlohou U07 přidá do data_krabi
# sloupec skupina a vytvoří vec_prumery_skupin. Pozdější úlohy používají
# také modely, které sami odhadnete: mod_aditivni z úlohy U03,
# mod_interakce z úlohy U04, mod_formy z úlohy U07 a mod_stromy z úlohy
# U09. Úlohy navíc používají i objekt mat_predikce_ctyri a sloupec
# residuum_mm z úlohy U08.
# Úlohy navíc N01–N10 jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
#
# Připravený kód:
# - Připravený kód bez znaku # na začátku řádku stačí označit a spustit.
#   Psát ho nemusíte a podrobně číst jen tam, kde to text výslovně žádá.
# - Několik připravených bloků je zakomentovaných, protože potřebují
#   model, který teprve odhadnete. Po odhadu modelu takový blok zkopírujte
#   pod "Vaše řešení" a z každého řádku odstraňte úvodní #. Nejrychleji to
#   uděláte tak, že vložené řádky označíte a zvolíte Code >
#   Comment/Uncomment Lines (Ctrl + Shift + C).
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Nápovědy čtěte postupně. Druhá nápověda je konkrétnější než první.
# - Kopii skriptu průběžně ukládejte pomocí Ctrl + S.
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložené soubory zůstanou.
# Potom znovu spusťte celou Přípravu včetně připravených dat, nezakomentované
# připravené grafy a tabulky a své hotové hlavní úlohy shora dolů.
# Zkopírované a odkomentované bloky spusťte také.

#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#
# Po dokončení cvičení budete schopni:
# - rozpoznat biologickou otázku, ve které vztah jednoho prediktoru
#   k odezvě závisí na hodnotě nebo úrovni druhého prediktoru;
# - fitovat model s interakcí a zobrazit jeho predikce pro kombinace
#   numerických i kategoriálních prediktorů;
# - vyložit koeficienty modelu s interakcí jako podmíněné a porovnávat
#   skupiny nebo různé hodnoty prediktoru pomocí predikcí při zvolené
#   hodnotě druhého prediktoru;
# - vysvětlit interakci dvou kategoriálních prediktorů jako rozdíl dvou
#   rozdílů;
# - omezit závěr na pozorovaný rozsah dat a na souvislost v pozorovacích
#   datech.
#
# Navazujeme na předchozí lekce: str(), table(), is.na(), range(), lm(),
# coef(), summary(), confint(), predict(), fitted(), resid() neboli
# residuals(), plot(), hist(), boxplot(), qqnorm(), qqline(), abline(),
# Cookovu vzdálenost (L07-N05) a aditivní model s rovnoběžnými přímkami.
# Kontrolu residuí znáte z minulých lekcí: graf proti odhadnutým hodnotám,
# histogram a Q–Q graf. V této lekci ji uděláme u hlavního modelu v úloze
# U06. Nové funkce vysvětlujeme vždy u úlohy, kde je
# poprvé potřebujete.

#--------------------------------------------------#
## Technická kontrola souboru -----
#--------------------------------------------------#
# Následující kód zkontroluje, zda jsou oba datové soubory na správném
# místě. Označte ho celý a spusťte Ctrl + Enter. Cesty k souborům začínají
# ve složce otevřeného projektu. Pokud soubor chybí, R se zastaví a vypíše,
# co máte zkontrolovat.
soubor_krabi <- "data/krabi.csv"
soubor_stromy <- "data/stromy.csv"
if (
  !file.exists(soubor_krabi)) {
  stop(
    paste0(
      "Soubor data/krabi.csv nebyl nalezen. ",
      "Otevřete projekt L08_praktikum a zkontrolujte jméno ",
      "a umístění CSV v podsložce data."
    ),
    call. = FALSE
  )
}
if (
  !file.exists(soubor_stromy)) {
  stop(
    paste0(
      "Soubor data/stromy.csv nebyl nalezen. ",
      "Otevřete projekt L08_praktikum a zkontrolujte jméno ",
      "a umístění CSV v podsložce data."
    ),
    call. = FALSE
  )
}
# Data pocházejí z práce Campbell a Mahon (1974). Autoři změřili po 50
# samicích a 50 samcích dvou barevných forem pobřežního kraba rodu
# Leptograpsus, modré a oranžové, které považují za samostatné druhy.
# Jeden řádek tabulky představuje jednoho změřeného kraba. Použijeme:
# sp  ... barevná forma: B = modrá, O = oranžová;
# sex ... pohlaví: F = samice, M = samec;
# CL  ... délka krunýře v mm;
# RW  ... šířka zadní části krunýře v mm;
# BD  ... hloubka těla v mm.
# Tabulku šíří balíček MASS pod licencí GPL-2 nebo GPL-3.
#
# Soubor stromy.csv obsahuje měření 31 pokácených stromů střemchy pozdní
# (Prunus serotina), severoamerického stromu, který se v českých lesích
# šíří jako invazní druh. Jeden řádek představuje jeden strom. Hodnoty
# jsou v amerických jednotkách:
# Girth  ... průměr kmene v palcích, měřený asi 1,37 m nad zemí;
# Height ... výška stromu ve stopách;
# Volume ... objem dřeva v krychlových stopách.
# Data pocházejí z knihy Meyer (1953), Forest Mensuration. Tabulku šíří
# základní balíček R datasets pod licencí GPL-2 nebo GPL-3.

#--------------------------------------------------#
## Připravená data -----
#--------------------------------------------------#
# Následující kód připraví data pro celé cvičení. Označte ho celý
# a spusťte Ctrl + Enter. Kód:
# - načte oba soubory;
# - dá sloupcům krabů česká jména a kódy převede na faktory s čitelnými
#   úrovněmi; první úroveň (modrá forma, samice) je referenční skupinou
#   modelů;
# - přidá ke každému krabovi barvu a symbol bodu podle pohlaví: samice
#   zelený kruh, samec růžovofialový trojúhelník (modrou a oranžovou
#   necháváme barevným formám);
# - vybere kraby modré formy a zvlášť samice a samce modré formy;
# - převede stromy na centimetry, metry a krychlové metry.
data_krabi_raw <-
  read.csv(file = soubor_krabi)

data_krabi <-
  data.frame(
    forma = factor(
      x = data_krabi_raw$sp,
      levels = c("B", "O"),
      labels = c("modrá", "oranžová")
    ),
    pohlavi = factor(
      x = data_krabi_raw$sex,
      levels = c("F", "M"),
      labels = c("samice", "samec")
    ),
    delka_krunyre_mm = data_krabi_raw$CL,
    zadni_sirka_mm = data_krabi_raw$RW,
    hloubka_tela_mm = data_krabi_raw$BD
  )

vec_barvy_pohlavi <-
  c(
    "samice" = "#009E73",
    "samec" = "#CC79A7"
  )

vec_symboly_pohlavi <-
  c(
    "samice" = 16,
    "samec" = 17
  )

data_krabi$barva <-
  unname(obj = vec_barvy_pohlavi[as.character(x = data_krabi$pohlavi)])
data_krabi$symbol <-
  unname(obj = vec_symboly_pohlavi[as.character(x = data_krabi$pohlavi)])

data_modri <-
  data_krabi[data_krabi$forma == "modrá", ]
data_samice <-
  data_modri[data_modri$pohlavi == "samice", ]
data_samci <-
  data_modri[data_modri$pohlavi == "samec", ]

data_stromy_raw <-
  read.csv(file = soubor_stromy)

data_stromy <-
  data.frame(
    prumer_cm = data_stromy_raw$Girth * 2.54, # palce na cm
    vyska_m = data_stromy_raw$Height * 0.3048, # stopy na m
    objem_m3 = data_stromy_raw$Volume * 0.0283168 # krychlové stopy na m³
  )

#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Od celého souboru k biologické otázce -----
#--------------------------------------------------#
# Zadní část krunýře leží nad zadečkem, pod kterým samice nosí vajíčka.
# Campbell a Mahon zjistili, že se samice a samci liší právě zadní šířkou
# krunýře vzhledem k jeho délce. Pokud samice s rostoucí velikostí
# potřebují pro snůšku relativně více místa, mohl by se rozdíl mezi
# pohlavími s velikostí krabů měnit. Tuto biologickou otázku budeme
# zkoumat.

#----------------------------------------#
### Úloha | L08-U01 -----
#----------------------------------------#

# Zadání:
# Pracujte s připravenou tabulkou data_krabi.
# 1. Pomocí str() zjistěte počet krabů a typ sloupců forma, pohlavi
#    a delka_krunyre_mm.
# 2. Spočítejte chybějící hodnoty v celé tabulce a pomocí table() počty
#    krabů ve čtyřech kombinacích formy a pohlaví.
# 3. Pro otázku z úvodu určete odezvu, numerický prediktor
#    a kategoriální prediktor.

# Vaše řešení:


# Odezva:
#
# Numerický prediktor:
#
# Kategoriální prediktor:
#

# Nápověda 1:
# Odezva je znak, jehož hodnoty chceme vysvětlit; prediktory jsou znaky,
# podle kterých se odezva může měnit. Počty krabů ve skupinách prozradí,
# jak autoři kraby vybírali.
#
# Nápověda 2:
# Chybějící hodnoty spočítá sum() použitá na is.na(data_krabi). Do
# table() zadejte dva sloupce: data_krabi$forma a data_krabi$pohlavi.
#
# Očekávaný výsledek:
# data_krabi má 200 řádků a 7 sloupců; forma a pohlavi jsou faktory se
# dvěma úrovněmi, delka_krunyre_mm je číslo. Chybějící hodnoty: 0. Každá
# kombinace formy a pohlaví obsahuje 50 krabů. Odezvou je zadní šířka
# krunýře, numerickým prediktorem délka krunýře a kategoriálním
# prediktorem pohlaví.
#
# Interpretace:
# Co v tabulce představuje jeden řádek? Mohl být některý krab změřen
# dvakrát, a co by to znamenalo pro nezávislost pozorování? Autoři
# vybrali do každé skupiny právě 50 krabů: popisují pak průměrné velikosti
# tento soubor, nebo všechny kraby v přírodě?

#--------------------------------------------------#
## Numerický a kategoriální prediktor -----
#--------------------------------------------------#
# Nejprve budeme zkoumat pouze kraby modré formy (data_modri). Biologická
# otázka zní: liší se vztah délky a zadní šířky krunýře mezi samicemi
# a samci?
#
# Připravený graf ukáže kraby modré formy. Barva a symbol bodu rozlišují
# pohlaví, takže graf zůstane čitelný i bez barev. Označte kód a spusťte
# ho.
plot(
  x = data_modri$delka_krunyre_mm,
  y = data_modri$zadni_sirka_mm,
  col = data_modri$barva,
  pch = data_modri$symbol,
  xlab = "Délka krunýře (mm)",
  ylab = "Zadní šířka krunýře (mm)"
)

legend(
  x = "topleft",
  legend = names(x = vec_barvy_pohlavi),
  col = vec_barvy_pohlavi,
  pch = vec_symboly_pohlavi
)

#----------------------------------------#
### Úloha | L08-U02 -----
#----------------------------------------#

# Zadání:
# Pracujte s připraveným grafem krabů modré formy.
# 1. Odečtěte z grafu přibližnou zadní šířku samic a samců s délkou
#    krunýře 20 mm a 40 mm.
# 2. Pro obě délky spočítejte rozdíl samec − samice.
# 3. Rozhodněte, zda graf naznačuje stejný sklon u obou pohlaví.

# Vaše řešení:


# Nápověda 1:
# Svislá vzdálenost mezi body samic a samců při stejné délce je rozdíl
# mezi pohlavími. Pokud se s délkou mění, přímky obou pohlaví nebudou
# rovnoběžné.
#
# Nápověda 2:
# Najděte na ose x délky 20 mm a 40 mm a podívejte se, kde leží zelené
# a růžovofialové body nad nimi. Rozdíl spočítejte v R jako šířku samce
# minus šířku samice.
#
# Očekávaný výsledek:
# Při 20 mm leží body obou pohlaví podobně vysoko, asi 8–9 mm; rozdíl je
# menší než 1 mm. Při 40 mm mají samice asi 16–17 mm a samci asi
# 13–15 mm, rozdíl samec − samice je tedy zhruba −2 až −3 mm. Body samic
# stoupají strměji.
#
# Interpretace:
# Co by znamenalo, kdyby byl rozdíl při obou délkách stejný? Proč odhad
# z grafu ještě nestačí k závěru?

#--------------------------------------------------#
## Co předpokládá model bez interakce? -----
#--------------------------------------------------#
# Aditivní model dovolí různou výšku přímek, ale vynutí jim stejný sklon.
# Rozdíl mezi samcem a samicí je proto při každé délce stejný.
#
# Připravený graf přímek níže je zakomentovaný, protože potřebuje tři
# čísla, která spočítáte v úloze. Po kroku 2 jej zkopírujte pod "Vaše
# řešení", odkomentujte a spusťte.
#
# plot(
#   x = data_modri$delka_krunyre_mm,
#   y = data_modri$zadni_sirka_mm,
#   col = data_modri$barva,
#   pch = data_modri$symbol,
#   xlab = "Délka krunýře (mm)",
#   ylab = "Zadní šířka krunýře (mm)"
# )
#
# abline(
#   a = intercept_samice,
#   b = sklon_spolecny,
#   col = vec_barvy_pohlavi[["samice"]],
#   lwd = 2
# )
#
# abline(
#   a = intercept_samci,
#   b = sklon_spolecny,
#   col = vec_barvy_pohlavi[["samec"]],
#   lwd = 2
# )

#----------------------------------------#
### Úloha | L08-U03 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_modri.
# 1. Odhadněte mod_aditivni se zadní šířkou jako odezvou a délkou krunýře
#    a pohlavím jako prediktory bez interakce. Zobrazte jeho summary().
# 2. Z koeficientů spočítejte a uložte intercept_samice, intercept_samci
#    a sklon_spolecny.
# 3. Zkopírujte, odkomentujte a spusťte připravený graf přímek.

# Vaše řešení:


# Nápověda 1:
# Referenční skupinou jsou samice: jejich přímce patří intercept
# a sklon. Samčí přímka má stejný sklon a jen posunutý intercept.
#
# Nápověda 2:
# Prediktory spojte ve vzorci pomocí +. Prvky coef(mod_aditivni)
# vybírejte jménem, například coef(mod_aditivni)[["(Intercept)"]];
# intercept samců je součet "(Intercept)" a "pohlavisamec", společný
# sklon je koeficient "delka_krunyre_mm".
#
# Očekávaný výsledek:
# Intercept samic je přibližně 2,8197 mm, intercept samců 1,1025 mm
# a společný sklon 0,3316 mm/mm. Odhadnutý rozdíl samec − samice je
# při každé délce −1,7172 mm a obě přímky jsou rovnoběžné.
#
# Interpretace:
# Jaké biologické omezení vyjadřují rovnoběžné přímky? Sedí přímky
# k bodům samic a samců stejně dobře u krátkých i dlouhých krabů?

#--------------------------------------------------#
## Interakce dovolí pohlavím různé sklony -----
#--------------------------------------------------#
# Přidáme člen delka_krunyre_mm:pohlavi. Dvojtečka označuje interakční
# člen, neznamená dělení. Hvězdička ve vzorci automaticky zapíše oba
# hlavní efekty i jejich interakci:
#
# delka_krunyre_mm * pohlavi
#
# je totéž jako
#
# delka_krunyre_mm + pohlavi + delka_krunyre_mm:pohlavi
#
# Protože referenční skupinou pohlaví je samice, první dva koeficienty
# popisují samice. Další dva říkají, jak se u samců změní intercept
# a sklon. Intercept i rozdíl pohlaví se vztahují k délce 0 mm, která
# leží mimo pozorované kraby; biologicky čitelnější budou predikce
# při skutečně pozorované délce.

#----------------------------------------#
### Úloha | L08-U04 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_modri.
# 1. Odhadněte mod_interakce se stejnou odezvou a stejnými prediktory jako
#    v U03, spojenými pomocí *.
# 2. Zavolejte summary(mod_interakce) a vlastními slovy interpretujte
#    všechny čtyři odhady ve sloupci Estimate: (Intercept),
#    delka_krunyre_mm, pohlavisamec a delka_krunyre_mm:pohlavisamec.
# 3. Z koeficientů spočítejte sklon samců a uložte jej jako sklon_samci.
# 4. U interakčního koeficientu uveďte jeho Std. Error a pomocí
#    confint(mod_interakce) jeho 95% interval spolehlivosti.

# Vaše řešení:


# Interpretace koeficientů:
# (Intercept):
#
# delka_krunyre_mm:
#
# pohlavisamec:
#
# delka_krunyre_mm:pohlavisamec:
#
# Nejistota interakčního koeficientu (Std. Error, 95% interval):
#

# Nápověda 1:
# Každý hlavní koeficient čtěte při referenční skupině nebo nulové
# hodnotě druhého prediktoru. Interakční koeficient je rozdíl sklonů.
#
# Nápověda 2:
# Sklon samců je součet koeficientů delka_krunyre_mm
# a delka_krunyre_mm:pohlavisamec; vybírejte je z coef(mod_interakce)
# podle jmen. Std. Error najdete ve druhém sloupci tabulky koeficientů;
# confint() vrací jeden řádek na koeficient.
#
# Očekávaný výsledek:
# Koeficienty jsou přibližně 0,7077; 0,4067; 1,9731 a −0,1245. Jejich
# význam je postupně: odhad pro samici při 0 mm (mimo pozorovaný rozsah),
# sklon samic, rozdíl samec − samice při 0 mm a rozdíl sklon samec −
# sklon samice. Sklon samců je přibližně 0,2823 mm/mm. Std. Error
# interakčního koeficientu je asi 0,0132 mm/mm a jeho 95% interval
# spolehlivosti je přibližně −0,151 až −0,098 mm/mm, tedy nezahrnuje
# nulu.
#
# Interpretace:
# Proč koeficient pohlavisamec není rozdílem mezi samci a samicemi při
# každé délce? Při které délce tento koeficient platí přímo? Co říká
# interval, který nezahrnuje nulu, o rozdílu sklonů?

#--------------------------------------------------#
## Predikce při společné pozorované délce -----
#--------------------------------------------------#
# Pro biologicky smysluplné porovnání zvolíme délku 30 mm. Zda leží
# v pozorovaném rozsahu obou pohlaví, ověříte v úloze.
#
# predict() potřebuje tabulku nových dat se stejnými názvy sloupců
# a stejnými úrovněmi faktoru, jaké měla data modelu. Připravená tabulka
# data_30 má dva řádky: samici a samce o délce 30 mm. Spusťte ji.
data_30 <-
  data.frame(
    delka_krunyre_mm = c(30, 30),
    pohlavi = factor(
      x = c("samice", "samec"),
      levels = levels(x = data_modri$pohlavi)
    )
  )
data_30

# S argumentem interval = "confidence" vrátí predict() matici se třemi
# sloupci: fit (odhad průměrné zadní šířky), lwr a upr (hranice jeho 95%
# intervalu spolehlivosti). Sloupec vyberete například
# matice[, "fit"].

#----------------------------------------#
### Úloha | L08-U05 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_interakce, data_samice, data_samci a data_30.
# 1. Pomocí range() zjistěte rozsah delka_krunyre_mm u samic a u samců
#    modré formy a rozhodněte, zda 30 mm leží v obou rozsazích.
# 2. Pomocí predict() s interval = "confidence" odhadněte pro data_30
#    zadní šířku samice a samce a 95% intervaly spolehlivosti.
# 3. Rozdíl samec − samice spočítejte dvěma cestami:
#    a) odečtením dvou predikcí;
#    b) z koeficientů jako pohlavisamec +
#       30 * delka_krunyre_mm:pohlavisamec.
# 4. Rozhodněte, zda se intervaly spolehlivosti průměrů samic a samců
#    při 30 mm překrývají.

# Vaše řešení:


# Nápověda 1:
# Predikce pro délku, kterou u jednoho z pohlaví nemáme, by stála na
# extrapolaci přímky mimo data. Obě cesty výpočtu rozdílu musí dát stejné
# číslo, protože jde o tentýž model.
#
# Nápověda 2:
# predict() potřebuje object, newdata a interval. Ve výsledné matici
# použijte sloupec fit; první řádek patří samici, druhý samci. Pro druhou
# cestu vyberte dva pojmenované prvky z coef(mod_interakce).
#
# Očekávaný výsledek:
# Rozsah samic je 14,7 až 40,9 mm a samců 16,1 až 47,1 mm.
# Odhady zadní šířky při 30 mm jsou přibližně 12,9100 mm pro samici
# a 11,1495 mm pro samce. Obě cesty dávají rozdíl samec − samice
# přibližně −1,7605 mm. Intervaly pro odhadované průměry jsou přibližně
# 12,7849 až 13,0351 mm a 11,0259 až 11,2731 mm; nepřekrývají se.
#
# Interpretace:
# Napište jednu větu se směrem rozdílu, jeho velikostí, společnou délkou
# 30 mm a správnou jednotkou. Proč je tato věta čitelnější než samotný
# koeficient pohlavisamec?

#--------------------------------------------------#
## Celé přímky a residua -----
#--------------------------------------------------#
# Připravený blok níže nakreslí obě přímky modelu s interakcí s 95% pásy
# spolehlivosti; každá přímka vede jen přes délky pozorované u daného
# pohlaví. Pás ukazuje nejistotu odhadnutého průměru zadní šířky, ne
# rozptyl jednotlivých krabů kolem přímky. Barvy a symboly jsou stejné
# jako v grafu před úlohou U02. Blok potřebuje mod_interakce, proto je
# zakomentovaný.
#
# data_cara_samice <-
#   data.frame(
#     delka_krunyre_mm = seq(
#       from = min(data_samice$delka_krunyre_mm),
#       to = max(data_samice$delka_krunyre_mm),
#       length.out = 100
#     ),
#     pohlavi = factor(
#       x = "samice",
#       levels = levels(x = data_modri$pohlavi)
#     )
#   )
# data_cara_samice[, c("odhad_mm", "dolni_mm", "horni_mm")] <-
#   predict(
#     object = mod_interakce,
#     newdata = data_cara_samice,
#     interval = "confidence"
#   )
#
# data_cara_samec <-
#   data.frame(
#     delka_krunyre_mm = seq(
#       from = min(data_samci$delka_krunyre_mm),
#       to = max(data_samci$delka_krunyre_mm),
#       length.out = 100
#     ),
#     pohlavi = factor(
#       x = "samec",
#       levels = levels(x = data_modri$pohlavi)
#     )
#   )
# data_cara_samec[, c("odhad_mm", "dolni_mm", "horni_mm")] <-
#   predict(
#     object = mod_interakce,
#     newdata = data_cara_samec,
#     interval = "confidence"
#   )
#
# plot(
#   x = data_modri$delka_krunyre_mm,
#   y = data_modri$zadni_sirka_mm,
#   col = data_modri$barva,
#   pch = data_modri$symbol,
#   xlab = "Délka krunýře (mm)",
#   ylab = "Zadní šířka krunýře (mm)",
#   ylim = c(6, 18)
# )
#
# matlines(
#   x = data_cara_samice$delka_krunyre_mm,
#   y = data_cara_samice[, c("odhad_mm", "dolni_mm", "horni_mm")],
#   col = vec_barvy_pohlavi[["samice"]],
#   lty = c(1, 2, 2),
#   lwd = c(2, 1, 1)
# )
#
# matlines(
#   x = data_cara_samec$delka_krunyre_mm,
#   y = data_cara_samec[, c("odhad_mm", "dolni_mm", "horni_mm")],
#   col = vec_barvy_pohlavi[["samec"]],
#   lty = c(1, 2, 2),
#   lwd = c(2, 1, 1)
# )
#
# legend(
#   x = "topleft",
#   legend = names(x = vec_barvy_pohlavi),
#   col = vec_barvy_pohlavi,
#   pch = vec_symboly_pohlavi
# )

#----------------------------------------#
### Úloha | L08-U06 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_interakce.
# 1. Zkopírujte, odkomentujte a spusťte připravený blok s přímkami.
# 2. Nakreslete residua mod_interakce proti odhadnutým hodnotám
#    a přidejte vodorovnou přerušovanou čáru v nule.
# 3. Nakreslete histogram residuí mod_interakce a Q–Q graf residuí
#    s referenční přímkou, stejně jako v minulých lekcích.

# Vaše řešení:


# Nápověda 1:
# Residuum je vzdálenost kraba od jeho přímky. U residuí hledáme oblouk
# nebo rozevírání bodů a u histogramu a Q–Q grafu odchylky od
# symetrického rozdělení.
#
# Nápověda 2:
# Odhadnuté hodnoty vrátí fitted(), residua residuals(), obě
# s object = mod_interakce; nakreslete je pomocí plot() s argumenty x
# a y. Nulovou čáru přidá abline(h = 0, lty = 2). Histogram nakreslí
# hist(), Q–Q graf qqnorm() a přímku do něj qqline().
#
# Očekávaný výsledek:
# Graf predikcí má dvě rostoucí, nerovnoběžné přímky s úzkými pásy
# intervalů; pás je nejužší uprostřed dat. Samičí přímka roste rychleji.
# V grafu residuí jsou body kolem nuly bez oblouku a s podobným rozptylem;
# jednotliví krabi se přesto od přímek odchylují. Residua leží zhruba
# od −0,92 do +1,23 mm, téměř všechna (98 ze 100) v rozmezí ±1 mm.
# Histogram je soustředěný kolem nuly a mírně sešikmený doprava. Body
# Q–Q grafu leží blízko přímky, jen na obou koncích se od ní mírně
# odklánějí.
#
# Interpretace:
# Co graf residuí, histogram a Q–Q graf říkají o popisu těchto dat? Napište
# také jednu větu vysvětlující, proč tato pozorovací data nedokazují, že
# rozdíl v zadní šířce způsobuje pohlaví nebo nošení vajíček.

#--------------------------------------------------#
## Dva kategoriální prediktory -----
#--------------------------------------------------#
# Nyní použijeme všech 200 krabů. U mnoha živočichů se samice a samci
# liší velikostí a tento rozdíl nemusí být stejný u příbuzných druhů nebo
# forem. Odezvou bude délka krunýře a dvěma prediktory barevná forma
# a pohlaví. Ptáme se, zda se rozdíl samec − samice mění mezi modrou
# a oranžovou formou.
#
# Pozor: autoři vybrali do každé ze čtyř skupin právě 50 krabů. Průměrné
# délky proto závisejí i na tom, které kraby sesbírali. Výsledek popisuje
# tento soubor, ne velikost krabů v přírodě.
#
# Připravený graf níže zobrazí každého kraba a čtyři skupinové průměry
# (velké kosočtverce); úsečky spojují průměr samic a samců v každé formě.
# Spusťte ho celý. Kód navíc přidá do data_krabi sloupec skupina se
# čtyřmi kombinacemi formy a pohlaví a uloží čtyři průměry do
# vec_prumery_skupin v pořadí modrá samice, modrý samec, oranžová samice,
# oranžový samec.
data_krabi$skupina <-
  interaction(
    data_krabi$forma,
    data_krabi$pohlavi,
    sep = " - ",
    lex.order = TRUE
  )

set.seed(900723)
vec_pozice <-
  jitter(
    x = as.numeric(x = data_krabi$skupina),
    amount = 0.12
  )

plot(
  x = vec_pozice,
  y = data_krabi$delka_krunyre_mm,
  xaxt = "n",
  col = data_krabi$barva,
  pch = data_krabi$symbol,
  xlab = "Barevná forma a pohlaví",
  ylab = "Délka krunýře (mm)"
)

axis(
  side = 1,
  at = 1:4,
  labels = c(
    "modrá\nsamice",
    "modrá\nsamec",
    "oranžová\nsamice",
    "oranžová\nsamec"
  )
)

vec_prumery_skupin <-
  tapply(
    X = data_krabi$delka_krunyre_mm,
    INDEX = data_krabi$skupina,
    FUN = mean
  )

points(
  x = 1:4,
  y = vec_prumery_skupin,
  pch = 23,
  cex = 2.5,
  bg = "grey20"
)

segments(
  x0 = c(1, 3),
  y0 = vec_prumery_skupin[c(1, 3)],
  x1 = c(2, 4),
  y1 = vec_prumery_skupin[c(2, 4)],
  lwd = 2
)

#----------------------------------------#
### Úloha | L08-U07 -----
#----------------------------------------#

# Zadání:
# Pracujte s data_krabi a s připraveným grafem.
# 1. Vypište vec_prumery_skupin a v grafu najděte čtyři průměry.
# 2. Odhadněte mod_formy se vzorcem delka_krunyre_mm ~ forma * pohlavi
#    a určete, která kombinace formy a pohlaví je jeho referenční skupinou.
# 3. Z koeficientů spočítejte:
#    a) rozdíl samec − samice v modré formě;
#    b) rozdíl samec − samice v oranžové formě;
#    c) změnu rozdílu jako oranžový rozdíl minus modrý rozdíl.
# 4. Ověřte, že rozdíly a) a b) odpovídají průměrům z vec_prumery_skupin.

# Vaše řešení:


# Nápověda 1:
# Referenční skupina je ta, která má první úroveň obou faktorů; patří jí
# intercept. Každý další koeficient popisuje posun od ní; interakce říká,
# o kolik se rozdíl mezi pohlavími změní, když přejdeme do druhé formy.
#
# Nápověda 2:
# Modrý rozdíl je koeficient pohlavisamec. Oranžový rozdíl je součet
# koeficientů pohlavisamec a formaoranžová:pohlavisamec; jména
# koeficientů zkopírujte z výpisu coef(mod_formy), ať se nespletete
# v diakritice. Z průměrů
# odečtěte prvky vec_prumery_skupin[2] − vec_prumery_skupin[1] a
# vec_prumery_skupin[4] − vec_prumery_skupin[3].
#
# Očekávaný výsledek:
# Referenční skupinou je modrá samice (intercept 28,102 mm). Graf ukazuje
# 50 bodů v každé skupině a čtyři průměry: 28,102; 32,014; 34,618
# a 33,688 mm v uvedeném pořadí.
# Rozdíl samec − samice je u modré formy +3,912 mm a u
# oranžové formy −0,930 mm. Rozdíl dvou rozdílů je −4,842 mm
# a shoduje se s interakčním koeficientem.
#
# Interpretace:
# Které pohlaví má vyšší průměr v každé formě? Vysvětlete zápornou
# hodnotu −4,842 mm jako změnu rozdílu, ne jako délku jedné skupiny.

#--------------------------------------------------#
## Výklad modelu se dvěma kategoriálními znaky -----
#--------------------------------------------------#
# Model se dvěma kategoriálními prediktory má jeden odhadovaný průměr pro
# každou kombinaci. predict() s interval = "confidence" přidá interval
# spolehlivosti pro průměr skupiny. Residuum je u každého kraba rozdíl
# mezi jeho naměřenou délkou a odhadnutým průměrem jeho skupiny.
# Funkce confint() vrátí intervaly spolehlivosti koeficientů modelu.
#
# Připravená tabulka data_ctyri obsahuje všechny čtyři kombinace pohlaví
# a formy ve stejném pořadí jako skupiny z úlohy U07. Spusťte ji.
data_ctyri <-
  expand.grid(
    pohlavi = levels(x = data_krabi$pohlavi),
    forma = levels(x = data_krabi$forma)
  )
data_ctyri

#----------------------------------------#
### Úloha | L08-U08 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_formy, data_krabi a data_ctyri.
# 1. Pomocí predict() s intervalem spolehlivosti odhadněte pro data_ctyri
#    čtyři průměry a výsledek uložte jako mat_predikce_ctyri.
# 2. Do data_krabi přidejte sloupec residuum_mm s residui mod_formy
#    a pomocí boxplot() je zobrazte zvlášť pro čtyři skupiny ze sloupce
#    skupina.
# 3. Napište dvě až tři věty, které:
#    - porovnají pohlaví zvlášť v každé barevné formě;
#    - uvedou nejistotu změny rozdílu pomocí confint(mod_formy);
#    - omezí závěr na souvislost v tomto souboru krabů.

# Vaše řešení:


# Biologický závěr:
#

# Nápověda 1:
# Predikce popisují průměry kombinací, zatímco residua ukazují
# rozptýlení jednotlivých krabů kolem těchto průměrů.
#
# Nápověda 2:
# Residua vrátí residuals(mod_formy). V boxplot() použijte vzorec
# residuum_mm ~ skupina a data = data_krabi. V confint(mod_formy)
# vyberte řádek interakčního členu.
#
# Očekávaný výsledek:
# Predikce jsou stejné jako čtyři skupinové průměry z L08-U07.
# Přibližné 95% intervaly jsou: modrá samice 26,229–29,975 mm;
# modrý samec 30,141–33,887 mm; oranžová samice 32,745–36,491 mm;
# oranžový samec 31,815–35,561 mm.
# Krabicové grafy residuí mají ve všech skupinách medián blízko nuly
# a podobné rozpětí; jednotliví krabi se od průměru své skupiny liší až
# o 13–17 mm. 95% interval interakčního koeficientu je přibližně −8,589
# až −1,095 mm.
#
# Interpretace:
# Proč věta "samci jsou delší" není pro tento model úplným závěrem?
# Kterou podmínku musíme vždy doplnit?

#--------------------------------------------------#
## Dva numerické prediktory -----
#--------------------------------------------------#
# Interakce může spojovat i dva numerické prediktory. Lesníci odhadují
# objem dřeva v kmeni z průměru kmene a z výšky stromu. Ptáme se:
# přibývá objem dřeva s průměrem kmene stejně rychle u nízkých
# i vysokých stromů? Centimetr průměru navíc znamená silnější vrstvu
# dřeva po celé délce kmene, takže u vyššího stromu bychom čekali větší
# přírůstek objemu.
#
# Připravená tabulka data_porovnani_stromy obsahuje čtyři kombinace
# průměru a výšky, pro které budeme porovnávat predikce. Zvolené průměry
# i výšky leží uvnitř pozorovaných dat. Spusťte ji.
data_porovnani_stromy <-
  expand.grid(
    prumer_cm = c(28, 38),
    vyska_m = c(21, 25)
  )
data_porovnani_stromy

# Připravený graf níže ukáže stromy a dvě odhadnuté přímky z modelu
# mod_stromy. Potřebuje model, proto je zakomentovaný. Přímka pro 21 m
# vede jen přes průměry stromů nižších než 22 m, přímka pro 25 m jen přes
# průměry stromů vyšších než 24 m.
#
# plot(
#   x = data_stromy$prumer_cm,
#   y = data_stromy$objem_m3,
#   pch = 16,
#   col = "grey40",
#   xlab = "Průměr kmene (cm)",
#   ylab = "Objem dřeva (m³)"
# )
#
# data_primka_21 <-
#   data.frame(
#     prumer_cm = range(data_stromy$prumer_cm[data_stromy$vyska_m < 22]),
#     vyska_m = 21
#   )
# data_primka_25 <-
#   data.frame(
#     prumer_cm = range(data_stromy$prumer_cm[data_stromy$vyska_m > 24]),
#     vyska_m = 25
#   )
#
# lines(
#   x = data_primka_21$prumer_cm,
#   y = predict(object = mod_stromy, newdata = data_primka_21),
#   col = "#86579E",
#   lwd = 2
# )
# lines(
#   x = data_primka_25$prumer_cm,
#   y = predict(object = mod_stromy, newdata = data_primka_25),
#   col = "#5D2890",
#   lwd = 3
# )
#
# legend(
#   x = "topleft",
#   legend = c("21 m", "25 m"),
#   col = c("#86579E", "#5D2890"),
#   lwd = c(2, 3),
#   bty = "n"
# )

#----------------------------------------#
### Úloha | L08-U09 -----
#----------------------------------------#

# Zadání:
# Pracujte s připravenými tabulkami data_stromy a data_porovnani_stromy.
# 1. Pomocí range() zjistěte pozorovaný rozsah sloupců prumer_cm
#    a vyska_m. Pak nakreslete plot() objemu objem_m3 proti průměru
#    prumer_cm a popište tvar vztahu.
# 2. Odhadněte mod_stromy se vzorcem objem_m3 ~ prumer_cm * vyska_m
#    a vypište jeho koeficienty.
# 3. Z koeficientů spočítejte sklon průměru při výškách 21, 23 a 25 m
#    a uložte jej jako vec_sklony_prumeru.
# 4. Pomocí mod_stromy predikujte objem pro čtyři řádky
#    data_porovnani_stromy: řádky 1 a 2 jsou 28 a 38 cm při 21 m, řádky
#    3 a 4 totéž při 25 m. Pro každou výšku odečtěte predikci pro 28 cm
#    od predikce pro 38 cm a rozdíl vydělte 10 (38 − 28 = 10 cm).
#    Výsledky porovnejte s prvním (21 m) a třetím (25 m) prvkem
#    vec_sklony_prumeru.
# 5. Zkopírujte, odkomentujte a spusťte připravený graf přímek.
#
# Pokud vám dochází čas, dokončete kroky 1–3 a interpretaci a kroky 4–5
# dokončete doma. Žádná další hlavní úloha na L08-U09 nenavazuje.

# Vaše řešení:


# Nápověda 1:
# Sklon průměru už není jedno číslo. U každého koeficientu se zeptejte,
# při jaké hodnotě druhého prediktoru platí a co se mění s výškou.
#
# Nápověda 2:
# Sklon při výšce h je koeficient prumer_cm plus koeficient
# prumer_cm:vyska_m krát h; koeficienty vybírejte z coef() podle jmen
# a h zadejte jako vektor tří výšek. Výsledek predict() uložte do
# vektoru, například vec_objem_porovnani; rozdíl pro 21 m je jeho druhý
# prvek minus první, pro 25 m čtvrtý minus třetí.
#
# Očekávaný výsledek:
# Průměr kmene sahá přibližně od 21,1 do 52,3 cm, výška od 19,2 do
# 26,5 m. Objem s průměrem kmene roste a vztah je přibližně přímkový.
# Koeficienty jsou přibližně 1,9651; −0,06528; −0,12050 a 0,00493.
# Sklon průměru je přibližně 0,038; 0,048 a 0,058 m³ na 1 cm. Predikce
# jsou přibližně 0,503; 0,884; 0,572 a 1,151 m³. Rozdíl 38 − 28 cm je
# 0,381 m³ při 21 m a 0,578 m³ při 25 m; po vydělení 10 dostanete sklony
# 0,038 a 0,058. V grafu je přímka pro 25 m strmější než přímka pro 21 m.
#
# Interpretace:
# Proč nevykládáme koeficient prumer_cm (−0,065) jako sklon pro změřené
# stromy? Napište jednu větu o tom, jak se přírůstek objemu na 1 cm
# průměru mění s výškou, a omezte ji na pozorovaný rozsah dat.
#
# Poznámka: kontrolu vlivných pozorování (Cookovu vzdálenost) jsme u 31
# stromů pro stručnost vynechali; u skutečné analýzy by následovala.

#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Tyto úlohy jsou pro rychlejší skupiny a pozdější procvičení.
# Nedokončené úlohy navíc neznamenají, že jste nesplnili praktikum.

#----------------------------------------#
### Úloha navíc | L08-N01 -----
#----------------------------------------#

# Zadání:
# Pokud máte nainstalovaný balíček emmeans, použijte funkce s prefixem
# emmeans::
# - emmeans::emtrends() pro sklony pohlaví v mod_interakce;
# - emmeans::emmeans() pro predikce pohlaví při 30 mm;
# - emmeans::contrast() pro rozdíl samec − samice při 30 mm;
# - emmeans::emmeans() pro čtyři skupiny v mod_formy.
#
# Pokud requireNamespace("emmeans", quietly = TRUE) vrátí FALSE,
# tuto dobrovolnou úlohu přeskočte.

# Vaše řešení:


# Nápověda 1:
# Sklon je změna odhadu na jednotku numerického prediktoru. Pro porovnání
# při konkrétní délce nejprve vytvořte odhady při této délce.
#
# Nápověda 2:
# V emtrends() použijte specs = ~ pohlavi a var = "delka_krunyre_mm".
# V emmeans() použijte at = list(delka_krunyre_mm = 30); kontrast
# "samec - samice" má váhy c(-1, 1).
#
# Očekávaný výsledek:
# Sklony jsou přibližně 0,4067 pro samice a 0,2823 pro samce.
# Predikce, kontrast při 30 mm a čtyři skupinové průměry se shodují
# s výsledky hlavních úloh v mezích zaokrouhlení.
#
# Interpretace:
# Co vám emmeans usnadnil oproti ručnímu skládání koeficientů? Změnil
# se statistický model, nebo jen způsob výpočtu a zobrazení?

#----------------------------------------#
### Úloha navíc | L08-N02 -----
#----------------------------------------#

# Zadání:
# V kopii data_modri nastavte jako referenční pohlaví "samec" a znovu
# odhadněte model zadni_sirka_mm ~ delka_krunyre_mm * pohlavi.
# Porovnejte jeho koeficienty s mod_interakce a pomocí all.equal()
# porovnejte fitted() obou modelů.

# Vaše řešení:


# Nápověda 1:
# Změna reference mění způsob popisu stejné dvojice přímek.
#
# Nápověda 2:
# Referenční skupinu nastaví relevel() s ref = "samec". Potom odhadněte
# nový lm() na upravené kopii dat.
#
# Očekávaný výsledek:
# Názvy a hodnoty koeficientů se změní, protože nyní přímo popisují
# samce a rozdíly samice − samec. Odhadnuté hodnoty zůstanou stejné
# a all.equal() vrátí TRUE.
#
# Interpretace:
# Které části závěru závisejí na referenční skupině a které biologické
# predikce na ní nezávisejí?

#----------------------------------------#
### Úloha navíc | L08-N03 -----
#----------------------------------------#

# Zadání:
# Přeneste postup z L08-U02 až L08-U06 na otázku, zda se vztah délky
# krunýře a hloubky těla u modrých krabů liší mezi pohlavími.
# Nakreslete data, odhadněte interakční model, zobrazte predikované
# přímky a interpretujte interakční koeficient.

# Vaše řešení:


# Nápověda 1:
# Mění se pouze odezva; prediktory, faktorové reference a logika
# interpretace zůstávají stejné.
#
# Nápověda 2:
# Nahraďte zadni_sirka_mm proměnnou hloubka_tela_mm ve vzorci i na ose y.
# Sklon samců opět získáte součtem hlavního a interakčního koeficientu.
#
# Očekávaný výsledek:
# Model má vzorec hloubka_tela_mm ~ delka_krunyre_mm * pohlavi.
# Interakční koeficient je záporný, přibližně −0,0255 mm/mm, takže
# odhadnutý sklon samců je menší než odhadnutý sklon samic.
#
# Interpretace:
# Napište závěr podmíněný pohlavím a omezte jej na pozorovaný rozsah
# délek modrých krabů.

#----------------------------------------#
### Úloha navíc | L08-N04 -----
#----------------------------------------#

# Zadání:
# Opravte každé tvrzení tak, aby odpovídalo modelu a datům:
#
# A. "Koeficient pohlavisamec je rozdíl pohlaví při každé délce."
# B. "Záporná interakce znamená, že zadní šířka samců s délkou klesá."
# C. "Samci jsou delší než samice."
# D. "Model dokazuje, že délka krunýře způsobuje větší zadní šířku."

# Vaše řešení:


# Nápověda 1:
# V modelu s interakcí nejsou hlavní efekty obecnými výroky pro všechny
# hodnoty druhého prediktoru.
#
# Nápověda 2:
# Zkontrolujte postupně referenční délku, oba odhadnuté sklony, barevnou
# formu a rozdíl mezi souvislostí a příčinou.
#
# Očekávaný výsledek:
# Každá oprava musí doplnit potřebnou hodnotu nebo skupinu druhého
# prediktoru. U tvrzení B rozlište sklon a rozdíl sklonů. U tvrzení D
# použijte jazyk souvislosti a připomeňte pozorovací původ dat.
#
# Interpretace:
# Která ze čtyř původních vět by mohla biologického čtenáře zmást
# nejvíce a proč?

#----------------------------------------#
### Úloha navíc | L08-N05 -----
#----------------------------------------#

# Zadání:
# Přeneste otázku z hlavní části na kraby oranžové formy. Z data_krabi
# vytvořte data_oranzovi, nakreslete zadní šířku proti délce s pohlavím
# vyjádřeným barvou a symbolem a odhadněte mod_interakce_oranzovi:
#
# zadni_sirka_mm ~ delka_krunyre_mm * pohlavi
#
# Z koeficientů spočítejte sklon samic, sklon samců a rozdíl
# samec − samice při délce 30 mm.

# Vaše řešení:


# Nápověda 1:
# Zachovejte stejné referenční pohlaví a stejný postup jako pro modrou
# formu. Sklon samců i rozdíl při 30 mm skládáte ze dvou koeficientů.
#
# Nápověda 2:
# Řádky vyberte stejně jako v připravených datech pro data_modri; barvu
# a symbol bodu berte ze sloupců barva a symbol. Sklon samců je
# delka_krunyre_mm + delka_krunyre_mm:pohlavisamec. Rozdíl při 30 mm je
# pohlavisamec + 30 * delka_krunyre_mm:pohlavisamec.
#
# Očekávaný výsledek:
# data_oranzovi obsahuje 100 krabů. Graf ukazuje rostoucí vztah u obou
# pohlaví a částečný překryv jejich hodnot. Koeficienty jsou přibližně
# 1,2244; 0,3932; 1,4225 a −0,1078. Sklon samic je 0,3932 mm/mm, sklon
# samců přibližně 0,2854 mm/mm a rozdíl samec − samice při 30 mm je
# přibližně −1,8108 mm.
#
# Interpretace:
# Je směr změny rozdílu mezi pohlavími s délkou u obou barevných forem
# stejný? Odpovězte zvlášť pro směr a velikost odhadované změny.

#----------------------------------------#
### Úloha navíc | L08-N06 -----
#----------------------------------------#

# Zadání:
# U modré formy je modelovaný rozdíl samec − samice při délce x:
#
# pohlavisamec + x * delka_krunyre_mm:pohlavisamec
#
# Z koeficientů mod_interakce vypočítejte délku, při které se tento
# rozdíl rovná nule, pomocí vztahu:
#
# x = -pohlavisamec / delka_krunyre_mm:pohlavisamec
#
# Potom porovnejte výsledek se společným pozorovaným rozsahem délek
# samic a samců z L08-U05.

# Vaše řešení:


# Nápověda 1:
# Nejprve určete průnik dvou rozsahů: větší minimum a menší maximum.
# Potom posuďte, zda vypočtená délka patří do tohoto intervalu.
#
# Nápověda 2:
# Koeficienty vybírejte z coef(mod_interakce) podle jmen. Průnik rozsahů
# získáte jako max() z obou minim a min() z obou maxim, vypočtených
# z data_samice a data_samci. Ve vztahu pozor na znaménko minus a na to,
# že jmenovatelem je koeficient interakce, ne sklon.
#
# Očekávaný výsledek:
# Přímky se protínají přibližně při 15,854 mm. Společný pozorovaný
# rozsah obou pohlaví je 16,1 až 40,9 mm, takže průsečík leží těsně
# mimo něj.
#
# Interpretace:
# Proč nemáme průsečík popsat jako skutečně pozorovanou shodu pohlaví,
# přestože leží velmi blízko naměřeným délkám?

#----------------------------------------#
### Úloha navíc | L08-N07 -----
#----------------------------------------#

# Zadání:
# Z koeficientů mod_formy ručně sestavte odhadovaný průměr délky
# krunýře pro každou skupinu:
#
# modrá samice    = (Intercept)
# modrý samec     = (Intercept) + pohlavisamec
# oranžová samice = (Intercept) + formaoranžová
# oranžový samec  = součet všech čtyř koeficientů
#
# Uložte čtyři výsledky do pojmenovaného vektoru vec_prumery_z_koef.
# Pomocí all.equal() porovnejte unname(vec_prumery_z_koef) s
# unname(mat_predikce_ctyri[, "fit"]). Funkce unname() odstraní jména
# prvků, takže all.equal() porovná jen hodnoty.

# Vaše řešení:


# Nápověda 1:
# Každá nereferenční úroveň přidává svůj koeficient. U kombinace obou
# nereferenčních úrovní se přidává také interakční koeficient.
#
# Nápověda 2:
# Pořadí koeficientů ve výpisu coef(mod_formy) je (Intercept),
# formaoranžová, pohlavisamec a formaoranžová:pohlavisamec. Oranžový samec
# je součet všech čtyř, takže stačí sum(); řádky mat_predikce_ctyri jsou
# ve stejném pořadí skupin jako vec_prumery_z_koef.
#
# Očekávaný výsledek:
# Čtyři hodnoty jsou 28,102; 32,014; 34,618 a 33,688 mm.
# Předepsané porovnání s fit sloupcem mat_predikce_ctyri vrátí TRUE.
#
# Interpretace:
# Proč interakční koeficient sám o sobě není průměrem oranžových samců?

#----------------------------------------#
### Úloha navíc | L08-N08 -----
#----------------------------------------#

# Zadání:
# Zobrazte všech 200 residuí modelu mod_formy (sloupec residuum_mm
# z L08-U08) jako jednotlivé body ve čtyřech skupinách. Vyjděte
# z připraveného grafu před L08-U07: místo délky krunýře nakreslete na
# ose y residuum_mm a přidejte vodorovnou přerušovanou čáru v nule.

# Vaše řešení:


# Nápověda 1:
# Při čtení grafu sledujte, zda se rozptyl residuí liší mezi skupinami a
# zda jsou kladná a záporná residua v každé skupině zhruba vyrovnaná.
# Nulová čára je měřítko, ke kterému residua vztahujete.
#
# Nápověda 2:
# Na ose y použijte data_krabi$residuum_mm. Nulovou čáru přidá
# abline(h = 0, lty = 2).
#
# Očekávaný výsledek:
# Graf ukazuje 50 residuí v každé skupině. Body jsou rozptýlené kolem
# nuly; průměr residuí v každé skupině je numericky velmi blízký nule.
# Jednotliví krabi se však od skupinových průměrů výrazně odchylují.
#
# Interpretace:
# Jaký rozdíl je mezi čtyřmi odhadovanými průměry a rozptylem residuí
# jednotlivých krabů kolem těchto průměrů?

#----------------------------------------#
### Úloha navíc | L08-N09 -----
#----------------------------------------#

# Zadání:
# Objem kmene je zhruba úměrný druhé mocnině průměru krát výšce, tedy
# součinu. Logaritmus mění součin v součet. Pracujte s připravenou
# tabulkou data_stromy a odhadněte mod_stromy_log se vzorcem:
#
# log(objem_m3) ~ log(prumer_cm) * log(vyska_m)
#
# Pomocí confint() vypište 95% interval spolehlivosti interakčního členu.
# Stejně vypište interval interakce v mod_stromy a u obou intervalů
# zjistěte, zda zahrnují nulu. Samotné hodnoty neporovnávejte, protože
# jsou na různých škálách.

# Vaše řešení:


# Nápověda 1:
# Logaritmus můžete použít přímo ve vzorci lm(); data není potřeba
# předem upravovat.
#
# Nápověda 2:
# V confint() vyberte řádek pomocí parm. Interakční člen se ve výpisu
# jmenuje "log(prumer_cm):log(vyska_m)", v mod_stromy
# "prumer_cm:vyska_m".
#
# Očekávaný výsledek:
# V mod_stromy leží interval interakce celý nad nulou (přibližně 0,0031
# až 0,0068). V mod_stromy_log je interval přibližně −1,19 až 1,74,
# je široký a zahrnuje nulu.
#
# Interpretace:
# Proč tvrzení "objem dřeva má interakci průměru a výšky" není úplné,
# dokud neřekneme, na jaké škále objem modelujeme?

#----------------------------------------#
### Úloha navíc | L08-N10 -----
#----------------------------------------#

# Zadání:
# Pracujte s mod_interakce a data_modri, stejně jako v L07-N05
# při kontrole vlivných pozorování.
# 1. Vypočítejte cooks.distance() a nakreslete Cookovy vzdálenosti jako
#    body.
# 2. Přidejte vodorovnou čáru v hodnotě 4/n, kde n je počet krabů
#    v data_modri, a spočítejte, kolik krabů tuto hranici překračuje.
# 3. Najděte index nejvyšší hodnoty a podle něj vypište tohoto kraba
#    z data_modri.
# 4. Fitujte stejný model bez tohoto jednoho kraba a porovnejte jeho
#    interakční koeficient s mod_interakce. Původní data neměňte.
# 5. Napište, co byste ověřili před rozhodnutím, zda s tímto krabem něco
#    dělat. Kraba nemažte.

# Vaše řešení:


# Nápověda 1:
# Hledejte pozorování, jehož vynechání by nejvíce změnilo odhady modelu, a
# oddělte vliv od datové chyby.
#
# Nápověda 2:
# Použijte cooks.distance(), abline() s argumentem h = 4 / nrow(data_modri),
# sum() s porovnáním > a which.max(); index použijte pro výběr řádku
# z data_modri. Pro model bez kraba použijte v lm() argument
# data = data_modri[-index, ].
#
# Očekávaný výsledek:
# Hranice 4/n je 0,04 a překračuje ji 8 ze 100 krabů. Nejvyšší Cookovu
# vzdálenost (asi 0,146) má krab na řádku 100 tabulky data_modri, samice
# s délkou krunýře 40,9 mm, nejdelší samice. Bez ní je interakční koeficient
# asi −0,1316 místo −0,1245 mm/mm a jeho interval stále nezahrnuje nulu.
# Samotná vysoká hodnota nedokazuje chybu; je důvodem ověřit zdrojový
# údaj a zjistit, proč má pozorování vliv, nikoli důvodem k automatickému
# vyřazení. Neodstraňujeme automaticky.
#
# Interpretace:
# Změnil by vynechání tohoto kraba biologický závěr o rozdílu sklonů?
# Jak by svévolné odstranění pozorování mohlo změnit vědeckou otázku?

#----------------------------------------------------------#
# Ohlédnutí a vlastní kontrola -----
#----------------------------------------------------------#

# Dokážu vlastními slovy vysvětlit:
# - proč by se rozdíl mezi samicemi a samci mohl biologicky měnit
#   s velikostí krabů;
# - proč x * y zapisuje x + y + x:y;
# - proč jsou hlavní koeficienty v modelu s interakcí podmíněné;
# - jak z predikcí porovnám dvě skupiny při stejné hodnotě prediktoru;
# - proč je interakce dvou faktorů rozdílem dvou rozdílů;
# - jak se u dvou numerických prediktorů mění sklon jednoho s hodnotou
#   druhého a proč jej uvádím při zvolené hodnotě uvnitř dat;
# - co ukazují residua a proč pozorovací model nedokládá příčinu.
#
# Pokud některý bod ještě neumíte vysvětlit bez pohledu do skriptu,
# vraťte se k úloze, kde jste jej poprvé použili.
