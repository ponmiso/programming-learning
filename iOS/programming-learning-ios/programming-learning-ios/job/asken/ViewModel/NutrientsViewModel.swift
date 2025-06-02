struct NutrientsViewModel {
    let repository: NutrientsRepositoryProtocol
    init(repository: NutrientsRepositoryProtocol) {
        self.repository = repository
    }

    var nattoRiceCalorie: Int {
        let rice = Ingredients(protein: Protein(gram: 2.5),
                               fat: Fat(gram: 0.3),
                               carbohydrate: Carbohydrate(gram: 37.1))
        let natto = Ingredients(protein: Protein(gram: 16.5),
                                fat: Fat(gram: 10.0),
                                carbohydrate: Carbohydrate(gram: 12.1))
        let riceCalorie = repository.toCalorie(ingredients: rice)
        let nattoCalorie = repository.toCalorie(ingredients: natto)
        return riceCalorie + nattoCalorie
    }
}
