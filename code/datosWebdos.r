#setwd("c:/data/rollcall/aldf")setwd("d:/01/Dropbox/data/rollcall/aldf")
#setwd("c:/Documents and Settings/emagarm/Mis documentos/My Dropbox/data/rollcall/aldf")
rm(list = ls())
#
# LA INFO ESTA GUARDADA EN EL ARCHIVO rawvote3aSesionDos.txt
# EN EL RENGLON PREVIO A LA FECHA QUE INDICA EL INICIO DE UNA NUEVA SESION HAY QUE PEGAR A MANO newSession
# EN EL RENGLON PREVIO A CADA VOTACION NOMINAL HAY QUE PEGAR A MANO newRollCall
#
id <- c("mr01p", "mr01s", "mr02p", "mr02s", "mr03p", "mr03s", ## DUPLICADO
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
longNames <- c(                                             ## DUPLICADO
"Ram�n Jim�nez L�pez",         ## Ram�nJim�nezL�pez
"Eleazar Rubio",               ## EleazarRubioAldar�n
"Antonio Lima",                ## AntonioLimaBarrios
"Roc�o Z��iga",                ## Roc�oAim�Z��igaOrtiz
"Enrique Vargas",              ## EnriqueVargasAnaya
"Oscar Romero",                ## OscarRomeroL�pez
"Isa�as Villa",                ## Isa�asVillaGonz�lez
"Aar�n Romero",                ## Aar�nRomeroMaldonado
"Balfre Vargas",               ## BalfreVargasCort�s
"M�ximo Cer�n",                ## M�ximoJustinoCer�nMart�nez
"Juan Bustos",                 ## JuanBustosPascual
"Patricio Avila",              ## PatricioAvilaLuna
"Nazario Norberto",            ## NazarioNorbertoS�nchez
"Javier Mart�nez",             ## JavierMart�nezSolano
"Imelda Mendoza",              ## ImeldaMendozaRomero
"Edgar Torres Baltazar",       ## EdgarTorresBaltazar
"Crist�bal Ram�rez",           ## Jos�Crist�balRam�rezPino
"Rodrigo Ugalde",              ## RodrigoUgaldeMolina
"Tom�s Pliego",                ## Tom�sPliegoCalvo
"Arturo Zamora",               ## ArturoZamoraFlores
"Esthela Dami�n",              ## EsthelaDami�nPeralta
"Maricela S�nchez",            ## MaricelaS�nchezCabrera
"Laura Pi�a",                  ## LauraPi�aOlmedo
"Lidia Hern�ndez",             ## Mar�aLidiaHern�ndezCastilla
"Agust�n Guerrero",            ## Agust�nGuerreroCastillo
"Ricardo Gonz�lez",            ## RicardoGonz�lezdelAngel
"Margarita Mart�nez",          ## MargaritaMar�aMart�nezFisher
"Arne Aus Den Ruthen",         ## ArneSidneyAusDenRuthen
"Daniel Ord��ez",              ## DanielOrd��ezHern�ndez
"Manuel Orozco",               ## JuanManuelOrozcoCarmona
"Ricardo Benito",              ## AntonioLe�nRicardoBenito
"Arturo Res�ndiz",             ## Res�ndizMart�nezArturo
"Jos� Zepeda",                 ## Jos�AntonioZepedaSegura
"Carolina Rebollo",            ## CarolinaRebolloAguilar
"Ricardo Garc�a Hern�ndez",    ## JuanRicardoGarc�aHern�ndez
"Carlos Coronado",             ## CarlosCoronadoOrtiz
"Elba Garfias",                ## Mar�aElbaGarfiasMaldonado
"Hilario Nolasco",             ## HilarioNolascoOchoa
"Alfredo Vinalay",             ## AlfredoVinalayMora
"Mar�a Arronte",               ## Mar�adelos�ngelesArronteOlgu�n
"Alejandro Ram�rez Rodr�guez", ## Ra�lAlejandroCuauht�mocRam�rezRodr�guez
"Andrea Ortega",               ## AndreaOrtegaGonz�lez
"V�ctor Hugo C�rigo",          ## V�ctorHugoC�rigoV�zquez
"Maribel Zamora",              ## MaribelZamoraGranados
"Daniel Salazar",              ## DanielSalazarN��ez
"Abril Trujillo",              ## AbrilJaneteTrujilloV�zquez
"Sergio Cedillo",              ## SergioMiguelCedilloFern�ndez
"Jaime Jim�nez",               ## JaimeJim�nezBurgos
"Humberto Morgan",             ## HumbertoMorganCol�n
"Eduardo Rocha",               ## LuisEduardoRochaCruz
"Arturo Santana",              ## ArturoSantanaAlfaro
"Natividad Patricio",          ## Mar�aNatividadPatricioRazo
"Ezequiel R�tiz",              ## EzequielR�tizGuti�rrez
"Cecilia Mart�nez",            ## EmmaCeciliaMart�nezCapaceta
"Juan Beltr�n",                ## JuanCarlosBeltr�nCordero
"Mar�a M�ndez",                ## Mar�adeLourdesM�ndezGalv�n
"Samuel Hern�ndez",            ## SamuelHern�ndezAbarca
"Margarito Reyes",             ## MargaritoReyesAguirre
"Mauricio Toledo",             ## MauricioAlonsoToledoGuti�rrez
"Miguel Hern�ndez",            ## MiguelAngelHern�ndezHern�ndez
"Miguel Sosa",                 ## MiguelSosaTan
"Juan Trillo",                 ## JuanCarlosTrilloDom�nguez
"Jos� Mor�a",                  ## Jos�LuisMor�aJasso
"Jos� Hern�ndez",              ## Jos�AlfredoHern�ndezLeal
"Leticia Quezada",             ## LeticiaQuezadaContreras
"Iliana Araiza",               ## IlianaAraizaMota
"Sergio Avila",                ## SergioAvilaRojas
"Miriam G�mez",                ## MiriamRosarioG�mezValenzuela
"Edy Ortiz",                   ## EdyOrtizPi�a
"Angelina Hern�ndez",          ## AngelinaHern�ndez
"Nancy C�rdenas",              ## NancyC�rdenasS�nchez
"Juan Carlos Hern�ndez",       ## JuanCarlosHern�ndezValent�n
"Hip�lito Bravo",              ## Hip�litoBravoL�pez
"Jos� Luis Mechg�n",           ## Jos�LuisMechg�nGonz�lez
"Salvador Mart�nez",           ## SalvadorPabloMart�nezDellaRocca
"Inti Mu�oz",                  ## IntiMu�ozSantini
"Avelino M�ndez Rangel",       ## AvelinoM�ndezRangel
"Mart�n Rosales",              ## Mart�nRosalesRomero
"Hern�ndez Mir�n",             ## CarlosHern�ndezMir�n
"Jes�s Esquivel",              ## Jes�sEsquivelCarrillo
"L�pez Rabad�n Kenia",         ## KeniaL�pezRabad�n
"Orlando Anaya",               ## OrlandoAnayaGonz�lez
"Carmen Segura",               ## Mar�adelCarmenSeguraRangel
"Ra�l Herrera",                ## Ra�lHerreraEspinosa
"Jorge Triana",                ## JorgeTrianaTena
"Yesenia Villaluz",            ## YeseniaVillaluzAlba
"Miguel Hern�ndez Labastida",  ## MiguelRam�nHern�ndezLabastida
"Jos� �lvarez",                ## Jos�Hiram�lvarezEscudero
"Miguel Angel Errasti",        ## MiguelAngelErrastiArango
"Cecilia Mendoza",             ## CeciliaMendozaBautista
"Celina Saavedra",             ## CelinaSaavedraOrtega
"Francisco Santib��ez",        ## FranciscoSantib��ezCalzadilla
"Agust�n Castilla",            ## Agust�nCarlosCastillaMarroqu�n
"Mara Rivera",                 ## MaradelSocorroRiveraHern�ndez
"Daniel Armas",                ## AldoDanielArmasPluma
"Elvira Murillo",              ## ElviraMurilloMendoza
"Mar�a Qui��nez",              ## Mar�adelaPazQui��nezCornejo
"Guillermo Torres",            ## GuillermodeJes�sTorresQuiroz
"Jorge Romero",                ## JorgeRomeroHerrera
"Fernanda Verderi",            ## FernandaVerderiMu��zuri
"Daniel Ram�rez del Valle",    ## DanielRam�rezdelValle
"Brenda Ruiz",                 ## BrendaFabiolaRuizAguilar
"Paula Soto",                  ## PaulaAdrianaSotoMaldonado
"Fernando Cuevas",             ## FernandoCuevasMoranchel
"Jacobo Bonilla",              ## JacoboManfredoBonillaCedillo
"Lorena N��ez",                ## LorenaN��ezL�pez
"Federico Schiaffino",         ## JorgeFedericoSchiaffinoIsunza
"Alicia T�llez",               ## AliciaVirginiaT�llezS�nchez
"Carmen Peralta",              ## Mar�adelCarmenPeraltaVaqueiro
"Jos� Antonio Arzate",         ## Jos�AntonioArzateFlores
"Carlos Olavarrieta",          ## Mart�nCarlosOlavarrietaMaldonado
"Sergio Jim�nez",              ## SergioJim�nezBarros
"Leonardo �lvarez",            ## Leonardo�lvarezRomo
"Jos� Pe�a",                   ## Jos�FernandoPe�aGaravito
"Marco Garc�a",                ## MarcoAntonioGarc�aAyala
"Silvia Gazc�n",               ## SilviaElenaGazc�nL�pezCano
"Ana Luisa Alvarado",          ## AnaLuisaAlvaradoVillaz�n
"Francisco Alvarado",          ## FranciscoJavierAlvaradoVillaz�n
"Tonatiuh Gonz�lez",           ## ArmandoTonatiuhGonz�lezCase
"Diego Valdez",                ## DiegoValdezMedina
"Isabel Ca�izo",               ## GloriaIsabelCa�izoCuevas
"Mar�a Kuri",                  ## Mar�adelasMercedesKuriLorenzo
"Fernando Espino",             ## FernandoEspinoAr�valo
"Mar�a Garc�a",                ## Mar�aEnriquetaGarc�aVillarreal
"Xiuh Tenorio",                ## XiuhGuillermoTenorioAntiga
"Oscar Hern�ndez",             ## OscarHern�ndezSalgado
"Rebeca Parada",               ## RebecaParadaOrtega
"Leonardo Macareno",           ## LeonardoMacarenoMej�a
"Jorge D�az",                  ## JorgeCarlosD�azCuervo
"Carla S�nchez Armas",         ## CarlaAlejandraS�nchezArmasGarc�a
"Enrique P�rez Correa",        ## EnriqueP�rezCorrea
"Carlos G�mez")                ## CarlosMauricioG�mezG�mez
#
shortNames <- c(                                        ## DUPLICADO
"Jim�nez",          ## Ram�nJim�nezL�pez
"Rubio",            ## EleazarRubioAldar�n
"Lima",             ## AntonioLimaBarrios
"Z��iga",           ## Roc�oAim�Z��igaOrtiz
"E Vargas",         ## EnriqueVargasAnaya
"Romero",           ## OscarRomeroL�pez
"Villa",            ## Isa�asVillaGonz�lez
"Romero",           ## Aar�nRomeroMaldonado
"B Vargas",         ## BalfreVargasCort�s
"Cer�n",            ## M�ximoJustinoCer�nMart�nez
"Bustos",           ## JuanBustosPascual
"Avila",            ## PatricioAvilaLuna
"Norberto",         ## NazarioNorbertoS�nchez
"J Mart�nez",       ## JavierMart�nezSolano
"Mendoza",          ## ImeldaMendozaRomero
"Torres",           ## EdgarTorresBaltazar
"Ram�rez",          ## Jos�Crist�balRam�rezPino
"Ugalde",           ## RodrigoUgaldeMolina
"Pliego",           ## Tom�sPliegoCalvo
"Zamora",           ## ArturoZamoraFlores
"Dami�n",           ## EsthelaDami�nPeralta
"S�nchez",          ## MaricelaS�nchezCabrera
"Pi�a",             ## LauraPi�aOlmedo
"Hern�ndez",        ## Mar�aLidiaHern�ndezCastilla
"Guerrero",         ## Agust�nGuerreroCastillo
"Gonz�lez",         ## RicardoGonz�lezdelAngel
"M Mart�nez",       ## MargaritaMar�aMart�nezFisher
"Aus Den Ruthen",   ## ArneSidneyAusDenRuthen
"Ord��ez",          ## DanielOrd��ezHern�ndez
"Orozco",           ## JuanManuelOrozcoCarmona
"Ricardo",          ## AntonioLe�nRicardoBenito
"Mart�nez",         ## Res�ndizMart�nezArturo
"Zepeda",           ## Jos�AntonioZepedaSegura
"Rebollo",          ## CarolinaRebolloAguilar
"Garc�a",           ## JuanRicardoGarc�aHern�ndez
"Coronado",         ## CarlosCoronadoOrtiz
"Garfias",          ## Mar�aElbaGarfiasMaldonado
"Nolasco",          ## HilarioNolascoOchoa
"Vinalay",          ## AlfredoVinalayMora
"Arronte",          ## Mar�adelos�ngelesArronteOlgu�n
"Ram�rez",          ## Ra�lAlejandroCuauht�mocRam�rezRodr�guez
"Ortega",           ## AndreaOrtegaGonz�lez
"C�rigo",           ## V�ctorHugoC�rigoV�zquez
"Zamora",           ## MaribelZamoraGranados
"Salazar",          ## DanielSalazarN��ez
"Trujillo",         ## AbrilJaneteTrujilloV�zquez
"Cedillo",          ## SergioMiguelCedilloFern�ndez
"Jim�nez",          ## JaimeJim�nezBurgos
"Morgan",           ## HumbertoMorganCol�n
"Rocha",            ## LuisEduardoRochaCruz
"Santana",          ## ArturoSantanaAlfaro
"Patricio",         ## Mar�aNatividadPatricioRazo
"R�tiz",            ## EzequielR�tizGuti�rrez
"Mart�nez",         ## EmmaCeciliaMart�nezCapaceta
"Beltr�n",          ## JuanCarlosBeltr�nCordero
"M�ndez",           ## Mar�adeLourdesM�ndezGalv�n
"Hern�ndez",        ## SamuelHern�ndezAbarca
"Reyes",            ## MargaritoReyesAguirre
"Toledo",           ## MauricioAlonsoToledoGuti�rrez
"Hern�ndez",        ## MiguelAngelHern�ndezHern�ndez
"Sosa",             ## MiguelSosaTan
"Trillo",           ## JuanCarlosTrilloDom�nguez
"Mor�a",            ## Jos�LuisMor�aJasso
"Hern�ndez",        ## Jos�AlfredoHern�ndezLeal
"Quezada",          ## LeticiaQuezadaContreras
"Araiza",           ## IlianaAraizaMota
"Avila",            ## SergioAvilaRojas
"G�mez",            ## MiriamRosarioG�mezValenzuela
"Ortiz",            ## EdyOrtizPi�a
"Hern�ndez",        ## AngelinaHern�ndez
"C�rdenas",         ## NancyC�rdenasS�nchez
"Hern�ndez",        ## JuanCarlosHern�ndezValent�n
"Bravo",            ## Hip�litoBravoL�pez
"Mechg�n",          ## Jos�LuisMechg�nGonz�lez
"Mart�nez",         ## SalvadorPabloMart�nezDellaRocca
"Mu�oz",            ## IntiMu�ozSantini
"M�ndez",           ## AvelinoM�ndezRangel
"Rosales",          ## Mart�nRosalesRomero
"Hern�ndez",        ## CarlosHern�ndezMir�n
"Esquivel",         ## Jes�sEsquivelCarrillo
"L�pez",            ## KeniaL�pezRabad�n
"Anaya",            ## OrlandoAnayaGonz�lez
"Segura",           ## Mar�adelCarmenSeguraRangel
"Herrera",          ## Ra�lHerreraEspinosa
"Triana",           ## JorgeTrianaTena
"Villaluz",         ## YeseniaVillaluzAlba
"Hern�ndez",        ## MiguelRam�nHern�ndezLabastida
"�lvarez",          ## Jos�Hiram�lvarezEscudero
"Errasti",          ## MiguelAngelErrastiArango
"Mendoza",          ## CeciliaMendozaBautista
"Saavedra",         ## CelinaSaavedraOrtega
"Santib��ez",       ## FranciscoSantib��ezCalzadilla
"Castilla",         ## Agust�nCarlosCastillaMarroqu�n
"Rivera",           ## MaradelSocorroRiveraHern�ndez
"Armas",            ## AldoDanielArmasPluma
"Murillo",          ## ElviraMurilloMendoza
"Qui��nez",         ## Mar�adelaPazQui��nezCornejo
"Torres",           ## GuillermodeJes�sTorresQuiroz
"Romero",           ## JorgeRomeroHerrera
"Verderi",          ## FernandaVerderiMu��zuri
"Ram�rez",          ## DanielRam�rezdelValle
"Ruiz",             ## BrendaFabiolaRuizAguilar
"Soto",             ## PaulaAdrianaSotoMaldonado
"Cuevas",           ## FernandoCuevasMoranchel
"Bonilla",          ## JacoboManfredoBonillaCedillo
"N��ez",            ## LorenaN��ezL�pez
"Schiaffino",       ## JorgeFedericoSchiaffinoIsunza
"T�llez",           ## AliciaVirginiaT�llezS�nchez
"Peralta",          ## Mar�adelCarmenPeraltaVaqueiro
"Arzate",           ## Jos�AntonioArzateFlores
"Olavarrieta",      ## Mart�nCarlosOlavarrietaMaldonado
"Jim�nez",          ## SergioJim�nezBarros
"�lvarez",          ## Leonardo�lvarezRomo
"Pe�a",             ## Jos�FernandoPe�aGaravito
"Garc�a",           ## MarcoAntonioGarc�aAyala
"Gazc�n",           ## SilviaElenaGazc�nL�pezCano
"Alvarado",         ## AnaLuisaAlvaradoVillaz�n
"Alvarado",         ## FranciscoJavierAlvaradoVillaz�n
"Gonz�lez",         ## ArmandoTonatiuhGonz�lezCase
"Valdez",           ## DiegoValdezMedina
"Ca�izo",           ## GloriaIsabelCa�izoCuevas
"Kuri",             ## Mar�adelasMercedesKuriLorenzo
"Espino",           ## FernandoEspinoAr�valo
"Garc�a",           ## Mar�aEnriquetaGarc�aVillarreal
"Tenorio",          ## XiuhGuillermoTenorioAntiga
"Hern�ndez",        ## OscarHern�ndezSalgado
"Parada",           ## RebecaParadaOrtega
"Macareno",         ## LeonardoMacarenoMej�a
"D�az",             ## JorgeCarlosD�azCuervo
"S�nchez",          ## CarlaAlejandraS�nchezArmasGarc�a
"P�rez",            ## EnriqueP�rezCorrea
"G�mez")            ## CarlosMauricioG�mezG�mez
#
part <- c("prd", "prd", "prd", "prd", "prd", "prd", "prd",         ## DUPLICADO
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
file<-file("rawvote3aSesionDos.txt",open="r")
rawData<-readLines(file)
close(file)
rawData<-append(rawData,"--- T H E   E N D ---")
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
#s <- 15
    marker<-c("[Nn]ew[Rr]oll[Cc]all")
    thisSess <- rawData[sessionStart[s]:sessionEnd[s]]
    rcStart<-grep(marker,thisSess)
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
        resloc <- grep("Presentes [0-9]{0,2}",thisRC)
        result <- paste(thisRC[resloc],thisRC[resloc+1],thisRC[resloc+2],thisRC[resloc+3])
        #
        sessRCs$favor[r] <- as.numeric(
                     sub(result,
                     pattern=".*[Ss]� ([0-9]{1,2}).*",
                     replacement="\\1") )
        sessRCs$contra[r] <- as.numeric(
                     sub(result,
                     pattern=".*[Nn]o ([0-9]{1,2}).*",
                     replacement="\\1") )
        sessRCs$absten[r] <- as.numeric(
                     sub(result,
                     pattern=".*[Aa]bstenci�n ([0-9]{1,2}).*",
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
        votStart<-grep("[Aa]bstenci�n [0-9]{1,2}.*",thisRC)+1
#        votEnd<-grep("es [e]{0,1}l[a]{0,1} siguiente",thisRC)-1
        votEnd<-length(thisRC)-2
        votes<-thisRC[votStart:votEnd]
        drop<-grep("ASAMBLEA LEGISLATIVA",votes)
        tmp<-grep("EL C. SECRETARIO",votes); drop<-append(drop,tmp)
        tmp<-grep("LA C. SECRETARIA",votes); drop<-append(drop,tmp)
        tmp<-grep("EL C. PRESIDENTE",votes); drop<-append(drop,tmp)
        tmp<-grep("LA C. PRESIDENTE",votes); drop<-append(drop,tmp)
#        tmp<-grep("�",votes); drop<-append(drop,tmp)
#        tmp<-grep("emitir su vot[oa]",votes); drop<-append(drop,tmp)
#        tmp<-grep("[Mm]esa [Dd]irectiva",votes); drop<-append(drop,tmp)
#        tmp<-grep("el resultado",votes); drop<-append(drop,tmp)
#        tmp<-grep("izquierda[.:]",votes); drop<-append(drop,tmp)
#        tmp<-grep("recoger� la",votes); drop<-append(drop,tmp)
#        tmp<-grep("recoger la",votes); drop<-append(drop,tmp)
        stay<-setdiff(1:length(votes),drop)                         ## saca drop del �ndice
        votes<-votes[stay]
        Ndip<-length(votes)
        for (d in 1:Ndip){
            nom<-sub(votes[d],
                     pattern="(.*)(\\<PAN\\>|\\<PRI\\>|\\<PRD\\>|\\<CPI\\>|\\<PAN\\>|\\<CPSD\\>|\\<PANAL\\>).*",
                     replacement="\\1")
            vo<-sub(votes[d],
                     pattern=".* ([[:alpha:]]*)[.]{0,1}$",
                     replacement="\\1")
            vo <- ifelse(vo=="Abstenci�n",3,ifelse(vo=="S�",1,ifelse(vo=="No",2,vo)))
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
            ## EL ARCHIVO aldf06PropSupNomApell.ods PERMITE A�ADIR "APODOS" NUEVOS
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ALVARADO VILLAZ[�O]N ANA\\>.*", sessLists[d,1,r])=="TRUE", "rp19p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ALVARADO VILLAZ[�O]N FRANCISCO\\>.*", sessLists[d,1,r])=="TRUE", "rp19s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<[�A]LVAREZ ESCUDERO JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "rp04s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<[�A]LVAREZ ROMO LEONARDO\\>.*", sessLists[d,1,r])=="TRUE", "rp17p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ANAYA GONZ[�A]LEZ ORLANDO\\>.*", sessLists[d,1,r])=="TRUE", "rp01s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ARAIZA MOTA ILIANA\\>.*", sessLists[d,1,r])=="TRUE", "mr33s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ARMAS PLUMA ALDO\\>.*", sessLists[d,1,r])=="TRUE", "rp08p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ARRONTE OLGU[�I]N MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "mr20s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ARZATE FLORES JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "rp15s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<AUS DEN RUTHEN ARNE\\>.*", sessLists[d,1,r])=="TRUE", "mr14s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<AVILA LUNA PATRICIO\\>.*", sessLists[d,1,r])=="TRUE", "mr06s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<[�A]VILA ROJAS SERGIO\\>.*", sessLists[d,1,r])=="TRUE", "mr34p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<BELTR[�A]N CORDERO JUAN\\>.*", sessLists[d,1,r])=="TRUE", "mr28p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<BONILLA CEDILLO JACOBO\\>.*", sessLists[d,1,r])=="TRUE", "rp13p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<BRAVO L[�O]PEZ HIP[�O]LITO\\>.*", sessLists[d,1,r])=="TRUE", "mr37p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<BUSTOS PASCUAL JUAN\\>.*", sessLists[d,1,r])=="TRUE", "mr06p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<CA�IZO CUEVAS GLORIA\\>.*", sessLists[d,1,r])=="TRUE", "rp21p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<C[�A]RDENAS S[�A]NCHEZ NANCY\\>.*", sessLists[d,1,r])=="TRUE", "mr36p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<CASTILLA MARROQU[�I]N AGUST[�I]N\\>.*", sessLists[d,1,r])=="TRUE", "rp07p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<CEDILLO FERN[�A]NDEZ SERGIO\\>.*", sessLists[d,1,r])=="TRUE", "mr24p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<CER[�O]N MART[�I]NEZ M[�A]XIMO\\>.*", sessLists[d,1,r])=="TRUE", "mr05s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<C[�I]RIGO V[�A]ZQUEZ V[�I]CTOR\\>.*", sessLists[d,1,r])=="TRUE", "mr22p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<CORONADO ORTIZ CARLOS\\>.*", sessLists[d,1,r])=="TRUE", "mr18s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<CUEVAS MORANCHEL FERNANDO\\>.*", sessLists[d,1,r])=="TRUE", "rp12s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<DAMI[�A]N PERALTA ESTHELA\\>.*", sessLists[d,1,r])=="TRUE", "mr11p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<D[�I]AZ CUERVO JORGE\\>.*", sessLists[d,1,r])=="TRUE", "rp25p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ERRASTI ARANGO MIGUEL\\>.*", sessLists[d,1,r])=="TRUE", "rp05p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ESPINO AR[�E]VALO FERNANDO\\>.*", sessLists[d,1,r])=="TRUE", "rp22p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ESQUIVEL CARRILLO JES[�U]S\\>.*", sessLists[d,1,r])=="TRUE", "mr40s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GARC[�I]A HERN[�A]NDEZ JUAN\\>.*", sessLists[d,1,r])=="TRUE", "mr18p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GARC[�I]A AYALA MARCO\\>.*", sessLists[d,1,r])=="TRUE", "rp18p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GARC[�I]A VILLARREAL MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "rp22s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GARFIAS MALDONADO MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "mr19p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GAZC[�O]N L[�O]PEZ CANO SILVIA\\>.*", sessLists[d,1,r])=="TRUE", "rp18s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<G[�O]MEZ VALENZUELA MIRIAM\\>.*", sessLists[d,1,r])=="TRUE", "mr34s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<G[�O]MEZ G[�O]MEZ CARLOS\\>.*", sessLists[d,1,r])=="TRUE", "rp26s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GONZ[�A]LEZ DEL ANGEL RICARDO\\>.*", sessLists[d,1,r])=="TRUE", "mr13s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GONZ[�A]LEZ CASE ARMANDO\\>.*", sessLists[d,1,r])=="TRUE", "rp20p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<GUERRERO CASTILLO AGUST[�I]N\\>.*", sessLists[d,1,r])=="TRUE", "mr13p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ CASTILLA MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "mr12s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ ABARCA SAMUEL\\>.*", sessLists[d,1,r])=="TRUE", "mr29p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ HERN[�A]NDEZ MIGUEL\\>.*", sessLists[d,1,r])=="TRUE", "mr30s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ LEAL JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "mr32s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ  ANGELINA\\>.*", sessLists[d,1,r])=="TRUE", "mr35s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ VALENT[�I]N JUAN\\>.*", sessLists[d,1,r])=="TRUE", "mr36s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ MIR[�O]N CARLOS\\>.*", sessLists[d,1,r])=="TRUE", "mr40p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ LABASTIDA RAM[�O]N\\>.*", sessLists[d,1,r])=="TRUE", "rp04p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERN[�A]NDEZ SALGADO OSCAR\\>.*", sessLists[d,1,r])=="TRUE", "rp23s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<HERRERA ESPINOSA RA[�U]L\\>.*", sessLists[d,1,r])=="TRUE", "rp02s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<JIM[�E]NEZ L[�O]PEZ RAM[�O]N\\>.*", sessLists[d,1,r])=="TRUE", "mr01p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<JIM[�E]NEZ BURGOS JAIME\\>.*", sessLists[d,1,r])=="TRUE", "mr24s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<JIM[�E]NEZ BARR[I]{0,1}OS SERGIO\\>.*", sessLists[d,1,r])=="TRUE", "rp16s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<KURI LORENZO MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "rp21s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<LIMA BARRIOS ANTONIO\\>.*", sessLists[d,1,r])=="TRUE", "mr02p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<L[�O]PEZ RABAD[�A]N KENIA\\>.*", sessLists[d,1,r])=="TRUE", "rp01p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MACARENO MEJ[�I]A LEONARDO\\>.*", sessLists[d,1,r])=="TRUE", "rp24s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MART[�I]NEZ SOLANO JAVIER\\>.*", sessLists[d,1,r])=="TRUE", "mr07s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MART[�I]NEZ FISHER MARGARITA\\>.*", sessLists[d,1,r])=="TRUE", "mr14p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MART[�I]NEZ ARTURO RES[�E]NDIZ\\>.*", sessLists[d,1,r])=="TRUE", "mr16s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MART[�I]NEZ CAPACETA EMMA\\>.*", sessLists[d,1,r])=="TRUE", "mr27s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MART[�I]NEZ DELLA ROCCA SALVADOR\\>.*", sessLists[d,1,r])=="TRUE", "mr38p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MECHG[�U]N GONZ[�A]LEZ JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "mr37s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<M[�E]NDEZ GALV[�A]N MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "mr28s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<M[�E]NDEZ RANGEL AVELINO\\>.*", sessLists[d,1,r])=="TRUE", "mr39p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MENDOZA ROMERO IMELDA\\>.*", sessLists[d,1,r])=="TRUE", "mr08p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MENDOZA BAUTISTA CECILIA\\>.*", sessLists[d,1,r])=="TRUE", "rp05s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MORGAN COL[�O]N HUMBERTO\\>.*", sessLists[d,1,r])=="TRUE", "mr25p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MOR[�U]A JASSO JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "mr32p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MU�OZ SANTINI INTI\\>.*", sessLists[d,1,r])=="TRUE", "mr38s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<MURILLO MENDOZA ELVIRA\\>.*", sessLists[d,1,r])=="TRUE", "rp08s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<NOLASCO OCHOA HILARIO\\>.*", sessLists[d,1,r])=="TRUE", "mr19s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<NORBERTO S[�A]NCHEZ NAZARIO\\>.*", sessLists[d,1,r])=="TRUE", "mr07p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<N[�U]�EZ L[�O]PEZ LORENA\\>.*", sessLists[d,1,r])=="TRUE", "rp13s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<OLAVARRIETA MALDONADO MART[�I]N\\>.*", sessLists[d,1,r])=="TRUE", "rp16p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ORD[�O]�EZ HERN[�A]NDEZ DANIEL\\>.*", sessLists[d,1,r])=="TRUE", "mr15p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<OROZCO CARMONA JUAN\\>.*", sessLists[d,1,r])=="TRUE", "mr15s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ORTEGA GONZ[�A]LEZ ANDREA\\>.*", sessLists[d,1,r])=="TRUE", "mr21s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ORTIZ PI�A EDY\\>.*", sessLists[d,1,r])=="TRUE", "mr35p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<PARADA ORTEGA REBECA\\>.*", sessLists[d,1,r])=="TRUE", "rp24p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<PATRICIO RAZO MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "mr26s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<PE�A GARAVITO JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "rp17s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<PERALTA VAQUEIRO MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "rp15p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<P[�E]REZ CORREA ENRIQUE\\>.*", sessLists[d,1,r])=="TRUE", "rp26p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<PI�A OLMEDO LAURA\\>.*", sessLists[d,1,r])=="TRUE", "mr12p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<PLIEGO CALVO TOM[�A]S\\>.*", sessLists[d,1,r])=="TRUE", "mr10p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<QUEZADA CONTRERAS LETICIA\\>.*", sessLists[d,1,r])=="TRUE", "mr33p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<QUI�[�O]NE[ZS] CORNEJO MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "rp09p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<RAM[�I]REZ PINO JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "mr09p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<RAM[�I]REZ RODR[�I]GUEZ RA[�U]L\\>.*", sessLists[d,1,r])=="TRUE", "mr21p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<RAM[�I]REZ DEL VALLE DANIEL\\>.*", sessLists[d,1,r])=="TRUE", "rp11p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<REBOLLO AGUILAR CAROLINA\\>.*", sessLists[d,1,r])=="TRUE", "mr17s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<R[�E]TIZ GUTI[�E]RREZ EZEQUIEL\\>.*", sessLists[d,1,r])=="TRUE", "mr27p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<REYES AGUIRRE MARGARITO\\>.*", sessLists[d,1,r])=="TRUE", "mr29s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ANTONIO LE[�O]N RICARDO\\>.*", sessLists[d,1,r])=="TRUE", "mr16p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<RIVERA HERN[�A]NDEZ MARA\\>.*", sessLists[d,1,r])=="TRUE", "rp07s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ROCHA CRUZ LUIS\\>.*", sessLists[d,1,r])=="TRUE", "mr25s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ROMERO L[�O]PEZ OSCAR\\>.*", sessLists[d,1,r])=="TRUE", "mr03s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ROMERO MALDONADO AAR[�O]N\\>.*", sessLists[d,1,r])=="TRUE", "mr04s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ROMERO HERRERA JORGE\\>.*", sessLists[d,1,r])=="TRUE", "rp10p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ROSALES ROMERO MART[�I]N\\>.*", sessLists[d,1,r])=="TRUE", "mr39s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<RUBIO ALDAR[�A]N ELEAZAR\\>.*", sessLists[d,1,r])=="TRUE", "mr01s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<RUIZ AGUILAR BRENDA\\>.*", sessLists[d,1,r])=="TRUE", "rp11s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SAAVEDRA ORTEGA CELINA\\>.*", sessLists[d,1,r])=="TRUE", "rp06p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SALAZAR N[�U]�EZ DANIEL\\>.*", sessLists[d,1,r])=="TRUE", "mr23p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<S[�A]NCHEZ CABRERA MARICELA\\>.*", sessLists[d,1,r])=="TRUE", "mr11s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SANCHEZARMAS GARC[�I]A CARLA\\>.*", sessLists[d,1,r])=="TRUE", "rp25s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SANTANA ALFARO ARTURO\\>.*", sessLists[d,1,r])=="TRUE", "mr26p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SANTIB[�A]�EZ CALZADILLA FRANCISCO\\>.*", sessLists[d,1,r])=="TRUE", "rp06s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SCHIAFFINO ISUNZA JORGE\\>.*", sessLists[d,1,r])=="TRUE", "rp14p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SEGURA RANGEL MAR[�I]A\\>.*", sessLists[d,1,r])=="TRUE", "rp02p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SOSA TAN MIGUEL\\>.*", sessLists[d,1,r])=="TRUE", "mr31p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<SOTO MALDONADO PAULA\\>.*", sessLists[d,1,r])=="TRUE", "rp12p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<T[�E]LLEZ S[�A]NCHEZ ALICIA\\>.*", sessLists[d,1,r])=="TRUE", "rp14s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TENORIO ANTIGA XIUH\\>.*", sessLists[d,1,r])=="TRUE", "rp23p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TOLEDO GUTI[�E]RREZ MAURICIO\\>.*", sessLists[d,1,r])=="TRUE", "mr30p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TORRES BALTAZAR EDGAR\\>.*", sessLists[d,1,r])=="TRUE", "mr08s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TORRES QUIROZ GUILLERMO\\>.*", sessLists[d,1,r])=="TRUE", "rp09s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TRIANA TENA JORGE\\>.*", sessLists[d,1,r])=="TRUE", "rp03p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TRILLO DOM[�I]NGUEZ JUAN\\>.*", sessLists[d,1,r])=="TRUE", "mr31s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<TRUJILLO V[�A]ZQUEZ ABRIL\\>.*", sessLists[d,1,r])=="TRUE", "mr23s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<UGALDE MOLINA RODRIGO\\>.*", sessLists[d,1,r])=="TRUE", "mr09s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VALDEZ MEDINA DIEGO\\>.*", sessLists[d,1,r])=="TRUE", "rp20s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VARGAS ANAYA ENRIQUE\\>.*", sessLists[d,1,r])=="TRUE", "mr03p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VARGAS CORT[�E]Z BALFRE\\>.*", sessLists[d,1,r])=="TRUE", "mr05p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VERDERI MU�[�U]ZURI FERNANDA\\>.*", sessLists[d,1,r])=="TRUE", "rp10s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VILLA GONZ[�A]LEZ ISA[�I]AS\\>.*", sessLists[d,1,r])=="TRUE", "mr04p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VILLALUZ ALBA YESENIA\\>.*", sessLists[d,1,r])=="TRUE", "rp03s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<VINALAY MORA ALFREDO\\>.*", sessLists[d,1,r])=="TRUE", "mr20p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ZAMORA FLORES ARTURO\\>.*", sessLists[d,1,r])=="TRUE", "mr10s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ZAMORA GRANADOS MARIBEL\\>.*", sessLists[d,1,r])=="TRUE", "mr22s", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<ZEPEDA SEGURA JOS[�E]\\>.*", sessLists[d,1,r])=="TRUE", "mr17p", sessLists[d,3,r] )
            sessLists[d,3,r] <- ifelse ( grepl(pattern=".*\\<Z[�U]�IGA ORTIZ ROC[�I]O\\>.*", sessLists[d,1,r])=="TRUE", "mr02s", sessLists[d,3,r] )
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
#yr<-NULL; mo<-NULL; dy<-NULL
#attach(RCs)
#RCs <- RCs[order(yr,mo,dy,folio),]
#detach("RCs")
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
#
RCsTwo<-RCs
RCsUTwo<-RCsU
#
save(RCsTwo, RCsUTwo, file=("tmp.RData"))

#END

tmp<-load(file="tmp.RData")


RCs[,1:12]

## Hay que pegarle el vector de nombres antes de eliminar las columnas de diputados que nunca tomarios posesi�n


#LO DE ABAJO DETECTA CASOS EN QUE HAY M�S DE 132 DIPUTADOS EN VOTARON+FALTARON

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

#ewiwjeweiowueiwueiwueiwueiwueiuwieuwieuiwueiwueiwueiwueiwueiwuekiqweaqw�jeq�we

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

