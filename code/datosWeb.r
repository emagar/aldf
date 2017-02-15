#setwd("c:/data/rollcall/aldf")
setwd("d:/01/Dropbox/data/rollcall/aldf")
#setwd("~/Dropbox/data/rollcall/aldf")
#setwd("c:/Documents and Settings/emagarm/Mis documentos/My Dropbox/data/rollcall/aldf")
rm(list = ls())
#
# LA INFO ESTA GUARDADA EN EL ARCHIVO rawvote3aSesion.txt
# EN EL RENGLON PREVIO A LA FECHA QUE INDICA EL INICIO DE UNA NUEVA SESION HAY QUE PEGAR A MANO newSession
# EN EL RENGLON PREVIO A CADA VOTACION NOMINAL HAY QUE PEGAR A MANO newRollCall
#
id <- c("mr01p", "mr01s", "mr02p", "mr02s", "mr03p", "mr03s",
"mr04p", "mr04s", "mr05p", "mr05s", "mr06p", "mr06s", "mr07p",
"mr07s", "mr08p", "mr08s", "mr09p", "mr09s", "mr10p", "mr10s",
"mr11p", "mr11s", "mr12p", "mr12s", "mr13p", "mr13s", "mr14p",
"mr14s", "mr15p", "mr15s", "mr16p", "mr16s", "mr17p", "mr17s",
"mr18p", "mr18s", "mr19p", "mr19s", "mr20p", "mr20s", "mr21p",
"mr21s", "mr22p", "mr22s", "mr23p", "mr23s", "mr24p", "mr24s",
"mr25p", "mr25s", "mr26p", "mr26s", "mr27p", "mr27s", "mr28p",
"mr28s", "mr29p", "mr29s", "mr30p", "mr30s", "mr31p", "mr31s",
"mr32p", "mr32s", "mr33p", "mr33s", "mr34p", "mr34s", "mr35p",
"mr35s", "mr36p", "mr36s", "mr37p", "mr37s", "mr38p", "mr38s",
"mr39p", "mr39s", "mr40p", "mr40s", "rp01p", "rp01s", "rp02p",
"rp02s", "rp03p", "rp03s", "rp04p", "rp04s", "rp05p", "rp05s",
"rp06p", "rp06s", "rp07p", "rp07s", "rp08p", "rp08s", "rp09p",
"rp09s", "rp10p", "rp10s", "rp11p", "rp11s", "rp12p", "rp12s",
"rp13p", "rp13s", "rp14p", "rp14s", "rp15p", "rp15s", "rp16p",
"rp16s", "rp17p", "rp17s", "rp18p", "rp18s", "rp19p", "rp19s",
"rp20p", "rp20s", "rp21p", "rp21s", "rp22p", "rp22s", "rp23p",
"rp23s", "rp24p", "rp24s", "rp25p", "rp25s", "rp26p", "rp26s")
#
longNames <- c(
"Ramón Jiménez López",         ## RamónJiménezLópez
"Eleazar Rubio",               ## EleazarRubioAldarán
"Antonio Lima",                ## AntonioLimaBarrios
"Rocío Zúñiga",                ## RocíoAiméZúñigaOrtiz
"Enrique Vargas",              ## EnriqueVargasAnaya
"Oscar Romero",                ## OscarRomeroLópez
"Isaías Villa",                ## IsaíasVillaGonzález
"Aarón Romero",                ## AarónRomeroMaldonado
"Balfre Vargas",               ## BalfreVargasCortés
"Máximo Cerón",                ## MáximoJustinoCerónMartínez
"Juan Bustos",                 ## JuanBustosPascual
"Patricio Avila",              ## PatricioAvilaLuna
"Nazario Norberto",            ## NazarioNorbertoSánchez
"Javier Martínez",             ## JavierMartínezSolano
"Imelda Mendoza",              ## ImeldaMendozaRomero
"Edgar Torres Baltazar",       ## EdgarTorresBaltazar
"Cristóbal Ramírez",           ## JoséCristóbalRamírezPino
"Rodrigo Ugalde",              ## RodrigoUgaldeMolina
"Tomás Pliego",                ## TomásPliegoCalvo
"Arturo Zamora",               ## ArturoZamoraFlores
"Esthela Damián",              ## EsthelaDamiánPeralta
"Maricela Sánchez",            ## MaricelaSánchezCabrera
"Laura Piña",                  ## LauraPiñaOlmedo
"Lidia Hernández",             ## MaríaLidiaHernándezCastilla
"Agustín Guerrero",            ## AgustínGuerreroCastillo
"Ricardo González",            ## RicardoGonzálezdelAngel
"Margarita Martínez",          ## MargaritaMaríaMartínezFisher
"Arne Aus Den Ruthen",         ## ArneSidneyAusDenRuthen
"Daniel Ordóñez",              ## DanielOrdóñezHernández
"Manuel Orozco",               ## JuanManuelOrozcoCarmona
"Ricardo Benito",              ## AntonioLeónRicardoBenito
"Arturo Reséndiz",             ## ReséndizMartínezArturo
"José Zepeda",                 ## JoséAntonioZepedaSegura
"Carolina Rebollo",            ## CarolinaRebolloAguilar
"Ricardo García Hernández",    ## JuanRicardoGarcíaHernández
"Carlos Coronado",             ## CarlosCoronadoOrtiz
"Elba Garfias",                ## MaríaElbaGarfiasMaldonado
"Hilario Nolasco",             ## HilarioNolascoOchoa
"Alfredo Vinalay",             ## AlfredoVinalayMora
"María Arronte",               ## MaríadelosÁngelesArronteOlguín
"Alejandro Ramírez Rodríguez", ## RaúlAlejandroCuauhtémocRamírezRodríguez
"Andrea Ortega",               ## AndreaOrtegaGonzález
"Víctor Hugo Círigo",          ## VíctorHugoCírigoVázquez
"Maribel Zamora",              ## MaribelZamoraGranados
"Daniel Salazar",              ## DanielSalazarNúñez
"Abril Trujillo",              ## AbrilJaneteTrujilloVázquez
"Sergio Cedillo",              ## SergioMiguelCedilloFernández
"Jaime Jiménez",               ## JaimeJiménezBurgos
"Humberto Morgan",             ## HumbertoMorganColón
"Eduardo Rocha",               ## LuisEduardoRochaCruz
"Arturo Santana",              ## ArturoSantanaAlfaro
"Natividad Patricio",          ## MaríaNatividadPatricioRazo
"Ezequiel Rétiz",              ## EzequielRétizGutiérrez
"Cecilia Martínez",            ## EmmaCeciliaMartínezCapaceta
"Juan Beltrán",                ## JuanCarlosBeltránCordero
"María Méndez",                ## MaríadeLourdesMéndezGalván
"Samuel Hernández",            ## SamuelHernándezAbarca
"Margarito Reyes",             ## MargaritoReyesAguirre
"Mauricio Toledo",             ## MauricioAlonsoToledoGutiérrez
"Miguel Hernández",            ## MiguelAngelHernándezHernández
"Miguel Sosa",                 ## MiguelSosaTan
"Juan Trillo",                 ## JuanCarlosTrilloDomínguez
"José Morúa",                  ## JoséLuisMorúaJasso
"José Hernández",              ## JoséAlfredoHernándezLeal
"Leticia Quezada",             ## LeticiaQuezadaContreras
"Iliana Araiza",               ## IlianaAraizaMota
"Sergio Avila",                ## SergioAvilaRojas
"Miriam Gómez",                ## MiriamRosarioGómezValenzuela
"Edy Ortiz",                   ## EdyOrtizPiña
"Angelina Hernández",          ## AngelinaHernández
"Nancy Cárdenas",              ## NancyCárdenasSánchez
"Juan Carlos Hernández",       ## JuanCarlosHernándezValentín
"Hipólito Bravo",              ## HipólitoBravoLópez
"José Luis Mechgún",           ## JoséLuisMechgúnGonzález
"Salvador Martínez",           ## SalvadorPabloMartínezDellaRocca
"Inti Muñoz",                  ## IntiMuñozSantini
"Avelino Méndez Rangel",       ## AvelinoMéndezRangel
"Martín Rosales",              ## MartínRosalesRomero
"Hernández Mirón",             ## CarlosHernándezMirón
"Jesús Esquivel",              ## JesúsEsquivelCarrillo
"López Rabadán Kenia",         ## KeniaLópezRabadán
"Orlando Anaya",               ## OrlandoAnayaGonzález
"Carmen Segura",               ## MaríadelCarmenSeguraRangel
"Raúl Herrera",                ## RaúlHerreraEspinosa
"Jorge Triana",                ## JorgeTrianaTena
"Yesenia Villaluz",            ## YeseniaVillaluzAlba
"Miguel Hernández Labastida",  ## MiguelRamónHernándezLabastida
"José Álvarez",                ## JoséHiramÁlvarezEscudero
"Miguel Angel Errasti",        ## MiguelAngelErrastiArango
"Cecilia Mendoza",             ## CeciliaMendozaBautista
"Celina Saavedra",             ## CelinaSaavedraOrtega
"Francisco Santibáñez",        ## FranciscoSantibáñezCalzadilla
"Agustín Castilla",            ## AgustínCarlosCastillaMarroquín
"Mara Rivera",                 ## MaradelSocorroRiveraHernández
"Daniel Armas",                ## AldoDanielArmasPluma
"Elvira Murillo",              ## ElviraMurilloMendoza
"María Quiñónez",              ## MaríadelaPazQuiñónezCornejo
"Guillermo Torres",            ## GuillermodeJesúsTorresQuiroz
"Jorge Romero",                ## JorgeRomeroHerrera
"Fernanda Verderi",            ## FernandaVerderiMuñúzuri
"Daniel Ramírez del Valle",    ## DanielRamírezdelValle
"Brenda Ruiz",                 ## BrendaFabiolaRuizAguilar
"Paula Soto",                  ## PaulaAdrianaSotoMaldonado
"Fernando Cuevas",             ## FernandoCuevasMoranchel
"Jacobo Bonilla",              ## JacoboManfredoBonillaCedillo
"Lorena Núñez",                ## LorenaNúñezLópez
"Federico Schiaffino",         ## JorgeFedericoSchiaffinoIsunza
"Alicia Téllez",               ## AliciaVirginiaTéllezSánchez
"Carmen Peralta",              ## MaríadelCarmenPeraltaVaqueiro
"José Antonio Arzate",         ## JoséAntonioArzateFlores
"Carlos Olavarrieta",          ## MartínCarlosOlavarrietaMaldonado
"Sergio Jiménez",              ## SergioJiménezBarros
"Leonardo Álvarez",            ## LeonardoÁlvarezRomo
"José Peña",                   ## JoséFernandoPeñaGaravito
"Marco García",                ## MarcoAntonioGarcíaAyala
"Silvia Gazcón",               ## SilviaElenaGazcónLópezCano
"Ana Luisa Alvarado",          ## AnaLuisaAlvaradoVillazón
"Francisco Alvarado",          ## FranciscoJavierAlvaradoVillazón
"Tonatiuh González",           ## ArmandoTonatiuhGonzálezCase
"Diego Valdez",                ## DiegoValdezMedina
"Isabel Cañizo",               ## GloriaIsabelCañizoCuevas
"María Kuri",                  ## MaríadelasMercedesKuriLorenzo
"Fernando Espino",             ## FernandoEspinoArévalo
"María García",                ## MaríaEnriquetaGarcíaVillarreal
"Xiuh Tenorio",                ## XiuhGuillermoTenorioAntiga
"Oscar Hernández",             ## OscarHernándezSalgado
"Rebeca Parada",               ## RebecaParadaOrtega
"Leonardo Macareno",           ## LeonardoMacarenoMejía
"Jorge Díaz",                  ## JorgeCarlosDíazCuervo
"Carla Sánchez Armas",         ## CarlaAlejandraSánchezArmasGarcía
"Enrique Pérez Correa",        ## EnriquePérezCorrea
"Carlos Gómez")                ## CarlosMauricioGómezGómez
#
shortNames <- c(
"Jiménez",          ## RamónJiménezLópez
"Rubio",            ## EleazarRubioAldarán
"Lima",             ## AntonioLimaBarrios
"Zúñiga",           ## RocíoAiméZúñigaOrtiz
"E Vargas",         ## EnriqueVargasAnaya
"Romero",           ## OscarRomeroLópez
"Villa",            ## IsaíasVillaGonzález
"Romero",           ## AarónRomeroMaldonado
"B Vargas",         ## BalfreVargasCortés
"Cerón",            ## MáximoJustinoCerónMartínez
"Bustos",           ## JuanBustosPascual
"Avila",            ## PatricioAvilaLuna
"Norberto",         ## NazarioNorbertoSánchez
"J Martínez",       ## JavierMartínezSolano
"Mendoza",          ## ImeldaMendozaRomero
"Torres",           ## EdgarTorresBaltazar
"Ramírez",          ## JoséCristóbalRamírezPino
"Ugalde",           ## RodrigoUgaldeMolina
"Pliego",           ## TomásPliegoCalvo
"Zamora",           ## ArturoZamoraFlores
"Damián",           ## EsthelaDamiánPeralta
"Sánchez",          ## MaricelaSánchezCabrera
"Piña",             ## LauraPiñaOlmedo
"Hernández",        ## MaríaLidiaHernándezCastilla
"Guerrero",         ## AgustínGuerreroCastillo
"González",         ## RicardoGonzálezdelAngel
"M Martínez",       ## MargaritaMaríaMartínezFisher
"Aus Den Ruthen",   ## ArneSidneyAusDenRuthen
"Ordóñez",          ## DanielOrdóñezHernández
"Orozco",           ## JuanManuelOrozcoCarmona
"Ricardo",          ## AntonioLeónRicardoBenito
"Martínez",         ## ReséndizMartínezArturo
"Zepeda",           ## JoséAntonioZepedaSegura
"Rebollo",          ## CarolinaRebolloAguilar
"García",           ## JuanRicardoGarcíaHernández
"Coronado",         ## CarlosCoronadoOrtiz
"Garfias",          ## MaríaElbaGarfiasMaldonado
"Nolasco",          ## HilarioNolascoOchoa
"Vinalay",          ## AlfredoVinalayMora
"Arronte",          ## MaríadelosÁngelesArronteOlguín
"Ramírez",          ## RaúlAlejandroCuauhtémocRamírezRodríguez
"Ortega",           ## AndreaOrtegaGonzález
"Círigo",           ## VíctorHugoCírigoVázquez
"Zamora",           ## MaribelZamoraGranados
"Salazar",          ## DanielSalazarNúñez
"Trujillo",         ## AbrilJaneteTrujilloVázquez
"Cedillo",          ## SergioMiguelCedilloFernández
"Jiménez",          ## JaimeJiménezBurgos
"Morgan",           ## HumbertoMorganColón
"Rocha",            ## LuisEduardoRochaCruz
"Santana",          ## ArturoSantanaAlfaro
"Patricio",         ## MaríaNatividadPatricioRazo
"Rétiz",            ## EzequielRétizGutiérrez
"Martínez",         ## EmmaCeciliaMartínezCapaceta
"Beltrán",          ## JuanCarlosBeltránCordero
"Méndez",           ## MaríadeLourdesMéndezGalván
"Hernández",        ## SamuelHernándezAbarca
"Reyes",            ## MargaritoReyesAguirre
"Toledo",           ## MauricioAlonsoToledoGutiérrez
"Hernández",        ## MiguelAngelHernándezHernández
"Sosa",             ## MiguelSosaTan
"Trillo",           ## JuanCarlosTrilloDomínguez
"Morúa",            ## JoséLuisMorúaJasso
"Hernández",        ## JoséAlfredoHernándezLeal
"Quezada",          ## LeticiaQuezadaContreras
"Araiza",           ## IlianaAraizaMota
"Avila",            ## SergioAvilaRojas
"Gómez",            ## MiriamRosarioGómezValenzuela
"Ortiz",            ## EdyOrtizPiña
"Hernández",        ## AngelinaHernández
"Cárdenas",         ## NancyCárdenasSánchez
"Hernández",        ## JuanCarlosHernándezValentín
"Bravo",            ## HipólitoBravoLópez
"Mechgún",          ## JoséLuisMechgúnGonzález
"Martínez",         ## SalvadorPabloMartínezDellaRocca
"Muñoz",            ## IntiMuñozSantini
"Méndez",           ## AvelinoMéndezRangel
"Rosales",          ## MartínRosalesRomero
"Hernández",        ## CarlosHernándezMirón
"Esquivel",         ## JesúsEsquivelCarrillo
"López",            ## KeniaLópezRabadán
"Anaya",            ## OrlandoAnayaGonzález
"Segura",           ## MaríadelCarmenSeguraRangel
"Herrera",          ## RaúlHerreraEspinosa
"Triana",           ## JorgeTrianaTena
"Villaluz",         ## YeseniaVillaluzAlba
"Hernández",        ## MiguelRamónHernándezLabastida
"Álvarez",          ## JoséHiramÁlvarezEscudero
"Errasti",          ## MiguelAngelErrastiArango
"Mendoza",          ## CeciliaMendozaBautista
"Saavedra",         ## CelinaSaavedraOrtega
"Santibáñez",       ## FranciscoSantibáñezCalzadilla
"Castilla",         ## AgustínCarlosCastillaMarroquín
"Rivera",           ## MaradelSocorroRiveraHernández
"Armas",            ## AldoDanielArmasPluma
"Murillo",          ## ElviraMurilloMendoza
"Quiñónez",         ## MaríadelaPazQuiñónezCornejo
"Torres",           ## GuillermodeJesúsTorresQuiroz
"Romero",           ## JorgeRomeroHerrera
"Verderi",          ## FernandaVerderiMuñúzuri
"Ramírez",          ## DanielRamírezdelValle
"Ruiz",             ## BrendaFabiolaRuizAguilar
"Soto",             ## PaulaAdrianaSotoMaldonado
"Cuevas",           ## FernandoCuevasMoranchel
"Bonilla",          ## JacoboManfredoBonillaCedillo
"Núñez",            ## LorenaNúñezLópez
"Schiaffino",       ## JorgeFedericoSchiaffinoIsunza
"Téllez",           ## AliciaVirginiaTéllezSánchez
"Peralta",          ## MaríadelCarmenPeraltaVaqueiro
"Arzate",           ## JoséAntonioArzateFlores
"Olavarrieta",      ## MartínCarlosOlavarrietaMaldonado
"Jiménez",          ## SergioJiménezBarros
"Álvarez",          ## LeonardoÁlvarezRomo
"Peña",             ## JoséFernandoPeñaGaravito
"García",           ## MarcoAntonioGarcíaAyala
"Gazcón",           ## SilviaElenaGazcónLópezCano
"Alvarado",         ## AnaLuisaAlvaradoVillazón
"Alvarado",         ## FranciscoJavierAlvaradoVillazón
"González",         ## ArmandoTonatiuhGonzálezCase
"Valdez",           ## DiegoValdezMedina
"Cañizo",           ## GloriaIsabelCañizoCuevas
"Kuri",             ## MaríadelasMercedesKuriLorenzo
"Espino",           ## FernandoEspinoArévalo
"García",           ## MaríaEnriquetaGarcíaVillarreal
"Tenorio",          ## XiuhGuillermoTenorioAntiga
"Hernández",        ## OscarHernándezSalgado
"Parada",           ## RebecaParadaOrtega
"Macareno",         ## LeonardoMacarenoMejía
"Díaz",             ## JorgeCarlosDíazCuervo
"Sánchez",          ## CarlaAlejandraSánchezArmasGarcía
"Pérez",            ## EnriquePérezCorrea
"Gómez")            ## CarlosMauricioGómezGómez
#
part <- c("prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "pan", "pan", "prd", "prd", "prd", "prd", "pan", "pan",
"pt", "pt", "prd", "prd", "pan", "pan", "pri-uc", "pri-uc",
"prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "pan", "pan", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd", "prd",
"prd", "prd", "pan", "pan", "pan", "pan", "pan", "pan", "pan",
"pan", "pan", "pan", "pan", "pan", "pan", "pan", "pan", "pan",
"pan", "pan", "pan", "pan", "pan", "pan", "pan", "pan", "pan",
"pan", "pri", "pri", "pri-uc", "pri-uc", "pri", "pri",
"pri-uc", "pri-uc", "pri", "pri", "pri-uc", "pri-uc", "pri",
"pri", "panal", "panal", "panal", "panal", "panal", "panal",
"panal", "panal", "psd", "psd", "psd", "psd")
#

file <- file("rawvote3aSesion.txt",open="r")
rawData <- readLines(file)
close(file)
rawData <- append(rawData,"--- T H E   E N D ---")
#
##where in rawData are sessions
marker<-c("[Nn]ew[Ss]ession")
sessionStart<-grep(marker,rawData)
sessionEnd <- c(sessionStart[2:length(sessionStart)],length(rawData))
Nsess <- length(sessionStart)
sessionDate <- rep(NA,Nsess)
for (s in 1:Nsess){
    sessionDate[s]<-rawData[sessionStart[s]+1]
    }
for (s in 1:Nsess){
    sessionDate[s]<-gsub(sessionDate[s],
    pattern="([0-9]{1,2}[/]{1}[0-9]{1,2}[/]{1}[0-9]{2,4}).*",
    replacement="\\1")
    }
tmp<-rep(NA,times=Nsess); yr<-tmp; mo<-tmp; dy<-tmp
for (s in 1:Nsess){
yr[s]<-as.numeric(gsub(sessionDate[s],
    pattern="([0-9]{1,2})/([0-9]{1,2})/([0-9]{2,4})",
    replacement="\\3"))
mo[s]<-as.numeric(gsub(sessionDate[s],
    pattern="([0-9]{1,2})/([0-9]{1,2})/([0-9]{2,4})",
    replacement="\\2"))
dy[s]<-as.numeric(gsub(sessionDate[s],
    pattern="([0-9]{1,2})/([0-9]{1,2})/([0-9]{2,4})",
    replacement="\\1"))
    }
#
sessSummary <- data.frame( yr=yr, mo=mo, dy=dy, NRCs=rep(NA,Nsess), dhasRCs=rep(NA,Nsess) )
#
## SESSIONS WITH AND W/O ROLL CALL VOTES
for(s in 1:Nsess){
    marker<-c("[Nn]ew[Rr]oll[Cc]all")
    thisSess <- rawData[sessionStart[s]:sessionEnd[s]]
    rcStart<-grep(marker,thisSess)
    rcEnd <- c(rcStart[2:length(rcStart)],length(thisSess))
    sessSummary$NRCs[s] <- ifelse ( length(rcStart)>0, length(rcStart), 0 )
    sessSummary$dhasRCs[s] <- ifelse ( length(rcStart)>0, 1, 0 )
}
#
sessWithRCs <- grep(1,sessSummary$dhasRCs) ## SESSION LOOP HAS TO ITERATE ON THIS SUBSET ONLY
#
# frame to receive roll calls
##DROPtmp <- rep(NA, times=sum(sessSummary$NRCs))
RCs <- data.frame(folio=0,yr=0,mo=0,dy=0,favor=0,contra=0,absten=0,dunan=0,
mr01p=0, mr01s=0, mr02p=0, mr02s=0, mr03p=0, mr03s=0, mr04p=0, mr04s=0, mr05p=0, mr05s=0,
mr06p=0, mr06s=0, mr07p=0, mr07s=0, mr08p=0, mr08s=0, mr09p=0, mr09s=0, mr10p=0, mr10s=0,
mr11p=0, mr11s=0, mr12p=0, mr12s=0, mr13p=0, mr13s=0, mr14p=0, mr14s=0, mr15p=0, mr15s=0,
mr16p=0, mr16s=0, mr17p=0, mr17s=0, mr18p=0, mr18s=0, mr19p=0, mr19s=0, mr20p=0, mr20s=0,
mr21p=0, mr21s=0, mr22p=0, mr22s=0, mr23p=0, mr23s=0, mr24p=0, mr24s=0, mr25p=0, mr25s=0,
mr26p=0, mr26s=0, mr27p=0, mr27s=0, mr28p=0, mr28s=0, mr29p=0, mr29s=0, mr30p=0, mr30s=0,
mr31p=0, mr31s=0, mr32p=0, mr32s=0, mr33p=0, mr33s=0, mr34p=0, mr34s=0, mr35p=0, mr35s=0,
mr36p=0, mr36s=0, mr37p=0, mr37s=0, mr38p=0, mr38s=0, mr39p=0, mr39s=0, mr40p=0, mr40s=0,
rp01p=0, rp01s=0, rp02p=0, rp02s=0, rp03p=0, rp03s=0, rp04p=0, rp04s=0, rp05p=0, rp05s=0,
rp06p=0, rp06s=0, rp07p=0, rp07s=0, rp08p=0, rp08s=0, rp09p=0, rp09s=0, rp10p=0, rp10s=0,
rp11p=0, rp11s=0, rp12p=0, rp12s=0, rp13p=0, rp13s=0, rp14p=0, rp14s=0, rp15p=0, rp15s=0,
rp16p=0, rp16s=0, rp17p=0, rp17s=0, rp18p=0, rp18s=0, rp19p=0, rp19s=0, rp20p=0, rp20s=0,
rp21p=0, rp21s=0, rp22p=0, rp22s=0, rp23p=0, rp23s=0, rp24p=0, rp24s=0, rp25p=0, rp25s=0,
rp26p=0, rp26s=0)
#
##where in session are roll call votes

for (s in sessWithRCs){
#s <- 39
    marker<-c("[Nn]ew[Rr]oll[Cc]all")
    thisSess <- rawData[sessionStart[s]:sessionEnd[s]]
    rcStart<-grep(marker,thisSess)
    rcEnd <- c(rcStart[2:length(rcStart)],length(thisSess))
    if (length(rcStart)==1) rcEnd<-length(thisSess) else rcEnd <- c(rcStart[2:length(rcStart)],length(thisSess))
    NumMariel <- as.numeric(thisSess[rcStart+1])
    Nrc <- length(rcStart)
    tmp<-rep(NA,times=Nrc)
    sessRCs <- data.frame(folio=NumMariel,yr=yr[s],mo=mo[s],dy=dy[s],favor=tmp,contra=tmp,absten=tmp,dunan=tmp,
    mr01p=tmp, mr01s=tmp, mr02p=tmp, mr02s=tmp, mr03p=tmp, mr03s=tmp, mr04p=tmp, mr04s=tmp, mr05p=tmp, mr05s=tmp,
    mr06p=tmp, mr06s=tmp, mr07p=tmp, mr07s=tmp, mr08p=tmp, mr08s=tmp, mr09p=tmp, mr09s=tmp, mr10p=tmp, mr10s=tmp,
    mr11p=tmp, mr11s=tmp, mr12p=tmp, mr12s=tmp, mr13p=tmp, mr13s=tmp, mr14p=tmp, mr14s=tmp, mr15p=tmp, mr15s=tmp,
    mr16p=tmp, mr16s=tmp, mr17p=tmp, mr17s=tmp, mr18p=tmp, mr18s=tmp, mr19p=tmp, mr19s=tmp, mr20p=tmp, mr20s=tmp,
    mr21p=tmp, mr21s=tmp, mr22p=tmp, mr22s=tmp, mr23p=tmp, mr23s=tmp, mr24p=tmp, mr24s=tmp, mr25p=tmp, mr25s=tmp,
    mr26p=tmp, mr26s=tmp, mr27p=tmp, mr27s=tmp, mr28p=tmp, mr28s=tmp, mr29p=tmp, mr29s=tmp, mr30p=tmp, mr30s=tmp,
    mr31p=tmp, mr31s=tmp, mr32p=tmp, mr32s=tmp, mr33p=tmp, mr33s=tmp, mr34p=tmp, mr34s=tmp, mr35p=tmp, mr35s=tmp,
    mr36p=tmp, mr36s=tmp, mr37p=tmp, mr37s=tmp, mr38p=tmp, mr38s=tmp, mr39p=tmp, mr39s=tmp, mr40p=tmp, mr40s=tmp,
    rp01p=tmp, rp01s=tmp, rp02p=tmp, rp02s=tmp, rp03p=tmp, rp03s=tmp, rp04p=tmp, rp04s=tmp, rp05p=tmp, rp05s=tmp,
    rp06p=tmp, rp06s=tmp, rp07p=tmp, rp07s=tmp, rp08p=tmp, rp08s=tmp, rp09p=tmp, rp09s=tmp, rp10p=tmp, rp10s=tmp,
    rp11p=tmp, rp11s=tmp, rp12p=tmp, rp12s=tmp, rp13p=tmp, rp13s=tmp, rp14p=tmp, rp14s=tmp, rp15p=tmp, rp15s=tmp,
    rp16p=tmp, rp16s=tmp, rp17p=tmp, rp17s=tmp, rp18p=tmp, rp18s=tmp, rp19p=tmp, rp19s=tmp, rp20p=tmp, rp20s=tmp,
    rp21p=tmp, rp21s=tmp, rp22p=tmp, rp22s=tmp, rp23p=tmp, rp23s=tmp, rp24p=tmp, rp24s=tmp, rp25p=tmp, rp25s=tmp,
    rp26p=tmp, rp26s=tmp)
    txt<-rep(NA,times=Nrc)
#    sessLists <- array(NA,dim=c(132,7,Nrc)) ## con columnas para cada nombre y apellido
    sessLists <- array(NA,dim=c(132,3,Nrc))
#
    ## SACA VOTACION GLOBAL DE CADA ROLL CALL
    for (r in 1:Nrc){
        thisRC <- thisSess[rcStart[r]:rcEnd[r]]
        #
        resloc <- grep("es [e]{0,1}l[a]{0,1} siguiente",thisRC)
        result <- paste(thisRC[resloc-1],thisRC[resloc],thisRC[resloc+1])
        #
        sessRCs$favor[r] <- as.numeric(
                     sub(result,
                     pattern=".*[:|,]{0,1} ([0-9]{1,2}) voto[s]{0,1} a favor.*",
                     replacement="\\1") )
        sessRCs$contra[r] <- as.numeric(
                     sub(result,
                     pattern=".*[,]{0,1} ([0-9]{1,2}).*en contra.*",
                     replacement="\\1") )
        sessRCs$absten[r] <- as.numeric(
                     sub(result,
                     pattern=".*[,]{0,1} ([0-9]{1,2})[[:alpha:][:space:]]*abstenci.*",
                     replacement="\\1") )
        sessRCs$dunan[r] <- ifelse(sessRCs$favor[r]==0,1,ifelse(sessRCs$contra[r]==0,1,0))
        txt[r]<-result
        }
    NContVts <- sum(1-sessRCs$dunan)   ## Num contested votes
    if(NContVts==0) contestedVotes<-NULL else contestedVotes <- grep( pattern=0, sessRCs$dunan ) ## loop r over this
    #
    for (r in contestedVotes){
        thisRC <- thisSess[rcStart[r]:rcEnd[r]]
        ## HACE 1 MATRIX PARA CADA ROLL CALL
        votStart<-grep("izquierda[.:]",thisRC)
        votEnd<-grep("es [e]{0,1}l[a]{0,1} siguiente",thisRC)-1
        votes<-thisRC[votStart:votEnd]
        drop<-grep("ASAMBLEA LEGISLATIVA",votes)                    ## patrones de eliminación
        tmp<-grep("¿",votes); drop<-append(drop,tmp)                ## de renglones que no son
        tmp<-grep("emitir su vot[oa]",votes); drop<-append(drop,tmp)   ## votos
        tmp<-grep("[Mm]esa [Dd]irectiva",votes); drop<-append(drop,tmp)
        tmp<-grep("el resultado",votes); drop<-append(drop,tmp)
        tmp<-grep("izquierda[.:]",votes); drop<-append(drop,tmp)
        tmp<-grep("recogerá la",votes); drop<-append(drop,tmp)
        tmp<-grep("recoger la",votes); drop<-append(drop,tmp)
        tmp<-grep("EL C. SECRETARIO",votes); drop<-append(drop,tmp)
        tmp<-grep("LA C. SECRETARIA",votes); drop<-append(drop,tmp)
        stay<-setdiff(1:length(votes),drop)                         ## saca drop del índice
        votes<-votes[stay]
        Ndip<-length(votes)
        for (d in 1:Ndip){
            nom<-sub(votes[d],
                     pattern="([[:alpha:]]*), .*",
                     replacement="\\1")
            vo<-sub(votes[d],
                     pattern=".*, ([[:alpha:]]*[[:space:]]{0,1}[[:alpha:]]*)[.]{0,1}",
                     replacement="\\1")
            vo <- ifelse(vo=="abstención",3,ifelse(vo=="en pro",1,ifelse(vo=="a favor",1,ifelse(vo=="en contra",2,vo))))
            sessLists[d,1,r]<-nom
            sessLists[d,2,r]<-vo
            ## Unstar si se quiere recuperar cada nombre y apellido
#            nom1<-sub(nom,
#            pattern="([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)",
#            replacement="\\1")
#            nom2<-sub(nom,
#            pattern="([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)",
#            replacement="\\2")
#            nom3<-sub(nom,
#            pattern="([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)",
#            replacement="\\3")
#            nom4<-sub(nom,
#            pattern="([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)[[:blank:]]*([[:alpha:]]*)",
#            replacement="\\4")
#            sessLists[d,3,r]<-nom1
#            sessLists[d,4,r]<-nom2
#            sessLists[d,5,r]<-nom3
#            sessLists[d,6,r]<-nom4
            #
            ## BUSCA APODO POR APODO PARA IDENTIFICAR DIPUTADOS
            ## EL ARCHIVO aldf06PropSupNomApell.ods PERMITE AÑADIR "APODOS" NUEVOS
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Ana Luisa Alvarado\\>.*", sessLists[d,1,r])=="TRUE", "rp19p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Alvarado Villazón\\>.*", sessLists[d,1,r])=="TRUE", "rp19s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Leonardo [AÁ]lvarez\\>.*", sessLists[d,1,r])=="TRUE", "rp17p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Sergio [AÁ]vila\\>.*", sessLists[d,1,r])=="TRUE", "mr34p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Beltrán\\>.*", sessLists[d,1,r])=="TRUE", "mr28p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Jacobo Bonilla\\>|\\<Bonilla\\>.*", sessLists[d,1,r])=="TRUE", "rp13p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Hipólito Bravo\\>|\\<Bravo\\>.*", sessLists[d,1,r])=="TRUE", "mr37p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Bustos\\>.*", sessLists[d,1,r])=="TRUE", "mr06p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Cañizo\\>.*", sessLists[d,1,r])=="TRUE", "rp21p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Cárdenas Sánchez\\>|\\<Nancy Cárdenas\\>.*", sessLists[d,1,r])=="TRUE", "mr36p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Castilla\\>.*", sessLists[d,1,r])=="TRUE", "rp07p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Sergio Cedillo\\>.*", sessLists[d,1,r])=="TRUE", "mr24p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Círigo\\>.*", sessLists[d,1,r])=="TRUE", "mr22p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Damián\\>|\\<Damián Peralta\\>.*", sessLists[d,1,r])=="TRUE", "mr11p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Errasti\\>.*", sessLists[d,1,r])=="TRUE", "rp05p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Espino\\>.*", sessLists[d,1,r])=="TRUE", "rp22p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Ricardo García\\>|\\<García Hernández\\>.*", sessLists[d,1,r])=="TRUE", "mr18p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<García Ayala\\>|\\<Marco Antonio García\\>.*", sessLists[d,1,r])=="TRUE", "rp18p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Garfias\\>.*", sessLists[d,1,r])=="TRUE", "mr19p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Tonatiuh González\\>.*", sessLists[d,1,r])=="TRUE", "rp20p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Agustín Guerrero\\>.*", sessLists[d,1,r])=="TRUE", "mr13p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Samuel Hernández\\>.*", sessLists[d,1,r])=="TRUE", "mr29p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Hernández Mirón\\>|\\<Carlos Hernández\\>.*", sessLists[d,1,r])=="TRUE", "mr40p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Miguel Hernández\\>|\\<Hernández Labastida\\>.*", sessLists[d,1,r])=="TRUE", "rp04p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Ramón Jiménez\\>|\\<Jiménez López\\>.*", sessLists[d,1,r])=="TRUE", "mr01p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Lima\\>.*", sessLists[d,1,r])=="TRUE", "mr02p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<López Rabadán Kenia\\>|\\<López Rabadán\\>.*", sessLists[d,1,r])=="TRUE", "rp01p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Margarita Martínez\\>|\\<Martínez Fisher\\>.*", sessLists[d,1,r])=="TRUE", "mr14p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Salvador Martínez\\>|\\<Martínez Della Rocca\\>.*", sessLists[d,1,r])=="TRUE", "mr38p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Avelino Méndez Rangel\\>|\\<Méndez Rangel\\>|\\<Avelino Méndez\\>.*", sessLists[d,1,r])=="TRUE", "mr39p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Morgan\\>.*", sessLists[d,1,r])=="TRUE", "mr25p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Morúa\\>.*", sessLists[d,1,r])=="TRUE", "mr32p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Elvira Murillo\\>.*", sessLists[d,1,r])=="TRUE", "rp08s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Nazario Norberto\\>.*", sessLists[d,1,r])=="TRUE", "mr07p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Olavarrieta\\>.*", sessLists[d,1,r])=="TRUE", "rp16p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Ordóñez\\>.*", sessLists[d,1,r])=="TRUE", "mr15p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Edy Ortiz\\>|\\<Ortiz Piña\\>.*", sessLists[d,1,r])=="TRUE", "mr35p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Parada\\>.*", sessLists[d,1,r])=="TRUE", "rp24p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Carmen Peralta\\>.*", sessLists[d,1,r])=="TRUE", "rp15p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Pérez Correa\\>.*", sessLists[d,1,r])=="TRUE", "rp26p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Laura Piña\\>|\\<Piña Olmedo\\>.*", sessLists[d,1,r])=="TRUE", "mr12p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Pliego\\>.*", sessLists[d,1,r])=="TRUE", "mr10p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Quezada\\>.*", sessLists[d,1,r])=="TRUE", "mr33p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Quiñones\\>.*", sessLists[d,1,r])=="TRUE", "rp09p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Cristóbal Ramírez\\>.*", sessLists[d,1,r])=="TRUE", "mr09p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Alejandro Ramírez\\>|\\<Ramírez Rodríguez\\>.*", sessLists[d,1,r])=="TRUE", "mr21p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Ramírez del Valle\\>.*", sessLists[d,1,r])=="TRUE", "rp11p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Rétiz\\>.*", sessLists[d,1,r])=="TRUE", "mr27p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Ricardo Benito\\>.*", sessLists[d,1,r])=="TRUE", "mr16p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Jorge Romero\\>|\\<Romero Herrera\\>.*", sessLists[d,1,r])=="TRUE", "rp10p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Saavedra\\>.*", sessLists[d,1,r])=="TRUE", "rp06p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Daniel Salazar\\>.*", sessLists[d,1,r])=="TRUE", "mr23p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Carla Sánchez Armas\\>|\\<Sánchez Armas\\>|\\<Carla Sánchez\\>.*", sessLists[d,1,r])=="TRUE", "rp25s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Santana\\>.*", sessLists[d,1,r])=="TRUE", "mr26p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Schiaffino\\>.*", sessLists[d,1,r])=="TRUE", "rp14p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Carmen Segura\\>|\\<Segura Rangel\\>|\\<Segura\\>.*", sessLists[d,1,r])=="TRUE", "rp02p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Sosa\\>.*", sessLists[d,1,r])=="TRUE", "mr31p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Soto\\>.*", sessLists[d,1,r])=="TRUE", "rp12p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Tenorio\\>.*", sessLists[d,1,r])=="TRUE", "rp23p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Mauricio Toledo\\>|\\<Toledo Gutiérrez\\>.*", sessLists[d,1,r])=="TRUE", "mr30p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Edgar Torres\\>.*", sessLists[d,1,r])=="TRUE", "mr08s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Triana\\>.*", sessLists[d,1,r])=="TRUE", "rp03p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Enrique Vargas\\>|\\<Vargas Anaya\\>.*", sessLists[d,1,r])=="TRUE", "mr03p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Balfre Vargas\\>|\\<Vargas Cortés\\>.*", sessLists[d,1,r])=="TRUE", "mr05p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Villa\\>|\\<Isaías Villa\\>.*", sessLists[d,1,r])=="TRUE", "mr04p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Vinalay\\>.*", sessLists[d,1,r])=="TRUE", "mr20p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Zepeda\\>.*", sessLists[d,1,r])=="TRUE", "mr17p", sessLists[d,3,r] )
            }
        # CUANTOS FALTAN PARA COMPLETAR 132 DIPUTADOS POTENCIALES
        votaron <- sessLists[,3,r]; votaron <- votaron[!is.na(votaron)]
        faltaron <- setdiff ( id, votaron )
        sessLists[(length(votaron)+1):132,3,r]<-faltaron ## METE LOS IDs FALTANTES
        thisRClist <- data.frame (name=sessLists[,1,r],
                                  vote=sessLists[,2,r],
                                  folio=sessLists[,3,r])
        repNames<-votaron[duplicated(votaron)]; tmp<-length(repNames)
        ## SORTS BY FOLIO (ID)
        attach(thisRClist)
        thisRClist <- thisRClist[order(folio),]
        detach("thisRClist")
        sessRCs[r,9:140]<-thisRClist$vote ## TRANSFIERE 132 VOTOS O NAs A LA MATRIZ DE ROLL CALLS
        }
    RCs <- merge(RCs, sessRCs, all=TRUE)
    }
## ESTO LO USE PARA VERIFICAR QUE NO FALTARAN APODOS Y VOTOS; SE CORRE s POR s (SIN LOOP s)
#tmp1<-NULL; tmp2<-NULL; tmp3<-NULL
#if (length(contestedVotes)==0) print("NO CONTESTED VOTES") else for (cv in contestedVotes){
#    tmp1<-append(tmp1,sessLists[,1,cv]); tmp2<-append(tmp2,sessLists[,2,cv]); tmp3<-append(tmp3,sessLists[,3,cv])
#    tmp<-data.frame( nam=tmp1, vot=tmp2, apo=tmp3 )
#    }
#tmp
#print(paste("NUM. CONTESTED VOTES = ",length(contestedVotes)))
#if (length(grep(pattern="TRUE",is.na(tmp[,3])))==0) print("No NAs in apodos") else print(paste("FALTAN APODOS:",grep(pattern="TRUE",is.na(tmp[,3]))))
#
RCs <- RCs[-1,]  ## DELETES FIRST (EMPTY) ROW IN ROLL CALL DATAFRAME
RCsU <- RCs               ## WITH UNANIMOUS VOTES
RCs <- RCs[RCs$dunan==0,] ## DROPS UNANIMOUS ROLL CALLS
for (c in 9:ncol(RCs)){
    RCs[,c]<-as.numeric(RCs[,c])
    for (r in 1:nrow(RCs)){
        RCs[r,c]<-ifelse(is.na(RCs[r,c])=="TRUE",0,ifelse(RCs[r,c]==3,0,ifelse(RCs[r,c]==2,-1,ifelse(RCs[r,c]==1,1,99))))
        }
    }
for (c in 9:ncol(RCsU)){
    RCsU[,c]<-as.numeric(RCsU[,c])
    for (r in 1:nrow(RCsU)){
        RCsU[r,c]<-ifelse(is.na(RCsU[r,c])=="TRUE",0,ifelse(RCsU[r,c]==3,0,ifelse(RCsU[r,c]==2,-1,ifelse(RCsU[r,c]==1,1,99))))
        }
    }

#RCs <- RCs[RCs$yr<2009|(RCs$yr==2009&RCs$mo==3$RCs$dy==19)] ## DROPS COMISION PERMANENTE
#
load(file="tmp.RData")
tmp <- merge(RCs, RCsTwo, all=TRUE)
tmp2 <- merge(RCsU, RCsUTwo, all=TRUE)
RCs<-tmp  ## Usando RCs<-tmp incluyes los votos procesados por datosWebdos SIN los unánimes -- no debiera de cambiar nada abajo en RCs, pero sí en RCsU
RCsU <- tmp2
rm(RCsTwo, RCsUTwo)
#

save(RCsU, file="RCsU.RData")
save(RCs, file="RCs.RData")
#load(file="RCs.RData")
#
load(file="RCsyr12.RData")
names(datos)[names(datos)=="vot"]="folio"
names(datos)[names(datos)=="dunanime"]="dunan"
datos$favor<-rep(NA, length(datos$yr) )
datos$contra<-rep(NA, length(datos$yr) )
datos$absten<-rep(NA, length(datos$yr) )
#
ayes<-c(63, 26, 57, 50, 49, 26, 19, 43, 6, 38, 60, 55, 56, 54, 55, 54, 44, 44, 50, 31, 31, 54, 43, 40, 45, 44, 43, 47, 45, 41, 43, 40, 43, 47, 54, 52, 54, 54, 57, 44, 53, 40, 49, 48, 47, 46, 21, 56, 55, 53, 52, 50, 48, 47, 52, 60, 10, 54, 57, 48, 56, 57, 58, 55, 46, 22, 20, 21, 56, 57, 55, 56, 53, 54, 56, 57, 49, 48, 48, 36, 56, 39, 48, 53, 55, 54, 55, 53, 49, 34, 54, 51, 44, 46, 36, 55, 49, 40, 47, 43, 43, 42, 41, 39, 48, 43, 39, 34, 33, 42, 42, 40, 39, 37, 39, 37, 36, 41, 40, 44, 42, 21, 33, 45, 43, 22, 40, 42, 38, 42, 41, 43, 41, 44, 40, 46, 20, 40, 42, 48, 41, 43, 43, 41, 44, 42, 39, 34, 41, 40, 44, 47, 48, 45, 44, 47, 39, 36, 34, 55, 54, 48, 17, 62, 39, 53, 29, 19, 46, 18, 43, 38, 39, 41, 8, 4, 11, 10, 10, 6, 3, 6, 50, 54, 52, 50, 50, 48, 51, 50, 46, 48, 46, 25, 26, 47, 45, 40, 39, 48, 41, 45, 51, 47, 49, 51, 44, 45, 46, 36, 47, 40, 42, 44, 21, 26, 47, 42, 48, 43, 34, 52, 43, 41, 47, 38, 37, 48, 44, 32, 43, 42, 38, 1, 46, 37, 32, 37, 36, 40, 34, 29, 50, 25, 46, 46, 46, 49, 48, 50, 52, 45, 25, 11, 34, 34, 34, 37, 31, 41, 38, 36, 19, 45, 18, 45, 43, 42, 31, 28, 30, 33, 47, 25, 29, 31, 47, 27, 42, 44, 43, 37, 35, 37, 44, 39, 43, 45, 42, 46, 45, 43, 20, 50, 22, 40, 43, 38, 39, 35, 41, 39, 39, 41, 14, 42, 41, 40, 44, 41, 41, 26, 35, 24, 47, 45, 37, 33, 41, 29, 15, 14, 10, 14, 12, 8, 6, 40, 7, 14, 35, 46, 22, 47, 40, 42, 44, 39, 42, 33, 39, 39, 36, 36, 32, 41, 44, 39, 37, 33, 45, 37, 31, 34, 30, 48, 48, 45, 38, 39, 47, 45, 42, 49, 28, 56, 51, 38, 45, 39, 30, 7, 37, 37, 47, 40, 34, 39, 34, 36, 37, 57, 55, 56, 57, 44, 47, 34, 45, 31, 39, 35, 37, 43, 32, 54, 8, 11, 12, 7, 5, 47, 50, 38, 42, 39, 40, 43, 44, 41, 46, 42, 31, 44, 44, 45, 44, 43, 45, 43, 39, 34, 38, 40, 40, 37, 29, 45, 45, 46, 38, 34, 21, 22, 23, 37, 18, 23, 37, 44, 42, 39, 43, 35, 42, 48, 46, 21, 38, 37, 46, 18, 23, 35, 31, 41, 40, 36, 37, 42, 41, 4, 7, 6, 8, 6, 4, 5, 10, 4, 3, 4, 4, 7, 6, 6, 8, 7, 6, 38, 25, 25, 25, 22, 31, 35, 54, 56, 36, 36, 46, 46, 45, 40, 48, 28, 27, 40, 34, 32, 36, 37, 33, 44, 32, 46, 32, 31, 42, 31, 45, 43, 16, 48, 44, 47, 48, 35)
nays<-c(0, 23, 0, 0, 0, 23, 39, 16, 37, 19, 0, 0, 0, 1, 0, 0, 0, 0, 0, 24, 18, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 30, 4, 0, 0, 0, 0, 1, 0, 16, 37, 41, 37, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 4, 0, 1, 2, 0, 0, 0, 0, 0, 0, 24, 0, 5, 5, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 34, 21, 0, 0, 18, 0, 0, 2, 0, 0, 0, 0, 0, 4, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 1, 0, 0, 5, 0, 0, 0, 0, 0, 42, 0, 0, 1, 14, 44, 19, 44, 17, 0, 0, 0, 3, 7, 0, 0, 0, 5, 4, 2, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 21, 18, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 0, 0, 2, 10, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 4, 14, 0, 0, 5, 47, 0, 0, 0, 0, 0, 0, 0, 9, 2, 28, 0, 0, 0, 0, 0, 0, 0, 0, 12, 15, 0, 0, 1, 2, 0, 0, 0, 0, 4, 0, 25, 1, 0, 0, 11, 21, 18, 15, 0, 8, 6, 1, 0, 23, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 24, 1, 23, 0, 0, 0, 0, 0, 0, 0, 6, 0, 23, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 5, 23, 34, 31, 30, 31, 29, 32, 2, 33, 27, 2, 0, 25, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 13, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 0, 0, 0, 1, 0, 20, 20, 21, 0, 17, 9, 0, 0, 0, 0, 0, 3, 0, 0, 0, 3, 0, 0, 0, 19, 3, 0, 14, 0, 0, 17, 16, 16, 17, 6, 3, 6, 2, 4, 6, 0, 0, 5, 8, 4, 4, 3, 4, 0, 0, 2, 1, 23, 36, 35, 34, 35, 20, 21, 0, 0, 12, 12, 0, 0, 0, 0, 0, 11, 15, 0, 0, 0, 0, 17, 16, 2, 15, 1, 16, 14, 1, 15, 0, 0, 30, 0, 0, 0, 0, 0)
abst<-c(0, 9, 1, 0, 0, 0, 6, 5, 14, 3, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 3, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 3, 2, 2, 1, 0, 0, 0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 14, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 4, 6, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 20, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 2, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 1, 0, 1, 1, 4, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 10, 5, 2, 0, 0, 0, 4, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 12, 16, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 6, 0, 0, 0, 10, 2, 0, 0, 4, 0, 2, 0, 1, 0, 2, 2, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 14)
datos$favor<-ayes; datos$contra<-nays; datos$absten<-abst
#
tmp<-data.frame(folio=datos[,4], datos[,1:3], datos[,72:74], dunan=datos[,71], datos[,5:70])
tmp$mr01s<-NA; tmp$mr02s<-NA; tmp$mr03s<-NA; tmp$mr04s<-NA
tmp$mr05s<-NA; tmp$mr06s<-NA; tmp$mr07s<-NA; tmp$mr08p<-NA
tmp$mr09s<-NA; tmp$mr10s<-NA; tmp$mr11s<-NA; tmp$mr12s<-NA
tmp$mr13s<-NA; tmp$mr14s<-NA; tmp$mr15s<-NA; tmp$mr16s<-NA
tmp$mr17s<-NA; tmp$mr18s<-NA; tmp$mr19s<-NA; tmp$mr20s<-NA
tmp$mr21s<-NA; tmp$mr22s<-NA; tmp$mr23s<-NA; tmp$mr24s<-NA
tmp$mr25s<-NA; tmp$mr26s<-NA; tmp$mr27s<-NA; tmp$mr28s<-NA
tmp$mr29s<-NA; tmp$mr30s<-NA; tmp$mr31s<-NA; tmp$mr32s<-NA
tmp$mr33s<-NA; tmp$mr34s<-NA; tmp$mr35s<-NA; tmp$mr36s<-NA
tmp$mr37s<-NA; tmp$mr38s<-NA; tmp$mr39s<-NA; tmp$mr40s<-NA
tmp$rp01s<-NA; tmp$rp02s<-NA; tmp$rp03s<-NA; tmp$rp04s<-NA
tmp$rp05s<-NA; tmp$rp06s<-NA; tmp$rp07s<-NA; tmp$rp08p<-NA
tmp$rp09s<-NA; tmp$rp10s<-NA; tmp$rp11s<-NA; tmp$rp12s<-NA
tmp$rp13s<-NA; tmp$rp14s<-NA; tmp$rp15s<-NA; tmp$rp16s<-NA
tmp$rp17s<-NA; tmp$rp18s<-NA; tmp$rp19p<-NA; tmp$rp20s<-NA
tmp$rp21s<-NA; tmp$rp22s<-NA; tmp$rp23s<-NA; tmp$rp24s<-NA
tmp$rp25s<-NA; tmp$rp26s<-NA
#
## RE-SORTS BY VARIABLE NAMES
tmp[(length(tmp$yr)+1),]<- c("a1","a2","a3","a4","a5","a6","a7",
   "a8", "rp21p", "rp22p", "rp24p", "rp23p", "rp13p", "rp07p",
"rp05p", "rp04p", "rp01p", "mr14p", "rp08s", "rp09p", "rp11p",
"mr27p", "rp10p", "rp06p", "rp02p", "rp12p", "rp03p", "mr20p",
"mr17p", "mr16p", "mr34p", "mr28p", "mr37p", "mr06p", "mr36p",
"mr24p", "mr22p", "mr11p", "mr19p", "mr13p", "mr29p", "mr40p",
"mr01p", "mr02p", "mr38p", "mr39p", "mr25p", "mr32p", "mr07p",
"mr15p", "mr35p", "mr12p", "mr10p", "mr33p", "mr09p", "mr23p",
"mr26p", "mr31p", "mr30p", "mr08s", "mr03p", "mr05p", "mr04p",
"rp18p", "rp20p", "rp16p", "rp14p", "rp25p", "rp26p", "mr18p",
"rp19s", "rp17p", "rp15p", "mr21p", "mr01s", "mr02s", "mr03s",
"mr04s", "mr05s", "mr06s", "mr07s", "mr08p", "mr09s", "mr10s",
"mr11s", "mr12s", "mr13s", "mr14s", "mr15s", "mr16s", "mr17s",
"mr18s", "mr19s", "mr20s", "mr21s", "mr22s", "mr23s", "mr24s",
"mr25s", "mr26s", "mr27s", "mr28s", "mr29s", "mr30s", "mr31s",
"mr32s", "mr33s", "mr34s", "mr35s", "mr36s", "mr37s", "mr38s",
"mr39s", "mr40s", "rp01s", "rp02s", "rp03s", "rp04s", "rp05s",
"rp06s", "rp07s", "rp08p", "rp09s", "rp10s", "rp11s", "rp12s",
"rp13s", "rp14s", "rp15s", "rp16s", "rp17s", "rp18s", "rp19p",
"rp20s", "rp21s", "rp22s", "rp23s", "rp24s", "rp25s", "rp26s")
tmp2<-as.matrix(t(tmp))
tmp3<-tmp2[order(tmp2[,519]),]
tmp3<-as.data.frame(t(tmp3))
tmp3<-tmp3[-519,]
RCsyr12<-tmp3
#

tmp <- merge(RCs, RCsyr12, all=TRUE)
RCs<-tmp
for (c in 9:ncol(RCs)){
    RCs[,c]<-as.numeric(RCs[,c])
    RCs[,c]<-ifelse(is.na(RCs[,c])=="TRUE",0,RCs[,c])
    }
RCs$favor<-as.numeric(RCs$favor); RCs$contra<-as.numeric(RCs$contra); RCs$absten<-as.numeric(RCs$absten)
##drops unanimous votes
RCsU <- RCs               ## all votes
RCs <- RCs[RCs$dunan==0,] ## contested votes only
#
tmp<-RCs$favor+RCs$contra+RCs$absten
ayes<-rep(NA,times=length(9:ncol(RCs))); nays<-rep(NA,times=length(9:ncol(RCs)))
for (i in 1:nrow(RCs)){
    ayes[i]<- sum (ifelse(RCs[i,9:ncol(RCs)]== 1,1,0))
    nays[i]<- sum (ifelse(RCs[i,9:ncol(RCs)]==-1,1,0))
    }
totvot=ayes+nays+RCs$absten
#
RCs<-RCs[totvot>20,]  #### DROPS COMISION PERMANENTE

save(id, longNames, shortNames, part, RCs, RCsU, file=("allRCs.RData"))

# END

********FALTA HACERLO NUMERICO Y SALVARLO


## Hay que pegarle el vector de nombres antes de eliminar las columnas de diputados que nunca tomaron posesión


#LO DE ABAJO DETECTA CASOS EN QUE HAY MÁS DE 132 DIPUTADOS EN VOTARON+FALTARON

#tmp<- ifelse( length(c(votaron,faltaron)>132, votaron[duplicated(votaron)=="TRUE"], NA )


#r<-12
#        # CUANTOS FALTAN PARA COMPLETAR 132 DIPUTADOS POTENCIALES
#        votaron <- sessLists[,3,r]; votaron <- votaron[!is.na(votaron)]
#        faltaron <- setdiff ( id, votaron )
#length(c(votaron,faltaron))
#        sessLists[(length(votaron)+1):132,3,r]<-faltaron ## METE LOS IDs FALTAN#TES
#        thisRClist <- data.frame (name=sessLists[,1,r],
#                                  vote=sessLists[,2,r],
#                                  folio=sessLists[,3,r])
#        ## SORTS BY FOLIO (ID)
#        attach(thisRClist)
#        thisRClist <- thisRClist[order(folio),]
#        detach("thisRClist")
#        sessRCs[r,9:140]<-thisRClist$vote ## TRANSFIERE 132 VOTOS O NAs A LA MA#TRIZ DE ROLL CALLS



#loops=1 RCs <- sessRCs
#loopss=2:Nsess RCs <- append(RCs, sessRCs)

#ewiwjeweiowueiwueiwueiwueiwueiuwieuwieuiwueiwueiwueiwueiwueiwuekiqweaqwñjeqñwe

#ge2005 <- data.frame(matrix(NA,nrow=length(nCand),ncol=9))
#names(ge2005)<-c("index","consName","region","nCand","candName","pty","dIncum",#"votes","electorate")
#ge2005$index <- index
#ge2005$consName <- consName
#ge2005$region <- region
#ge2005$nCand <- nCand
#ge2005$candName <- candName
#ge2005$pty <- pty
#ge2005$dIncum <- dIncum
#ge2005$votes <- votes
#ge2005$electorate <- electorate

#EXPORTA
#write.csv(ge2005, file="ge2005.csv")

