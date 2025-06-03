import Testing
@testable import programming_learning_ios

struct NutrientsTests {
    // MARK: - 問題1のテスト
    
    /// 各栄養素のグラムと総カロリーの計算結果のリスト
    /// - 異常値：「-1」
    /// - 同値分割：「0」「1」「10.1」
    /// - 四捨五入するとグラム数が変わる値：「10.44」「10.45」
    private static let nutrientsList: [(nutrients: Nutrients, result: Int)] = [
        (Protein(gram: -1), 0),
        (Protein(gram: 0), 0),
        (Protein(gram: 1), 4),
        (Protein(gram: 10.1), 40), // カロリーが四捨五入で切り捨てられる
        (Protein(gram: 10.44), 42), // カロリーが四捨五入で切り上げられる
        (Protein(gram: 10.45), 42),
        (Fat(gram: -1), 0),
        (Fat(gram: 0), 0),
        (Fat(gram: 1), 9),
        (Fat(gram: 10.1), 91),
        (Fat(gram: 10.44), 94),
        (Fat(gram: 10.45), 95),
        (Carbohydrate(gram: -1), 0),
        (Carbohydrate(gram: 0), 0),
        (Carbohydrate(gram: 1), 4),
        (Carbohydrate(gram: 10.1), 40),
        (Carbohydrate(gram: 10.44), 42),
        (Carbohydrate(gram: 10.45), 42),
    ]
    
    @Test("Nutrientsのカロリー計算が正しいこと", arguments: nutrientsList)
    func nutrientsTest(_ arguments: (nutrients: Nutrients, result: Int)) {
        let calorie = NutrientsManager().toCalorie(nutrients: arguments.nutrients)
        #expect(calorie == arguments.result)
    }

    // MARK: - 問題2のテスト
    @Test func 納豆ご飯のカロリーが正しいこと() {
        let viewModel = NutrientsViewModel()
        let riceCalorie = Int(((2.5 * 4.0) + (0.3 * 9.0) + (37.1 * 4.0)).rounded())
        let nattoCalorie = Int(((16.5 * 4.0) + (10.0 * 9.0) + (12.1 * 4.0)).rounded())
        
        // 納豆ご飯の総カロリーと、納豆・白米それぞれの総カロリーが正しいかを確認
        #expect(viewModel.nattoRiceCalorie == riceCalorie + nattoCalorie)
        #expect(viewModel.riceCalorie == riceCalorie)
        #expect(viewModel.nattoCalorie == nattoCalorie)
    }
}
