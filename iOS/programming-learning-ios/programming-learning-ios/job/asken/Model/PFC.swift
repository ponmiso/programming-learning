protocol PFC {
    /// グラム(g)
    var gram: Double { get }
    /// 1グラム(g)あたりのカロリー(kcal)
    var caloriePerGram: Double { get }
}

/// タンパク質
struct Protein: PFC {
    let gram: Double
    var caloriePerGram: Double {
        4.0
    }
}

/// 脂質
struct Fat: PFC {
    let gram: Double
    var caloriePerGram: Double {
        9.0
    }
}

/// 炭水化物
struct Carbohydrate: PFC {
    let gram: Double
    var caloriePerGram: Double {
        4.0
    }
}
