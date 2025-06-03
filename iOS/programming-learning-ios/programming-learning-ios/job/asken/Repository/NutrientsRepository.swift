import Foundation

protocol NutrientsRepositoryProtocol {
    func toCalorie(foodNutrients: FoodNutrients) -> Int
    func toCalorie(nutrients: Nutrients) -> Int
}

struct NutrientsRepository: NutrientsRepositoryProtocol {
    func toCalorie(foodNutrients: FoodNutrients) -> Int {
        let proteinCalorie = toCalorie(nutrients: foodNutrients.protein)
        let fatCalorie = toCalorie(nutrients: foodNutrients.fat)
        let carbohydrateCalorie = toCalorie(nutrients: foodNutrients.carbohydrate)
        return proteinCalorie + fatCalorie + carbohydrateCalorie
    }
    
    func toCalorie(nutrients: Nutrients) -> Int {
        // グラムは小数第二位で四捨五入する
        let roundedGram = (nutrients.gram * 10).rounded() / 10
        let roundedCalorie = (roundedGram * nutrients.caloriePerGram).rounded()
        return Int(roundedCalorie)
    }
}

