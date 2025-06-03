struct NutrientsViewModel {
    var nattoRiceCalorie: Int {
        riceCalorie + nattoCalorie
    }
    
    var riceCalorie: Int {
        let rice = FoodNutrients(protein: Protein(gram: 2.5),
                                 fat: Fat(gram: 0.3),
                                 carbohydrate: Carbohydrate(gram: 37.1))
        return NutrientsManager().toCalorie(foodNutrients: rice)
    }
    
    var nattoCalorie: Int {
        let natto = FoodNutrients(protein: Protein(gram: 16.5),
                                  fat: Fat(gram: 10.0),
                                  carbohydrate: Carbohydrate(gram: 12.1))
        return NutrientsManager().toCalorie(foodNutrients: natto)
    }
}
