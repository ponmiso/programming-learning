import Foundation

protocol NutrientsRepositoryProtocol {
    func toCalorie(ingredients: Ingredients) -> Int
    func toCalorie(nutrients: Nutrients) -> Int
}

struct NutrientsRepository: NutrientsRepositoryProtocol {
    func toCalorie(ingredients: Ingredients) -> Int {
        let proteinCalorie = toCalorie(nutrients: ingredients.protein)
        let fatCalorie = toCalorie(nutrients: ingredients.fat)
        let carbohydrateCalorie = toCalorie(nutrients: ingredients.carbohydrate)
        return proteinCalorie + fatCalorie + carbohydrateCalorie
    }
    
    func toCalorie(nutrients: Nutrients) -> Int {
        let roundedCalorie = (nutrients.roundedGram * nutrients.caloriePerGram).rounded()
        return Int(roundedCalorie)
    }
}

