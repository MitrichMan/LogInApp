//
//  User.swift
//  LogInApp
//
//  Created by Dmitrii Melnikov on 16.02.2023.
//

struct User {
    let logIn: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            logIn: "User",
            password: "password",
            person: Person.getPersonData()
        )
    }
}

struct Person {
    var name: String
    let dateOfBirth: String
    let city: String
    let sex: String
    let status: String
    let occupation: String
    let legends: [Legend]
    let images: [Image]
    
    static func getPersonData() -> Person {
        Person(
            name: "Дмитрий Мельников",
            dateOfBirth: "19.10.1988",
            city: "Владивосток",
            sex: "Мужской",
            status: "Женат",
            occupation: "Крановщик",
            legends: [
                .init(destination: .bio, text: """
        Привет, меня зовут Дима. Я родился и вырос в городе Владивосток в Приморском крае. Учился в школе с углубленным английским. После школы пошёл в музыкальное училище. Моя жизнь была полна рок-н-ролла, в связи с чем я только недавно созрел на высшее образование. Сейчас я учусь на третьем курсе по специальности «Строительство». Я всегда любил созидать. Программирование для меня тоже является своего рода созиданием. Я полюбил его ещё когда в далеком 2006 году писал сайт для своей музыкальной группы в блокноте. И вот, к чему это привело.
        """),
                .init(destination: .occupation, text: """
        Во время учебы в музыкальном училище я начал самостоятельно зарабатывать себе на жизнь. Начал я с работы барменом. После этого я поменял достаточно много профессий в поисках себя. В 2014 году, переосмыслив свою жизнь и решив оставить музыку как хобби, я пошёл учиться на машиниста башенного крана. Впервые забравшись на кран во время учебной практики, я понял, что в этой профессии мне стоит задержаться. За 8 лет работы я построил большое количество объектов, воспитал с десяток учеников и создал сильное сообщество крановщиков в моем городе, которое достигло того, чего никто бы не смог достигнуть в одиночку.
        """),
                .init(destination: .creation, text: """
        Классе примерно в пятом я записался в кружок гитары, который находился в подсобном помещении моей школы. Второе занятие стало последним. На него пришёл выпускник, и попросил у преподавателя поиграть на барабанах. С тех пор, как я это увидел вживую, ни о какой гитаре не могло быть и речи. К сожалению барабаны у нас не преподавали, и на время эта идея встала на паузу. Но в 2002 году, спустя 4 года, мои одноклассники решили собрать группу с нуля. С тех пор барабаны плотно вошли в мою жизнь. После школы я продолжил играть в разных группах, в разных стилях. Получился в музыкальном училище 3 года, С развитием интернета начал выискивать новые для меня материалы и самоучители. И вот я играю уже 21 год. Сейчас мы в процессе подготовки первого релиза с моим коллективом. Некоторые наши треки уже есть на стриминговых сервисах. И конечно же у меня не стояло вопроса о том, каким будет мой пет проект. Это будет то, чего мне всегда не хватало. Я создам виртуального тренера по игре на барабанах.
        """),
                .init(destination: .activity, text:  """
        Про сноуборд:
        Я впервые встал на доску году наверное в 2002-2003 году. Я всегда засматривался на видео со скейтерами и сноубордистами. Первую доску я купил с рук за 1500₽. Это была старая японская доска с креплениями, которые очень хорошо подходили к камелотам. Такие же доски были у моих друзей. Всю зиму мы проводили в парке рядом с домом, копали трамплины и носили лопатами снег, когда «трассу» скатывали до земли. С тех пор я катаюсь каждую зиму. Не представляю, чем ещё заниматься в свободное время))
        
        Про серфинг:
        Первый мой сёрфинг случился в 19 году. Это как наркотик. Я не мог перестать о нем думать. Живя в городе у моря, с наличием спотов и кучей знакомых, связанных с различными досками, я не знаю, почему я не пришёл к этому раньше. Это восхитительно. Мама, я буду сёрфером🤙🏻
        """)
            ],
            images: [
                .init(destination: .aboutMe, name: ["pic1"]),
                .init(destination: .occupation, name: ["pic2"]),
                .init(destination: .creation, name: ["pic3"]),
                .init(destination: .activity, name: ["pic4", "pic5"])
            ]
        )
    }
}
struct Legend {
    let destination: ViewControllerIdentifier
    let text: String
}

struct Image {
    let destination: ViewControllerIdentifier
    let name: [String]
}

