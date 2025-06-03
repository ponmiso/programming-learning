/// 栄養素
protocol Nutrients {
    /// グラム(g)
    var gram: Double { get }
    /// 1グラム(g)あたりのカロリー(kcal)
    var caloriePerGram: Double { get }
}

/// タンパク質
struct Protein: Nutrients {
    let gram: Double
    let caloriePerGram = 4.0
}

/// 脂質
struct Fat: Nutrients {
    let gram: Double
    let caloriePerGram = 9.0
}

/// 炭水化物
struct Carbohydrate: Nutrients {
    let gram: Double
    let caloriePerGram = 4.0
}
