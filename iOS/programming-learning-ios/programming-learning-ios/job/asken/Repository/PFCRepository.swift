import Foundation

protocol PFCRepositoryProtocol {
    func toCalorie(nutrients: Nutrients) -> Int
}

struct PFCRepository: PFCRepositoryProtocol {
    func toCalorie(nutrients: Nutrients) -> Int {
        let roundedCalorie = (nutrients.gram * nutrients.caloriePerGram).rounded()
        return Int(roundedCalorie)
    }
}

