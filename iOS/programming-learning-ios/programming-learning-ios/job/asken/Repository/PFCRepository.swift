import Foundation

protocol PFCRepositoryProtocol {
    func toCalorie(pfc: PFC) -> Int
}

struct PFCRepository: PFCRepositoryProtocol {
    func toCalorie(pfc: PFC) -> Int {
        let roundedCalorie = (pfc.gram * pfc.caloriePerGram).rounded()
        return Int(roundedCalorie)
    }
}

