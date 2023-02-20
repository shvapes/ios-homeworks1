//
//  Post.swift
//  Navigation
//
//  Created by Svetlana Portnova on 05.02.2023.
//

import Foundation

struct Post {
//    let title: String
    let author: String
    let description: String
    let image: String
    let likes: Int
    let views: Int
    
    static func makeMockPost() -> [Post] {
        var post = [Post]()
        post.append(Post(author: "Настя", description: "Тонкие блины на молоке — это английский вариант традиционных пышных русских блинов, выпеченных на дрожжах. В Европе блинчики имеют вид тонких, почти прозрачных салфеток. Во Франции их называют «крепы» и подают с сотней разнообразных начинок. Никаких особых уловок в приготовлении нет: чем более жидкое тесто, тем тоньше получается блинчики. Ажурный вариант, в дырочку, получится, если часть молока из рецепта добавить в тесто немного горячим. Перед тем как залить первый блин, следует хорошо прокалить сковороду. Блинчик готов, когда он начинает зарумяниваться до хрустящих краев", image: "Блины", likes: 50, views: 57))
        post.append(Post(author: "Мария", description: "Самые лучшие сырники", image: "Сырники", likes: 100, views: 115))
        post.append(Post(author: "Дарья", description: "Банановые кексы с вишней и кокосом без муки", image: "Кексы", likes: 21, views: 29))
        post.append(Post(author: "Евгений", description: "Классический яблочный пирог", image: "Пирог", likes: 300, views: 376))
        return post
    }
}
