/// 栄養素
protocol Nutrients {
    /// グラム(g)
    var gram: Double { get }
    /// 1グラム(g)あたりのカロリー(kcal)
    var caloriePerGram: Double { get }
}

extension Nutrients {
    /// 小数第一位 (小数第二位を四捨五入)に変換したグラム(g)
    var roundedGram: Double {
        (gram * 10).rounded() / 10
    }
}

/// タンパク質
struct Protein: Nutrients {
    let gram: Double
    var caloriePerGram: Double {
        4.0
    }
}

/// 脂質
struct Fat: Nutrients {
    let gram: Double
    var caloriePerGram: Double {
        9.0
    }
}

/// 炭水化物
struct Carbohydrate: Nutrients {
    let gram: Double
    var caloriePerGram: Double {
        4.0
    }
}
