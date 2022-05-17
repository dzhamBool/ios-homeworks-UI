

import Foundation
import UIKit

struct Post {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int

    static func makeMockModel() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "mydiscoveries.ru", description: "«Золотой мост» во Вьетнаме. Дананг — один из самых больших и густонаселенных городов Вьетнама — находится на побережье Южно-Китайского моря. Здешние места отличаются мягким и теплым климатом и имеют все условия, чтобы стать всемирно известным курортом. Но до текущего момента он так и не был избалован вниманием туристов.", image: "zolotoyMostVietnam", likes: 111, views: 150))
        post.append(Post(author: "Батищева Анна (russianyellowpages.us)", description: "КТО ПРОМОКНЕТ СИЛЬНЕЕ ВО ВРЕМЯ ДОЖДЯ? Провели исследование, в котором принимали участие три добровольца. Их одели в одинаковую одежду и перед тем, как выпустит их под дождь, узнали массу их сухой одежды. Первый в дождь шел пешком, второй - бежал трусцой, а третий бежал с максимальной скоростью. Преодолеть в «мокрую погоду» нужно было 1 км. 1-й двигался со скоростью 1м/с, 2-й со скоростью 2 м/с, а 3-й — 6 м/с. И вот все пришли к финишу, и ученые положили на весы мокрую одежду. Вот результаты. Меньше всего промок самый быстрый бегун, второе место занял тот, кто бежал трусцой, а больше всех вымок тот, кто шел пешком.", image: "rain", likes: 70, views: 190))
        post.append(Post(author: "zen.yandex.ru", description: "Таинственный остров, с которого невозможно вернуться. В Кении есть загадочный остров Энваитенет, расположенный на озере Рудольф. Название острова на языке местных племен Луо и Кукуйо переводится как «нет возврата». Этот остров считается проклятым, никто не решается на нем поселиться. Исследователь аномальных зон из Бельгии Александр Ново уверен, что на острове есть портал, через который можно попасть в другое измерение. Именно через него и ушли племя Голубоглазых, пропавшие ученые и молодожены со своими слугами. Но эту версию так же никто не подтвердил.", image: "Ostrov", likes: 200, views: 333))
        post.append(Post(author: "geekville.ru", description: "Стивен Хокинг «Краткая история Времени». Культовый британский физик написал целую серию монументальных трудов об истории Вселенной и сложнейших феноменах времени и пространства, но данная книга наиболее полюбилась широким массам – Хокинг в свойственной себе педантичной манере раскладывает по полочкам вещи, о которых ученые спорят веками. Читается залпом, даже люди, чьи интересы далеки от физики и технических дисциплин называют «Краткую историю Времени» среди наиболее повлиявших на их мировозрение и представления о мире произведений.", image: "history", likes: 374, views: 478))
        return post
    }
}

