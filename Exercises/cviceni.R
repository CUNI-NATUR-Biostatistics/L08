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
# přesuňte je odtud na uvedená místa.
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
# Hlavní úlohy U01–U09 řešte v uvedeném pořadí, protože na sebe navazují.
# Pozdější úlohy používají tabulku data_krabi z úlohy U01, tabulku
# data_modri z úlohy U02, model mod_interakce z úlohy U04, tabulky
# data_samice a data_samci z úlohy U05, model mod_formy z úlohy U07
# a tabulku data_stromy s modelem mod_stromy z úlohy U09.
# Úlohy navíc N01–N09 jsou dobrovolné. Slouží k dalšímu procvičování,
# klidně i po praktiku, a nemusíte je stihnout.
#
# Spouštění kódu:
# - Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
#   Ctrl + Enter.
# - Více příkazů najednou označte myší a stiskněte Ctrl + Enter.
# - Výsledky se vypisují v panelu Console, grafy v panelu Plots a vytvořené
#   objekty uvidíte v panelu Environment.
#
# Komentáře a odpovědi:
# - Řádky začínající znakem # jsou komentáře; R je nespouští.
# - Kód pište pod řádek "Vaše řešení". Slovní odpovědi pište jako komentáře.
# - Některé ukázky kódu jsou zakomentované. Zkopírujte je do svého řešení
#   a z každého řádku odstraňte úvodní #. Nejrychleji to uděláte tak, že
#   vložené řádky označíte a zvolíte Code > Comment/Uncomment Lines
#   (Ctrl + Shift + C). Spusťte je až tehdy, když už existují objekty,
#   které používají.
# - Nápovědy čtěte postupně. Druhá nápověda je konkrétnější než první.
# - Kopii skriptu průběžně ukládejte pomocí Ctrl + S.
#
# Když se něco pokazí:
# Pokud objekty v Environmentu neodpovídají skriptu, zvolte Session >
# Restart R. Restart smaže objekty z paměti, ale uložené soubory zůstanou.
# Potom znovu spusťte přípravu a své hotové hlavní úlohy shora dolů.

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
# Navazujeme na předchozí lekce: read.csv(), str(), summary(), is.na(),
# table(), factor(), lm(), coef(), summary(), confint(), predict(),
# fitted(), residuals(), plot(), abline(), legend() a aditivní model
# s rovnoběžnými přímkami. Nové funkce vysvětlujeme vždy u úlohy, kde je
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
#
# Funkce factor() s argumenty levels a labels převede kódy na kategorie
# s pevným pořadím a čitelnými názvy. První úroveň bude referenční
# skupinou modelu. Ukázka na vymyšleném vektoru:
vec_ukazka <-
  factor(
    x = c("M", "F", "F"),
    levels = c("F", "M"),
    labels = c("samice", "samec")
  )
vec_ukazka

#----------------------------------------#
### Úloha | L08-U01 -----
#----------------------------------------#

# Zadání:
# 1. Načtěte soubor, jehož cesta je uložena v soubor_krabi, pomocí
#    read.csv() do data_krabi_raw.
# 2. Z data_krabi_raw vytvořte data_krabi obsahující právě sloupce sp,
#    sex, CL, RW a BD. Přejmenujte je v tomto pořadí na forma, pohlavi,
#    delka_krunyre_mm, zadni_sirka_mm a hloubka_tela_mm.
# 3. Převeďte forma na faktor s úrovněmi "modrá", "oranžová" a pohlavi
#    na faktor s úrovněmi "samice", "samec".
# 4. Zjistěte rozměry tabulky, počet chybějících hodnot a počty krabů
#    ve čtyřech kombinacích formy a pohlaví.

# Vaše řešení:


# Nápověda 1:
# Sloupce vyberte podle jmen a nová jména přiřaďte celé tabulce najednou.
# U faktorů rozhoduje pořadí původních kódů v levels; labels jim dají
# nová jména ve stejném pořadí.
#
# Nápověda 2:
# Použijte data_krabi_raw[, c("sp", "sex", "CL", "RW", "BD")] a names().
# Původní kódy zapište jako levels = c("B", "O") a c("F", "M"). Pro
# kontrolu použijte dim(), sum(is.na()) a table() se dvěma sloupci.
#
# Očekávaný výsledek:
# data_krabi má 200 řádků a 5 sloupců, neobsahuje chybějící hodnoty
# a každá kombinace formy a pohlaví obsahuje 50 krabů.
#
# Interpretace:
# Co v tomto datovém rámci představuje jeden řádek? Proč není správnou
# odpovědí "jedno měření"?

#--------------------------------------------------#
## Numerický a kategoriální prediktor -----
#--------------------------------------------------#
# Nejprve budeme zkoumat pouze kraby modré formy. Biologická otázka
# zní: liší se vztah délky a zadní šířky krunýře mezi samicemi a samci?
#
# V grafech budeme pohlaví rozlišovat barvou i tvarem bodu. Díky tomu
# zůstane rozlišení čitelné i bez barev. Modrou a oranžovou necháváme
# barevným formám, proto mají samice zelenou a samci růžovofialovou barvu.
# Barvy a symboly uložíme do pojmenovaných vektorů:
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

# Z pojmenovaného vektoru vybíráme prvky podle jmen. Funkce
# as.character() převede faktor pohlavi na text "samice" nebo "samec",
# takže každý krab dostane barvu podle svého pohlaví. Ukázka na třech
# vymyšlených krabech:
vec_barvy_pohlavi[as.character(x = vec_ukazka)]
# Legenda pak použije stejné vektory:
#
# legend(
#   x = "topleft",
#   legend = names(x = vec_barvy_pohlavi),
#   col = vec_barvy_pohlavi,
#   pch = vec_symboly_pohlavi
# )

#----------------------------------------#
### Úloha | L08-U02 -----
#----------------------------------------#

# Zadání:
# 1. Z data_krabi vyberte do data_modri pouze řádky, kde je forma
#    "modrá".
# 2. Nakreslete bodový graf zadni_sirka_mm proti delka_krunyre_mm.
#    Barvu i symbol každého bodu určete podle pohlaví pomocí vektorů
#    vec_barvy_pohlavi a vec_symboly_pohlavi.
# 3. Přidejte české popisky os a legendu.

# Vaše řešení:


# Nápověda 1:
# Každý řádek potřebuje barvu a symbol podle svého pohlaví; vyberete je
# z pojmenovaných vektorů podle jmen, stejně jako v ukázce.
#
# Nápověda 2:
# V plot() použijte col = vec_barvy_pohlavi[as.character(
# x = data_modri$pohlavi)] a obdobně pch. Popisky os nastaví xlab a ylab;
# legendu přidá legend() s argumenty z ukázky.
#
# Očekávaný výsledek:
# data_modri má 100 řádků. Graf obsahuje 50 zelených kruhů pro samice
# a 50 růžovofialových trojúhelníků pro samce. U obou pohlaví zadní šířka
# s délkou roste a oblaky bodů se částečně překrývají.
#
# Interpretace:
# Naznačuje graf přibližně stejný sklon u obou pohlaví, nebo se sklony
# viditelně liší? Popište také směr vztahu a překryv skupin.

#--------------------------------------------------#
## Co předpokládá model bez interakce? -----
#--------------------------------------------------#
# Aditivní model dovolí různou výšku přímek, ale vynutí jim stejný sklon.
# Rozdíl mezi samcem a samicí je proto při každé délce stejný.
#
# Následující zakomentovaný vzor šetří opakované psaní grafu. Po odhadnutí
# modelu jej zkopírujte pod "Vaše řešení" a odkomentujte. Stejný postup
# použijte u dalších vzorů.
#
# vec_koeficienty_aditivni <-
#   coef(object = mod_aditivni)
#
# plot(
#   x = data_modri$delka_krunyre_mm,
#   y = data_modri$zadni_sirka_mm,
#   col = vec_barvy_pohlavi[as.character(x = data_modri$pohlavi)],
#   pch = vec_symboly_pohlavi[as.character(x = data_modri$pohlavi)],
#   xlab = "Délka krunýře (mm)",
#   ylab = "Zadní šířka krunýře (mm)"
# )

#----------------------------------------#
### Úloha | L08-U03 -----
#----------------------------------------#

# Zadání:
# 1. Na datech data_modri odhadněte mod_aditivni se zadní šířkou jako
#    odezvou a délkou krunýře a pohlavím jako prediktory bez interakce.
# 2. Zobrazte summary(mod_aditivni).
# 3. Použijte připravený vzor grafu a pomocí abline() přidejte
#    z koeficientů modelu přímku pro samice a přímku pro samce.

# Vaše řešení:


# Nápověda 1:
# Referenční skupinou jsou samice: jejich přímce patří intercept
# a sklon. Samčí přímka má stejný sklon a jen posunutý intercept.
#
# Nápověda 2:
# abline(a = ..., b = ..., col = ...) nakreslí přímku s interceptem a
# a sklonem b. Prvky vybírejte jménem, například
# vec_koeficienty_aditivni["(Intercept)"]; u samců sečtěte
# "(Intercept)" a "pohlavisamec".
#
# Očekávaný výsledek:
# Společný sklon je přibližně 0,3316 mm/mm. Odhadnutý rozdíl
# samec − samice je přibližně −1,7172 mm a obě přímky jsou rovnoběžné.
#
# Interpretace:
# Jaké biologické omezení vyjadřují rovnoběžné přímky? Odpovídá podle
# grafu předpoklad stálého rozdílu tomu, co vidíme v datech?

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
#
# Funkce all.equal() porovná dva R objekty a při shodě vrátí TRUE.

#----------------------------------------#
### Úloha | L08-U04 -----
#----------------------------------------#

# Zadání:
# 1. Na data_modri odhadněte mod_interakce se stejnou odezvou
#    a stejnými prediktory jako v U03, spojenými pomocí *.
# 2. Odhadněte mod_interakce_rozepsany s výslovnými členy + a :.
# 3. Pomocí all.equal() ověřte shodu koeficientů a odhadnutých hodnot
#    obou modelů.
# 4. Zavolejte summary(mod_interakce) a vlastními slovy interpretujte
#    všechny čtyři odhady ve sloupci Estimate: (Intercept),
#    delka_krunyre_mm, pohlavisamec a delka_krunyre_mm:pohlavisamec.

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

# Nápověda 1:
# Každý hlavní koeficient čtěte při referenční skupině nebo nulové
# hodnotě druhého prediktoru. Interakční koeficient je rozdíl sklonů.
#
# Nápověda 2:
# Porovnejte coef() obou modelů a potom fitted() obou modelů. Sklon
# samců získáte součtem koeficientů delka_krunyre_mm a
# delka_krunyre_mm:pohlavisamec.
#
# Očekávaný výsledek:
# Obě kontroly all.equal() vrátí TRUE. Koeficienty jsou přibližně
# 0,7077; 0,4067; 1,9731 a −0,1245. Jejich význam je postupně:
# odhad pro samici při 0 mm (mimo pozorovaný rozsah), sklon samic,
# rozdíl samec − samice při 0 mm a rozdíl sklon samec − sklon samice.
# Sklon samců je součet sklonu samic a interakčního koeficientu,
# přibližně 0,2823 mm/mm.
#
# Interpretace:
# Proč koeficient pohlavisamec není rozdílem mezi samci a samicemi při
# každé délce? Při které délce tento koeficient platí přímo?

#--------------------------------------------------#
## Predikce při společné pozorované délce -----
#--------------------------------------------------#
# Pro biologicky smysluplné porovnání zvolíme délku 30 mm. Zda leží
# v pozorovaném rozsahu obou pohlaví, ověříte v úloze.
#
# Nová data pro predict() musí mít stejné názvy proměnných a stejné
# úrovně faktoru jako data použitá k odhadu modelu. Krátký příklad
# konstrukce dvou řádků:
#
# data.frame(
#   delka_krunyre_mm = c(30, 30),
#   pohlavi = factor(
#     x = c("samice", "samec"),
#     levels = levels(x = data_modri$pohlavi)
#   )
# )
#
# S argumentem interval = "confidence" vrátí predict() matici se třemi
# sloupci: fit (odhad průměrné zadní šířky), lwr a upr (hranice jeho 95%
# intervalu spolehlivosti). Sloupec vyberete například
# matice[, "fit"].

#----------------------------------------#
### Úloha | L08-U05 -----
#----------------------------------------#

# Zadání:
# 1. Rozdělte data_modri na data_samice a data_samci. Pomocí range()
#    ověřte rozsah delka_krunyre_mm v každé tabulce a rozhodněte, zda
#    30 mm leží v obou rozsazích.
# 2. Vytvořte data_30 se dvěma řádky pro samici a samce o délce 30 mm.
# 3. Pomocí predict() s interval = "confidence" odhadněte jejich zadní
#    šířku a 95% intervaly spolehlivosti.
# 4. Rozdíl samec − samice spočítejte dvěma cestami:
#    a) odečtením dvou predikcí;
#    b) z koeficientů jako pohlavisamec +
#       30 * delka_krunyre_mm:pohlavisamec.

# Vaše řešení:


# Nápověda 1:
# Nejdříve ověřte, že porovnáváte uvnitř dat. Obě cesty musí dát stejné
# číslo, protože jde o tentýž model.
#
# Nápověda 2:
# predict() potřebuje object, newdata a interval. Ve výsledné matici
# použijte sloupec fit a zachovejte pořadí samice, samec. Pro druhou
# cestu vyberte dva pojmenované prvky z coef(mod_interakce).
#
# Očekávaný výsledek:
# Rozsah samic je 14,7 až 40,9 mm a samců 16,1 až 47,1 mm.
# Odhady zadní šířky při 30 mm jsou přibližně 12,9100 mm pro samici
# a 11,1495 mm pro samce. Obě cesty dávají rozdíl samec − samice
# přibližně −1,7605 mm. Intervaly pro odhadované průměry jsou přibližně
# 12,7849 až 13,0351 mm a 11,0259 až 11,2731 mm.
#
# Interpretace:
# Napište jednu větu se směrem rozdílu, jeho velikostí, společnou délkou
# 30 mm a správnou jednotkou. Proč je tato věta čitelnější než samotný
# koeficient pohlavisamec?

#--------------------------------------------------#
## Celé přímky a residua -----
#--------------------------------------------------#
# Pro každou odhadnutou přímku vytvoříme posloupnost délek a doplníme
# pohlaví. Obě struktury jsou připravené níže. Zkopírujte je do svého
# řešení, odkomentujte a doplňte predikce pomocí predict().
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
#
# Pro graf predikcí zkopírujte také tento základ a po vytvoření
# sloupce odhad_mm doplňte dvě volání lines():
#
# plot(
#   x = data_modri$delka_krunyre_mm,
#   y = data_modri$zadni_sirka_mm,
#   col = vec_barvy_pohlavi[as.character(x = data_modri$pohlavi)],
#   pch = vec_symboly_pohlavi[as.character(x = data_modri$pohlavi)],
#   xlab = "Délka krunýře (mm)",
#   ylab = "Zadní šířka krunýře (mm)"
# )

#----------------------------------------#
### Úloha | L08-U06 -----
#----------------------------------------#

# Zadání:
# 1. Zkopírujte obě připravené struktury a do každé přidejte sloupec
#    odhad_mm pomocí predict().
# 2. Pomocí lines() přidejte do připraveného grafu obě odhadnuté
#    přímky ve správných barvách.
# 3. Vytvořte data_diagnostika se sloupci odhad, residuum a pohlavi
#    z mod_interakce a data_modri.
# 4. Nakreslete residua proti odhadnutým hodnotám, opět s barvou
#    a symbolem podle pohlaví, a přidejte vodorovnou přerušovanou čáru
#    v nule.

# Vaše řešení:


# Nápověda 1:
# Každá přímka má používat jen rozsah délek skutečně pozorovaný pro dané
# pohlaví. Diagnostický graf porovnává odhadnuté hodnoty modelu s jeho
# residui.
#
# Nápověda 2:
# Pro každý ze dvou datových rámců zavolejte predict() se správným
# newdata; lines() potřebuje x, y a col. Pro diagnostiku použijte
# fitted() a residuals(); nulovou čáru přidá abline(h = 0, lty = 2).
#
# Očekávaný výsledek:
# Graf predikcí má dvě rostoucí, nerovnoběžné přímky. Samičí přímka
# roste rychleji. V grafu residuí jsou body kolem nuly bez oblouku a
# s podobným rozptylem; jednotliví krabi se přesto od přímek odchylují.
#
# Interpretace:
# Co graf residuí říká o popisu těchto dat? Napište také jednu větu
# vysvětlující, proč tato pozorovací data nedokazují, že rozdíl v zadní
# šířce způsobuje pohlaví nebo nošení vajíček.

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
# Připravený základ grafu níže zobrazí každého kraba a čtyři skupinové
# průměry. Funkce v něm dělají toto:
# - interaction() vytvoří faktor ze všech kombinací dvou faktorů;
#   lex.order = TRUE seřadí nejprve pohlaví uvnitř modré formy a potom
#   pohlaví uvnitř oranžové formy;
# - jitter() body mírně vodorovně rozestoupí, aby se méně překrývaly;
#   set.seed() zajistí, že náhodné rozestoupení bude při opakování stejné;
# - xaxt = "n" vynechá číselnou osu x a axis() ji nahradí názvy skupin;
#   "\n" v popisku zalomí řádek;
# - tapply() spočítá průměr délky zvlášť pro každou ze čtyř skupin;
# - points() přidá průměry jako velké kosočtverce;
# - segments() nakreslí úsečky z bodu (x0, y0) do bodu (x1, y1); zde
#   spojí průměr samic s průměrem samců uvnitř každé formy.
#
# data_krabi$skupina <-
#   interaction(
#     data_krabi$forma,
#     data_krabi$pohlavi,
#     sep = " – ",
#     lex.order = TRUE
#   )
#
# set.seed(900723)
# vec_pozice <-
#   jitter(
#     x = as.numeric(x = data_krabi$skupina),
#     amount = 0.12
#   )
#
# plot(
#   x = vec_pozice,
#   y = data_krabi$delka_krunyre_mm,
#   xaxt = "n",
#   col = vec_barvy_pohlavi[as.character(x = data_krabi$pohlavi)],
#   pch = vec_symboly_pohlavi[as.character(x = data_krabi$pohlavi)],
#   xlab = "Barevná forma a pohlaví",
#   ylab = "Délka krunýře (mm)"
# )
#
# axis(
#   side = 1,
#   at = 1:4,
#   labels = c(
#     "modrá\nsamice",
#     "modrá\nsamec",
#     "oranžová\nsamice",
#     "oranžová\nsamec"
#   )
# )
#
# vec_prumery_skupin <-
#   tapply(
#     X = data_krabi$delka_krunyre_mm,
#     INDEX = data_krabi$skupina,
#     FUN = mean
#   )
#
# points(
#   x = 1:4,
#   y = vec_prumery_skupin,
#   pch = 23,
#   cex = 2.5,
#   bg = "grey20"
# )
#
# segments(
#   x0 = c(1, 3),
#   y0 = vec_prumery_skupin[c(1, 3)],
#   x1 = c(2, 4),
#   y1 = vec_prumery_skupin[c(2, 4)],
#   lwd = 2
# )

#----------------------------------------#
### Úloha | L08-U07 -----
#----------------------------------------#

# Zadání:
# 1. Zkopírujte a spusťte připravený základ grafu. Vypište
#    vec_prumery_skupin a v grafu najděte čtyři průměry.
# 2. Odhadněte mod_formy se vzorcem delka_krunyre_mm ~ forma * pohlavi.
# 3. Z koeficientů modelu spočítejte:
#    a) rozdíl samec − samice v modré formě;
#    b) rozdíl samec − samice v oranžové formě;
#    c) změnu rozdílu jako oranžový rozdíl minus modrý rozdíl.
# 4. Ověřte, že rozdíly a) a b) odpovídají průměrům z vec_prumery_skupin.

# Vaše řešení:


# Nápověda 1:
# Referenční skupinou je modrá samice. Každý další koeficient popisuje
# posun od ní; interakce říká, o kolik se rozdíl mezi pohlavími změní,
# když přejdeme do druhé formy.
#
# Nápověda 2:
# Modrý rozdíl je koeficient pohlavisamec. Oranžový rozdíl je součet
# koeficientů pohlavisamec a formaoranžová:pohlavisamec. Z průměrů
# odečtěte prvky vec_prumery_skupin[2] − vec_prumery_skupin[1] a
# vec_prumery_skupin[4] − vec_prumery_skupin[3].
#
# Očekávaný výsledek:
# Graf ukazuje 50 bodů v každé skupině a čtyři průměry: 28,102;
# 32,014; 34,618 a 33,688 mm v uvedeném pořadí.
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
# Tabulka všech čtyř kombinací pro predict(). Funkce expand.grid()
# vytvoří řádek pro každou kombinaci zadaných hodnot; první argument
# se mění nejrychleji, takže pořadí řádků odpovídá pořadí skupin
# z úlohy U07:
#
# data_ctyri <-
#   expand.grid(
#     pohlavi = levels(x = data_krabi$pohlavi),
#     forma = levels(x = data_krabi$forma)
#   )

#----------------------------------------#
### Úloha | L08-U08 -----
#----------------------------------------#

# Zadání:
# 1. Do data_krabi přidejte sloupec residuum_mm s residui mod_formy.
# 2. Zkopírujte připravenou tabulku data_ctyri. Pomocí mod_formy
#    predikujte pro data_ctyri čtyři průměry a jejich 95% intervaly
#    spolehlivosti a výsledek uložte jako mat_predikce_ctyri.
# 3. Pomocí tapply() vypište summary() residuí zvlášť pro každou
#    skupinu ze sloupce skupina.
# 4. Napište dvě až tři věty, které:
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
# Residua vrátí residuals(mod_formy). V tapply() zadejte
# X = data_krabi$residuum_mm, INDEX = data_krabi$skupina a FUN = summary.
# V confint(mod_formy) vyberte řádek interakčního členu.
#
# Očekávaný výsledek:
# Predikce jsou stejné jako čtyři skupinové průměry z L08-U07.
# Přibližné 95% intervaly jsou: modrá samice 26,229–29,975 mm;
# modrý samec 30,141–33,887 mm; oranžová samice 32,745–36,491 mm;
# oranžový samec 31,815–35,561 mm.
# Residua mají v každé skupině průměr velmi blízký nule, ale ukazují
# výraznou variabilitu jednotlivých krabů. 95% interval interakčního
# koeficientu je přibližně −8,589 až −1,095 mm.
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
# Připravený kód níže má dvě části. První část (od data_stromy_raw po
# data_porovnani_stromy) načte soubor stromy.csv, převede americké
# jednotky na centimetry, metry a krychlové metry a vytvoří tabulku čtyř
# kombinací průměru a výšky, pro které budeme porovnávat predikce.
# Zvolené průměry i výšky leží uvnitř pozorovaných dat.
#
# data_stromy_raw <-
#   read.csv(file = soubor_stromy)
#
# data_stromy <-
#   data.frame(
#     prumer_cm = data_stromy_raw$Girth * 2.54, # palce na cm
#     vyska_m = data_stromy_raw$Height * 0.3048, # stopy na m
#     objem_m3 = data_stromy_raw$Volume * 0.0283168 # krychlové stopy na m³
#   )
#
# data_porovnani_stromy <-
#   expand.grid(
#     prumer_cm = c(28, 36),
#     vyska_m = c(21, 25)
#   )
#
# Druhá část (od plot() po legend()) je graf. Ukáže stromy a dvě
# predikované přímky modelu mod_stromy, takže ji spusťte až po odhadu
# modelu v úloze. Přímka pro 21 m vede jen přes průměry stromů nižších
# než 22 m, přímka pro 25 m jen přes průměry stromů vyšších než 24 m.
# Funkce range() vrátí nejmenší a největší hodnotu; dva body stačí
# k nakreslení přímky pomocí lines().
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
# 1. Zkopírujte a spusťte první část připraveného kódu (od
#    data_stromy_raw po data_porovnani_stromy). Ověřte, že data_stromy
#    má 31 řádků a žádné chybějící hodnoty, a pomocí range() zjistěte
#    pozorovaný rozsah sloupců prumer_cm a vyska_m.
# 2. Odhadněte mod_stromy se vzorcem objem_m3 ~ prumer_cm * vyska_m
#    a vypište jeho koeficienty.
# 3. Z koeficientů spočítejte sklon průměru při výškách 21, 23 a 25 m
#    a uložte jej jako vec_sklony_prumeru.
# 4. Pomocí mod_stromy predikujte objem pro data_porovnani_stromy.
#    Pro výšku 21 m i 25 m odečtěte predikci pro 28 cm od predikce
#    pro 36 cm a rozdíl vydělte 8 (36 − 28 = 8 cm). Výsledky porovnejte
#    s prvním (21 m) a třetím (25 m) prvkem vec_sklony_prumeru.
# 5. Zkopírujte a spusťte druhou část připraveného kódu (graf).
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
# a h zadejte jako vektor tří výšek. Predikce uložte jako nový sloupec
# data_porovnani_stromy; řádky 1 a 2 patří výšce 21 m, řádky 3 a 4
# výšce 25 m.
#
# Očekávaný výsledek:
# data_stromy má 31 řádků a 0 chybějících hodnot. Průměr kmene sahá
# přibližně od 21,1 do 52,3 cm, výška od 19,2 do 26,5 m. Koeficienty jsou
# přibližně 1,9651; −0,06528; −0,12050 a 0,00493. Sklon průměru je
# přibližně 0,038; 0,048 a 0,058 m³ na 1 cm. Predikce jsou přibližně
# 0,503; 0,808; 0,572 a 1,035 m³. Rozdíl 36 − 28 cm je 0,305 m³ při
# 21 m a 0,463 m³ při 25 m; po vydělení 8 dostanete sklony 0,038
# a 0,058. V grafu je přímka pro 25 m strmější než přímka pro 21 m.
#
# Interpretace:
# Proč nevykládáme koeficient prumer_cm (−0,065) jako sklon pro změřené
# stromy? Napište jednu větu o tom, jak se přírůstek objemu na 1 cm
# průměru mění s výškou, a omezte ji na pozorovaný rozsah dat.

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
# Referenční úroveň nastaví relevel() s ref = "samec". Potom odhadněte
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
# Sklon samců je delka_krunyre_mm +
# delka_krunyre_mm:pohlavisamec. Rozdíl při 30 mm je pohlavisamec +
# 30 * delka_krunyre_mm:pohlavisamec.
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
# Z coef(mod_interakce) vyberte pojmenované prvky pohlavisamec a
# delka_krunyre_mm:pohlavisamec a dosaďte je do připraveného vztahu.
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
# Uložte coef(mod_formy) do vec_koeficienty_formy a vybírejte jeho
# prvky podle názvů. Pro porovnání vyberte z mat_predikce_ctyri pouze
# sloupec "fit" a na obou stranách použijte unname().
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
# Zobrazte všech 200 residuí modelu mod_formy ve čtyřech skupinách.
# Vytvořte stejné pořadí faktoru skupina jako v L08-U07, nastavte
# set.seed(900723) a vodorovně posuňte číselné pozice pomocí jitter().
# Nakreslete residuum_mm proti těmto pozicím, pohlaví vyjádřete barvou
# i symbolem, popište čtyři skupiny na ose x a přidejte vodorovnou
# přerušovanou čáru v nule.

# Vaše řešení:


# Nápověda 1:
# Použijte strukturu čtyřskupinového grafu z L08-U07. Změní se pouze
# svislá proměnná a její popisek; přibude nulová čára.
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
# součinu. Logaritmus mění součin v součet. Pracujte s data_stromy
# z L08-U09 a odhadněte mod_stromy_log se vzorcem:
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
