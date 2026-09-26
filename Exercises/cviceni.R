#----------------------------------------------------------#
#
#              L08 — modely s interakcí
#
#                 Praktické cvičení v R
#
#             Studenti biologie a ekologie
#
#                       O. Mottl
#                         2026
#
#----------------------------------------------------------#


#----------------------------------------------------------#
# Příprava -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Jak získat a otevřít skript -----
#--------------------------------------------------#

# 1. Ve veřejném webu kurzu otevřete lekci L08 a stáhněte soubor
#    cviceni.R.
# 2. V počítači vytvořte složku L08_praktikum a přesuňte do ní cviceni.R.
# 3. V RStudio zvolte File > New Project > Existing Directory. Vyberte
#    složku L08_praktikum a potvrďte Create Project.
#
# RStudio Project je hlavní složka vaší práce. Soubor s koncovkou .Rproj
# pomáhá RStudio tuto složku znovu otevřít. Skript, data a případné výstupy
# zůstávají samostatnými soubory uvnitř této složky.
#
# 4. V panelu Files klikněte na cviceni.R. Skript se otevře v panelu Source.
# 5. Uložte vlastní kopii pomocí File > Save As, například jako
#    cviceni_L08_prijmeni.R.


#--------------------------------------------------#
## Jak se skriptem pracovat -----
#--------------------------------------------------#

# Ve výuce postupujte částí Hlavní úlohy. Úlohy navíc jsou dobrovolné.
# Při samostudiu postupujte shora dolů.
#
# Jeden příkaz spustíte tak, že do něj umístíte kurzor a stisknete
# Ctrl + Enter. Několik příkazů spustíte jejich označením a stejnou
# klávesovou zkratkou.
#
# Vlastní kód pište pod komentář "Vaše řešení". Řádky začínající znakem #
# jsou komentáře a R je nespouští. Odpovědi na interpretační otázky pište
# také jako komentáře.
#
# Když se objekty v Environmentu neshodují se skriptem, zvolte v RStudio
# Session > Restart R. Restart odstraní objekty z paměti R, ale nesmaže
# uložený skript ani jiné soubory. Potom spusťte potřebné příkazy znovu
# shora dolů.


#--------------------------------------------------#
## Výsledky učení a předpoklady -----
#--------------------------------------------------#

# Po dokončení cvičení dokážete:
# - rozpoznat, kdy vztah jednoho prediktoru k odezvě závisí na druhém;
# - zapsat, odhadnout a zobrazit model s interakcí;
# - interpretovat předpovědi a podmíněné koeficienty modelu;
# - vysvětlit interakci číselného a skupinového prediktoru i interakci
#   dvou skupinových prediktorů.
#
# Navazujeme na dřívější práci s datovými rámci, faktory, grafy, lm(),
# summary(), predict(), intervaly spolehlivosti a rezidui. Připomeneme si
# také, že pozorovací data ukazují asociace, sama však nedokládají příčinu.


#--------------------------------------------------#
## Technická kontrola -----
#--------------------------------------------------#

# Data crabs jsou součástí balíčku MASS. Následující kontrola nic
# neinstaluje. Pokud se objeví chybová zpráva, nainstalujte MASS přes
# panel Packages v RStudio a spusťte kontrolu znovu.

if (
  !requireNamespace(
    package = "MASS",
    quietly = TRUE
  )) {
  stop(
    "Chybí balíček MASS. Nainstalujte jej přes panel Packages v RStudio.",
    call. = FALSE
  )
}


#----------------------------------------------------------#
# Připomenutí práce se vzorcem modelu -----
#----------------------------------------------------------#

# Tento krátký blok můžete přeskočit, pokud se ve vzorcích modelů
# orientujete.
#
# Aditivní model s prediktory x a skupina zapisujeme:
#
# odezva ~ x + skupina
#
# Model s interakcí obsahuje také člen x:skupina:
#
# odezva ~ x + skupina + x:skupina
#
# Hvězdička je kratší zápis stejného modelu:
#
# odezva ~ x * skupina
#
# Dvojtečka tedy označuje interakční člen. Neznamená dělení.


#----------------------------------------------------------#
# Hlavní úlohy -----
#----------------------------------------------------------#

#--------------------------------------------------#
## Od celého souboru k biologické otázce -----
#--------------------------------------------------#

# Soubor MASS::crabs obsahuje měření 200 pobřežních krabů druhu
# Leptograpsus variegatus. Každý řádek je jeden krab. Budeme používat:
#
# sp  ... barevná forma: B = modrá, O = oranžová
# sex ... pohlaví: F = samice, M = samec
# CL  ... délka krunýře v mm
# RW  ... zadní šířka krunýře v mm
# BD  ... hloubka těla v mm
#
# Zdroj dat: Campbell & Mahon (1974), dostupný v balíčku MASS.


#----------------------------------------#
### Úloha | L08-U01 -----
#----------------------------------------#

# Zadání:
# Z MASS::crabs vytvořte objekt data_krabi obsahující právě sloupce
# sp, sex, CL, RW a BD. Přejmenujte je v tomto pořadí na forma, pohlavi,
# delka_krunyre_mm, zadni_sirka_mm a hloubka_tela_mm.
#
# Proměňte forma na faktor s pořadím "modrá", "oranžová" a pohlavi
# na faktor s pořadím "samice", "samec". Potom zjistěte rozměry dat,
# počet chybějících hodnot a počty krabů ve čtyřech kombinacích formy
# a pohlaví.

# Vaše řešení:


# Očekávaný výsledek:
# data_krabi má 200 řádků a 5 sloupců, neobsahuje chybějící hodnoty
# a každá kombinace formy a pohlaví obsahuje 50 krabů.
#
# Nápověda 1:
# Nejprve vyberte sloupce, potom nastavte jejich názvy. U faktorů záleží
# na pořadí levels i odpovídajícím pořadí labels.
#
# Nápověda 2:
# Pro kontrolu použijte dim(), sum(is.na()) a table(). Původní úrovně
# faktorů zapište jako c("B", "O") a c("F", "M").
#
# Interpretace:
# Co v tomto datovém rámci představuje jeden řádek? Proč není správnou
# odpovědí "jedno měření"?


#--------------------------------------------------#
## Číselný a skupinový prediktor -----
#--------------------------------------------------#

# Nejprve budeme zkoumat pouze kraby modré formy. Biologická otázka
# zní: liší se vztah délky a zadní šířky krunýře mezi samicemi a samci?
#
# V grafech budeme pohlaví rozlišovat barvou i tvarem bodu. Díky tomu
# zůstane rozlišení čitelné i bez barev.

vec_barvy_pohlavi <-
  c(
    "samice" = "#5B4B9A",
    "samec" = "#D97706"
  )

vec_symboly_pohlavi <-
  c(
    "samice" = 16,
    "samec" = 17
  )


#----------------------------------------#
### Úloha | L08-U02 -----
#----------------------------------------#

# Zadání:
# Z data_krabi vyberte do data_modri pouze řádky, kde je forma "modrá".
# Nakreslete bodový graf zadni_sirka_mm proti delka_krunyre_mm. Barvu
# i symbol každého bodu určete podle pohlaví pomocí připravených vektorů
# vec_barvy_pohlavi a vec_symboly_pohlavi. Přidejte české popisky os
# a legendu.

# Vaše řešení:


# Očekávaný výsledek:
# data_modri má 100 řádků. Graf obsahuje 50 kruhů pro samice a 50
# trojúhelníků pro samce. U obou pohlaví zadní šířka s délkou roste
# a oblaky bodů se částečně překrývají.
#
# Nápověda 1:
# Barvu a symbol lze každému řádku přiřadit indexováním pojmenovaného
# vektoru úrovní faktoru pohlavi.
#
# Nápověda 2:
# V plot() použijte col = vec_barvy_pohlavi[data_modri$pohlavi] a obdobně
# pch. Legenda potřebuje stejné barvy a symboly.
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
# Následující komentovaný vzor šetří opakované psaní grafu. Po odhadnutí
# modelu jej zkopírujte pod "Vaše řešení". Označte vložené řádky
# a zvolte Code > Comment/Uncomment Lines. Tím RStudio odstraní úvodní #
# ze všech označených řádků. Stejný postup použijte u dalších vzorů.
#
# vec_koeficienty_aditivni <- coef(object = mod_aditivni)
#
# plot(
#   x = data_modri$delka_krunyre_mm,
#   y = data_modri$zadni_sirka_mm,
#   col = vec_barvy_pohlavi[data_modri$pohlavi],
#   pch = vec_symboly_pohlavi[data_modri$pohlavi],
#   xlab = "Délka krunýře (mm)",
#   ylab = "Zadní šířka krunýře (mm)"
# )


#----------------------------------------#
### Úloha | L08-U03 -----
#----------------------------------------#

# Zadání:
# Na datech data_modri odhadněte mod_aditivni se zadní šířkou jako
# odezvou a délkou krunýře a pohlavím jako prediktory bez interakce.
# Zobrazte summary(mod_aditivni).
#
# Použijte připravený vzor grafu. Pomocí abline() přidejte přímku
# pro samice a přímku pro samce. Sklon je u obou přímek koeficient
# delka_krunyre_mm; u samců přičtěte k interceptu koeficient
# pohlavisamec.

# Vaše řešení:


# Očekávaný výsledek:
# Společný sklon je přibližně 0,3316 mm/mm. Odhadnutý rozdíl
# samec − samice je přibližně −1,7172 mm a obě přímky jsou rovnoběžné.
#
# Nápověda 1:
# V připraveném objektu vec_koeficienty_aditivni pro samici použijete
# intercept a sklon; pro samce se mění pouze intercept.
#
# Nápověda 2:
# První abline() použije pojmenované prvky "(Intercept)" a
# "delka_krunyre_mm". U druhé přičtěte k interceptu pojmenovaný prvek
# "pohlavisamec"; sklon zůstává stejný.
#
# Interpretace:
# Jaké biologické omezení vyjadřují rovnoběžné přímky? Odpovídá podle
# grafu předpoklad stálého rozdílu tomu, co vidíme v datech?


#--------------------------------------------------#
## Interakce dovolí pohlavím různé sklony -----
#--------------------------------------------------#

# Přidáme člen delka_krunyre_mm:pohlavi. Hvězdička ve vzorci automaticky
# zapíše oba hlavní členy i jejich interakci:
#
# delka_krunyre_mm * pohlavi
#
# je totéž jako
#
# delka_krunyre_mm + pohlavi + delka_krunyre_mm:pohlavi
#
# Protože referenční úrovní pohlaví je samice, první dva koeficienty
# popisují samice. Další dva říkají, jak se u samců změní intercept
# a sklon. Intercept i rozdíl pohlaví se vztahují k délce 0 mm, která
# leží mimo pozorované kraby; biologicky čitelnější budou předpovědi
# při skutečně pozorované délce.
#
# Funkce all.equal() porovná dva R objekty a při shodě vrátí TRUE.


#----------------------------------------#
### Úloha | L08-U04 -----
#----------------------------------------#

# Zadání:
# Na data_modri odhadněte mod_interakce se vzorcem používajícím *.
# Potom odhadněte mod_interakce_rozepsany s výslovnými členy + a :.
# Pomocí all.equal() ověřte shodu koeficientů a odhadnutých hodnot.
#
# Zavolejte summary(mod_interakce) a vlastními slovy interpretujte
# všechny čtyři odhady ve sloupci Estimate:
# (Intercept), delka_krunyre_mm, pohlavisamec a
# delka_krunyre_mm:pohlavisamec.

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

# Očekávaný výsledek:
# Obě kontroly all.equal() vrátí TRUE. Koeficienty jsou přibližně
# 0,7077; 0,4067; 1,9731 a −0,1245. Jejich význam je postupně:
# odhad pro samici při 0 mm (mimo pozorovaný rozsah), sklon samic,
# rozdíl samec − samice při 0 mm a rozdíl sklon samec − sklon samice.
# Sklon samců je součet sklonu samic a interakčního koeficientu,
# přibližně 0,2823 mm/mm.
#
# Nápověda 1:
# Každý hlavní koeficient čtěte při referenční úrovni nebo hodnotě
# druhého prediktoru. Interakční koeficient je rozdíl sklonů.
#
# Nápověda 2:
# Porovnejte coef() obou modelů a potom fitted() obou modelů. Sklon
# samců získáte součtem koeficientů delka_krunyre_mm a
# delka_krunyre_mm:pohlavisamec.
#
# Interpretace:
# Proč koeficient pohlavisamec není rozdílem mezi samci a samicemi při
# každé délce? Při které délce tento koeficient platí přímo?


#--------------------------------------------------#
## Předpověď při společné pozorované délce -----
#--------------------------------------------------#

# Pro biologicky smysluplné porovnání zvolíme délku až po prohlédnutí
# dat. Hodnota 30 mm leží v pozorovaném rozsahu samic i samců.
#
# Nová data pro predict() musí mít stejné názvy proměnných a stejné
# úrovně faktoru jako data použitá k odhadu modelu. Krátký příklad
# konstrukce dvou řádků:
#
# data.frame(
#   delka_krunyre_mm = c(30, 30),
#   pohlavi = factor(
#     x = c("samice", "samec"),
#     levels = levels(data_modri$pohlavi)
#   )
# )


#----------------------------------------#
### Úloha | L08-U05 -----
#----------------------------------------#

# Zadání:
# Rozdělte data_modri na data_samice a data_samci. Pomocí range()
# ověřte rozsah delka_krunyre_mm v každém datovém rámci a rozhodněte,
# zda 30 mm leží v obou rozsazích.
#
# Vytvořte data_30 se dvěma řádky pro samici a samce o délce 30 mm.
# Pomocí predict() a interval = "confidence" odhadněte jejich zadní
# šířku a 95% intervaly spolehlivosti. Rozdíl samec − samice spočítejte:
#
# 1. odečtením dvou předpovědí;
# 2. z koeficientů jako pohlavisamec +
#    30 * delka_krunyre_mm:pohlavisamec.

# Vaše řešení:


# Očekávaný výsledek:
# Rozsah samic je 14,7 až 40,9 mm a samců 16,1 až 47,1 mm.
# Odhady zadní šířky při 30 mm jsou přibližně 12,9100 mm pro samici
# a 11,1495 mm pro samce. Obě cesty dávají rozdíl samec − samice
# přibližně −1,7605 mm. Intervaly pro odhadované průměry jsou přibližně
# 12,7849 až 13,0351 mm a 11,0259 až 11,2731 mm.
#
# Nápověda 1:
# Nejdříve ověřte, že porovnáváte uvnitř dat. V matici z predict()
# použijte sloupec fit a zachovejte pořadí samice, samec.
#
# Nápověda 2:
# predict() potřebuje object, newdata a interval. Pro druhou cestu
# vyberte dva pojmenované prvky z coef(mod_interakce).
#
# Interpretace:
# Napište jednu větu se směrem rozdílu, jeho velikostí, společnou délkou
# 30 mm a správnou jednotkou. Proč je tato věta čitelnější než samotný
# koeficient pohlavisamec?


#--------------------------------------------------#
## Celé přímky a rezidua -----
#--------------------------------------------------#

# Pro každou modelovou přímku vytvoříme posloupnost délek a doplníme
# pohlaví. Obě struktury jsou připravené níže. Zkopírujte je do svého
# řešení bez znaků # a doplňte předpovědi pomocí predict().
#
# data_cara_samice <- data.frame(
#   delka_krunyre_mm = seq(
#     from = min(data_samice$delka_krunyre_mm),
#     to = max(data_samice$delka_krunyre_mm),
#     length.out = 100
#   ),
#   pohlavi = factor(
#     x = "samice",
#     levels = levels(data_modri$pohlavi)
#   )
# )
#
# data_cara_samec <- data.frame(
#   delka_krunyre_mm = seq(
#     from = min(data_samci$delka_krunyre_mm),
#     to = max(data_samci$delka_krunyre_mm),
#     length.out = 100
#   ),
#   pohlavi = factor(
#     x = "samec",
#     levels = levels(data_modri$pohlavi)
#   )
# )
#
# Pro graf předpovědí zkopírujte také tento základ a po vytvoření
# sloupce odhad_mm doplňte dvě volání lines():
#
# plot(
#   x = data_modri$delka_krunyre_mm,
#   y = data_modri$zadni_sirka_mm,
#   col = vec_barvy_pohlavi[data_modri$pohlavi],
#   pch = vec_symboly_pohlavi[data_modri$pohlavi],
#   xlab = "Délka krunýře (mm)",
#   ylab = "Zadní šířka krunýře (mm)"
# )


#----------------------------------------#
### Úloha | L08-U06 -----
#----------------------------------------#

# Zadání:
# Zkopírujte obě připravené struktury a do každé přidejte sloupec
# odhad_mm pomocí predict(). Pomocí lines() přidejte
# obě předpovězené přímky ve správných barvách.
#
# Potom vytvořte data_diagnostika se sloupci odhad, residuum a pohlavi.
# Nakreslete rezidua proti odhadnutým hodnotám, opět s barvou a symbolem
# podle pohlaví, a přidejte vodorovnou přerušovanou čáru v nule.

# Vaše řešení:


# Očekávaný výsledek:
# Graf předpovědí má dvě rostoucí, nerovnoběžné přímky. Samičí přímka
# roste rychleji. V grafu reziduí jsou body kolem nuly bez výrazného
# systematického vzoru; jednotliví krabi se přesto od přímek odchylují.
#
# Nápověda 1:
# Každá přímka má používat jen rozsah délek skutečně pozorovaný pro dané
# pohlaví. Diagnostický graf porovnává fitted() a residuals().
#
# Nápověda 2:
# Pro každý ze dvou datových rámců zavolejte predict() se správným
# newdata. Nulovou čáru přidá abline(h = 0, lty = 2).
#
# Interpretace:
# Co graf reziduí říká o popisu těchto dat? Napište také jednu větu
# vysvětlující, proč model z těchto pozorovacích dat neprokazuje, že
# změna délky způsobuje změnu zadní šířky.


#--------------------------------------------------#
## Dva skupinové prediktory -----
#--------------------------------------------------#

# Nyní použijeme všech 200 krabů. Odezvou bude délka krunýře a dvěma
# prediktory barevná forma a pohlaví. Ptáme se, zda se rozdíl
# samec − samice mění mezi modrou a oranžovou formou.
#
# Funkce interaction() vytvoří faktor ze všech kombinací dvou faktorů.
# Argument lex.order = TRUE seřadí nejprve pohlaví uvnitř modré formy
# a potom pohlaví uvnitř oranžové formy. Funkce jitter() body mírně
# vodorovně rozestoupí, aby se méně překrývaly. set.seed() zajistí, že
# náhodné rozestoupení bude při opakování stejné.
#
# Zkopírujte tento mechanický základ grafu do řešení bez znaků #:
#
# data_krabi$skupina <- interaction(
#   data_krabi$forma,
#   data_krabi$pohlavi,
#   sep = " – ",
#   lex.order = TRUE
# )
#
# set.seed(900723)
# vec_pozice <- jitter(
#   x = as.numeric(data_krabi$skupina),
#   amount = 0.12
# )
#
# plot(
#   x = vec_pozice,
#   y = data_krabi$delka_krunyre_mm,
#   xaxt = "n",
#   col = vec_barvy_pohlavi[data_krabi$pohlavi],
#   pch = vec_symboly_pohlavi[data_krabi$pohlavi],
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


#----------------------------------------#
### Úloha | L08-U07 -----
#----------------------------------------#

# Zadání:
# Použijte připravený základ, který vytvoří faktor skupina v pořadí
# modrá – samice, modrá – samec, oranžová – samice, oranžová – samec
# a zobrazí každý krab. Vypočítejte čtyři skupinové průměry, přidejte
# je výraznými symboly a spojte průměry uvnitř každé barevné formy.
#
# Odhadněte mod_formy se vzorcem delka_krunyre_mm ~ forma * pohlavi.
# Z koeficientů modelu spočítejte:
# - rozdíl samec − samice v modré formě;
# - rozdíl samec − samice v oranžové formě;
# - změnu rozdílu jako oranžový rozdíl minus modrý rozdíl.

# Vaše řešení:


# Očekávaný výsledek:
# Graf ukazuje 50 bodů v každé skupině a čtyři průměry: 28,102;
# 32,014; 34,618 a 33,688 mm v uvedeném pořadí.
# Rozdíl samec − samice je u modré formy +3,912 mm a u
# oranžové formy −0,930 mm. Rozdíl dvou rozdílů je −4,842 mm
# a shoduje se s interakčním koeficientem.
#
# Nápověda 1:
# Čtyři průměry můžete získat pomocí tapply(). Interakce dvou faktorů
# vyjadřuje, o kolik se jeden skupinový rozdíl změní mezi úrovněmi
# druhého faktoru.
#
# Nápověda 2:
# Připravený graf už obsahuje body a osu. Průměry přidají points()
# a segments(). Oranžový rozdíl je součet koeficientů pohlavisamec
# a formaoranžová:pohlavisamec.
#
# Interpretace:
# Které pohlaví má vyšší průměr v každé formě? Vysvětlete zápornou
# hodnotu −4,842 mm jako změnu rozdílu, ne jako délku jedné skupiny.


#----------------------------------------------------------#
# Závěrečný biologický výklad -----
#----------------------------------------------------------#

# Model se dvěma skupinovými prediktory má jeden odhadovaný průměr pro
# každou kombinaci. predict() s interval = "confidence" přidá interval
# spolehlivosti pro průměr skupiny. Reziduum je u každého kraba rozdíl
# mezi jeho naměřenou délkou a odhadnutým průměrem jeho skupiny.
# Funkce confint() vrátí intervaly spolehlivosti koeficientů modelu.


#----------------------------------------#
### Úloha | L08-U08 -----
#----------------------------------------#

# Zadání:
# Nejdříve přidejte do data_krabi residuum_mm z mod_formy. Potom
# zkopírujte připravený kód pod "Vaše řešení". Pomocí mod_formy
# předpovězte pro data_ctyri čtyři průměry a jejich 95% intervaly
# spolehlivosti a výsledek uložte jako mat_predikce_ctyri. Na sloupec
# residuum_mm každého ze čtyř připravených
# datových rámců samostatně zavolejte summary().
#
# data_ctyri <- expand.grid(
#   pohlavi = levels(data_krabi$pohlavi),
#   forma = levels(data_krabi$forma)
# )
#
# data_modra_samice <- data_krabi[
#   data_krabi$forma == "modrá" & data_krabi$pohlavi == "samice",
# ]
# data_modra_samec <- data_krabi[
#   data_krabi$forma == "modrá" & data_krabi$pohlavi == "samec",
# ]
# data_oranzova_samice <- data_krabi[
#   data_krabi$forma == "oranžová" & data_krabi$pohlavi == "samice",
# ]
# data_oranzova_samec <- data_krabi[
#   data_krabi$forma == "oranžová" & data_krabi$pohlavi == "samec",
# ]
#
# Nakonec napište dvě až tři věty, které:
# - porovnají pohlaví zvlášť v každé barevné formě;
# - uvedou nejistotu změny rozdílu pomocí confint(mod_formy);
# - omezí závěr na asociaci v pozorovaných datech.

# Vaše řešení:


# Biologický závěr:
#

# Očekávaný výsledek:
# Předpovědi jsou stejné jako čtyři skupinové průměry z L08-U07.
# Přibližné 95% intervaly jsou: modrá samice 26,229–29,975 mm;
# modrý samec 30,141–33,887 mm; oranžová samice 32,745–36,491 mm;
# oranžový samec 31,815–35,561 mm.
# Rezidua mají v každé skupině průměr velmi blízký nule, ale ukazují
# výraznou variabilitu jednotlivých krabů. 95% interval interakčního
# koeficientu je přibližně −8,589 až −1,095 mm.
#
# Nápověda 1:
# Předpovědi popisují průměry kombinací, zatímco rezidua ukazují
# rozptýlení jednotlivých krabů kolem těchto průměrů.
#
# Nápověda 2:
# První argument expand.grid() se mění nejrychleji, proto připravené řádky
# odpovídají pořadí z L08-U07. V confint(mod_formy) vyberte řádek
# interakčního členu.
#
# Interpretace:
# Proč věta "samci jsou delší" není pro tento model úplným závěrem?
# Kterou podmínku musíme vždy doplnit?


#----------------------------------------------------------#
# Úlohy navíc -----
#----------------------------------------------------------#

# Tyto úlohy jsou pro rychlejší skupiny a pozdější procvičení.
# Nedokončené úlohy navíc neznamenají, že jste nesplnili praktikum.


#----------------------------------------#
### Úloha navíc | L08-N01 -----
#----------------------------------------#

# Zadání:
# Pokud máte nainstalovaný balíček emmeans, použijte funkce s prefixem emmeans::
# - emmeans::emtrends() pro sklony pohlaví v mod_interakce;
# - emmeans::emmeans() pro předpovědi pohlaví při 30 mm;
# - emmeans::contrast() pro rozdíl samec − samice při 30 mm;
# - emmeans::emmeans() pro čtyři skupiny v mod_formy.
#
# Pokud requireNamespace("emmeans", quietly = TRUE) vrátí FALSE,
# tuto dobrovolnou úlohu přeskočte.

# Vaše řešení:


# Očekávaný výsledek:
# Sklony jsou přibližně 0,4067 pro samice a 0,2823 pro samce.
# Předpovědi, kontrast při 30 mm a čtyři skupinové průměry se shodují
# s výsledky hlavních úloh v mezích zaokrouhlení.
#
# Nápověda 1:
# Pro sklon určete proměnnou argumentem var. Pro porovnání při konkrétní
# délce nejprve vytvořte odhady při této délce.
#
# Nápověda 2:
# V emtrends() použijte specs = ~ pohlavi. V emmeans() použijte
# at = list(delka_krunyre_mm = 30); kontrast "samec - samice" má váhy
# c(-1, 1).
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


# Očekávaný výsledek:
# Názvy a hodnoty koeficientů se změní, protože nyní přímo popisují
# samce a rozdíly samice − samec. Odhadnuté hodnoty zůstanou stejné
# a all.equal() vrátí TRUE.
#
# Nápověda 1:
# Změna reference mění způsob popisu stejné dvojice přímek.
#
# Nápověda 2:
# Referenční úroveň nastaví relevel() s ref = "samec". Potom odhadněte
# nový lm() na upravené kopii dat.
#
# Interpretace:
# Které části závěru závisejí na referenční úrovni a které biologické
# předpovědi na ní nezávisejí?


#----------------------------------------#
### Úloha navíc | L08-N03 -----
#----------------------------------------#

# Zadání:
# Přeneste postup z L08-U02 až L08-U06 na otázku, zda se vztah délky
# krunýře a hloubky těla u modrých krabů liší mezi pohlavími.
# Nakreslete data, odhadněte interakční model, zobrazte předpovězené
# přímky a interpretujte interakční koeficient.

# Vaše řešení:


# Očekávaný výsledek:
# Model má vzorec hloubka_tela_mm ~ delka_krunyre_mm * pohlavi.
# Interakční koeficient je záporný, přibližně −0,0255 mm/mm, takže
# odhadnutý sklon samců je menší než odhadnutý sklon samic.
#
# Nápověda 1:
# Mění se pouze odezva; prediktory, faktorové reference a logika
# interpretace zůstávají stejné.
#
# Nápověda 2:
# Nahraďte zadni_sirka_mm proměnnou hloubka_tela_mm ve vzorci i na ose y.
# Sklon samců opět získáte součtem hlavního a interakčního koeficientu.
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


# Očekávaný výsledek:
# Každá oprava musí doplnit potřebnou hodnotu nebo skupinu druhého
# prediktoru. U tvrzení B rozlište sklon a rozdíl sklonů. U tvrzení D
# použijte jazyk asociace a připomeňte pozorovací původ dat.
#
# Nápověda 1:
# V modelu s interakcí nejsou hlavní efekty obecnými výroky pro všechny
# hodnoty druhého prediktoru.
#
# Nápověda 2:
# Zkontrolujte postupně referenční délku, oba odhadnuté sklony, barevnou
# formu a rozdíl mezi asociací a příčinou.
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


# Očekávaný výsledek:
# data_oranzovi obsahuje 100 krabů. Graf ukazuje rostoucí vztah u obou
# pohlaví a částečný překryv jejich hodnot. Koeficienty jsou přibližně 1,2244;
# 0,3932; 1,4225 a −0,1078. Sklon samic je 0,3932 mm/mm, sklon samců
# přibližně 0,2854 mm/mm a rozdíl samec − samice při 30 mm je přibližně
# −1,8108 mm.
#
# Nápověda 1:
# Zachovejte stejné referenční pohlaví a stejný postup jako pro modrou
# formu. Sklon samců i rozdíl při 30 mm skládáte ze dvou koeficientů.
#
# Nápověda 2:
# Sklon samců je delka_krunyre_mm +
# delka_krunyre_mm:pohlavisamec. Rozdíl při 30 mm je pohlavisamec +
# 30 * delka_krunyre_mm:pohlavisamec.
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


# Očekávaný výsledek:
# Přímky se protínají přibližně při 15,854 mm. Společný pozorovaný
# rozsah obou pohlaví je 16,1 až 40,9 mm, takže průsečík leží těsně
# mimo něj.
#
# Nápověda 1:
# Nejprve určete průnik dvou rozsahů: větší minimum a menší maximum.
# Potom posuďte, zda vypočtená délka patří do tohoto intervalu.
#
# Nápověda 2:
# Z coef(mod_interakce) vyberte pojmenované prvky pohlavisamec a
# delka_krunyre_mm:pohlavisamec a dosaďte je do připraveného vztahu.
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
# unname(mat_predikce_ctyri[, "fit"]).

# Vaše řešení:


# Očekávaný výsledek:
# Čtyři hodnoty jsou 28,102; 32,014; 34,618 a 33,688 mm.
# Předepsané porovnání s fit sloupcem mat_predikce_ctyri vrátí TRUE.
#
# Nápověda 1:
# Každá nereferenční úroveň přidává svůj koeficient. U kombinace obou
# nereferenčních úrovní se přidává také interakční koeficient.
#
# Nápověda 2:
# Uložte coef(mod_formy) do vec_koeficienty_formy a vybírejte jeho
# prvky podle názvů. Pro porovnání vyberte z mat_predikce_ctyri pouze
# sloupec "fit" a na obou stranách použijte unname().
#
# Interpretace:
# Proč interakční koeficient sám o sobě není průměrem oranžových samců?


#----------------------------------------#
### Úloha navíc | L08-N08 -----
#----------------------------------------#

# Zadání:
# Zobrazte všech 200 reziduí modelu mod_formy ve čtyřech skupinách.
# Vytvořte stejné pořadí faktoru skupina jako v L08-U07, nastavte
# set.seed(900723) a vodorovně posuňte číselné pozice pomocí jitter().
# Nakreslete residuum_mm proti těmto pozicím, pohlaví vyjádřete barvou
# i symbolem, popište čtyři skupiny na ose x a přidejte vodorovnou
# přerušovanou čáru v nule.

# Vaše řešení:


# Očekávaný výsledek:
# Graf ukazuje 50 reziduí v každé skupině. Body jsou rozptýlené kolem
# nuly; průměr reziduí v každé skupině je numericky velmi blízký nule.
# Jednotliví krabi se však od skupinových průměrů výrazně odchylují.
#
# Nápověda 1:
# Použijte strukturu čtyřskupinového grafu z L08-U07. Změní se pouze
# svislá proměnná a její popisek; přibude nulová čára.
#
# Nápověda 2:
# Na ose y použijte data_krabi$residuum_mm. Nulovou čáru přidá
# abline(h = 0, lty = 2).
#
# Interpretace:
# Jaký rozdíl je mezi čtyřmi odhadovanými průměry a rozptylem reziduí
# jednotlivých krabů kolem těchto průměrů?

#----------------------------------------------------------#
# Shrnutí a sebekontrola -----
#----------------------------------------------------------#

# Dokážu vlastními slovy vysvětlit:
# - proč x * y zapisuje x + y + x:y;
# - proč jsou hlavní koeficienty v modelu s interakcí podmíněné;
# - jak z předpovědí porovnám dvě skupiny při stejné hodnotě prediktoru;
# - proč je interakce dvou faktorů rozdílem dvou rozdílů;
# - co ukazují rezidua a proč pozorovací model nedokládá příčinu.
#
# Pokud některý bod ještě neumíte vysvětlit bez pohledu do skriptu,
# vraťte se k úloze, kde jste jej poprvé použili.
