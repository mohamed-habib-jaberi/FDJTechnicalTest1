//
//  Teams.swift
//  FDJTechnicalTest1
//
//  Created by Jaberi  on 20/04/2024.
//

import Foundation

struct TeamsResponse: Decodable {
    let teams: [Team]
}

struct Team: Decodable, Hashable {
    let idTeam: String
    let strTeam: String
    let strTeamShort: String
    let strLeague: String
    let strTeamLogo: String
   
    init(idTeam: String, strTeam: String, strTeamShort: String, strLeague: String, strTeamLogo: String ) {
        self.idTeam = idTeam
        self.strTeam = strTeam
        self.strTeamShort = strTeamShort
        self.strLeague = strLeague
        self.strTeamLogo = strTeamLogo
    }
}

/*
 "teams":[
       {
          "idTeam":"133704",
          "idSoccerXML":"119",
          "idAPIfootball":"106",
          "intLoved":null,
          "strTeam":"Brest",
          "strTeamShort":"BRS",
          "strAlternate":"Stade Brestois 29",
          "intFormedYear":"1903",
          "strSport":"Soccer",
          "strLeague":"French Ligue 1",
          "idLeague":"4334",
          "strLeague2":"Coupe de France",
          "idLeague2":"4484",
          "strLeague3":"",
          "idLeague3":null,
          "strLeague4":"",
          "idLeague4":null,
          "strLeague5":"",
          "idLeague5":null,
          "strLeague6":"",
          "idLeague6":null,
          "strLeague7":"",
          "idLeague7":null,
          "strDivision":null,
          "strStadium":"Stade Francis-Le Blé",
          "strKeywords":"",
          "strRSS":"",
          "strStadiumThumb":"https:\/\/www.thesportsdb.com\/images\/media\/team\/stadium\/ddrhph1607720300.jpg",
          "strStadiumDescription":"Stade Francis-Le Blé is a multi-use stadium in Brest, France. It is currently used mostly for football matches and is the home stadium of Stade Brestois 29. The stadium is able to hold 15,097 spectators. The stadium is named for Francis Le Blé, former mayor of Brest who died in 1982.",
          "strStadiumLocation":"Brest",
          "intStadiumCapacity":"15097",
          "strWebsite":"www.sb29.bzh",
          "strFacebook":"www.facebook.com\/sb29off",
          "strTwitter":"twitter.com\/SB29officiel",
          "strInstagram":"",
          "strDescriptionEN":"Stade Brestois 29 (commonly referred to as Stade Brest or simply Brest) is a French football club based in Brest. The club was founded in 1903 under the name Armoricaine de Brest and adopted its current name in 1950. Brest currently plays in Ligue 2, the second division in French football. The club plays its home matches at the Stade Francis le Blé, a stadium with a capacity of 15,097.",
          "strDescriptionDE":null,
          "strDescriptionFR":"Le Stade brestois 29 est un club de football français basé à Brest, fondé en 1950 à la suite de la fusion de cinq patronages locaux, dont notamment l'Armoricaine de Brest, fondé en 1903.\r\n\r\nDans ses premières années, le club réalise une montée rapide dans la hiérarchie du football régional, au point d'être promu en championnat de France amateur, troisième échelon du football français, en 1958. Le club intègre la deuxième division en 1970, puis découvre enfin la première division en 1979. Il connaît son apogée sportif entre 1981 et 1991, sous la présidence de François Yvinec, en disputant neuf saisons dans l'élite en dix ans. En 1991, le club est rétrogradé avant de déposer le bilan quelques mois plus tard. Le club ne retrouve la deuxième division qu'en 2004 et la Ligue 1 en 2010. À la fin de la saison 2012-2013, il compte respectivement treize et dix-sept exercices en première et deuxième division française2.\r\n\r\nLe club brestois est présidé depuis le 31 mai 2013 par l'entrepreneur brestois Yvon Kermarec. L'équipe première, qui évolue en Ligue 2, est entraînée par Alex Dupont.",
          "strDescriptionCN":null,
          "strDescriptionIT":"Lo Stade Brestois 29, comunemente noto come Brest, è una società calcistica francese con sede nella città di Brest. Milita nella Ligue 1, la massima serie del campionato francese di calcio.",
          "strDescriptionJP":null,
          "strDescriptionRU":null,
          "strDescriptionES":null,
          "strDescriptionPT":null,
          "strDescriptionSE":null,
          "strDescriptionNL":null,
          "strDescriptionHU":null,
          "strDescriptionNO":null,
          "strDescriptionIL":null,
          "strDescriptionPL":null,
          "strKitColour1":"#ed1c24",
          "strKitColour2":"#ffffff",
          "strKitColour3":"#000000",
          "strGender":"Male",
          "strCountry":"France",
          "strTeamBadge":"https:\/\/www.thesportsdb.com\/images\/media\/team\/badge\/z69be41598797026.png",
          "strTeamJersey":"https:\/\/www.thesportsdb.com\/images\/media\/team\/jersey\/mqrdxq1687203544.png",
          "strTeamLogo":"https:\/\/www.thesportsdb.com\/images\/media\/team\/logo\/pvt5db1607720280.png",
          "strTeamFanart1":"https:\/\/www.thesportsdb.com\/images\/media\/team\/fanart\/oybkzq1607720313.jpg",
          "strTeamFanart2":"https:\/\/www.thesportsdb.com\/images\/media\/team\/fanart\/blyc8p1607720326.jpg",
          "strTeamFanart3":"https:\/\/www.thesportsdb.com\/images\/media\/team\/fanart\/mcv5br1607720337.jpg",
          "strTeamFanart4":"https:\/\/www.thesportsdb.com\/images\/media\/team\/fanart\/klfn8l1607720349.jpg",
          "strTeamBanner":"https:\/\/www.thesportsdb.com\/images\/media\/team\/banner\/7pyfoa1607720364.jpg",
          "strYoutube":"",
          "strLocked":"unlocked"
       },
 */
