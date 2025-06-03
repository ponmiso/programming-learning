import Testing
@testable import programming_learning_ios

struct NutrientsTests {
    // MARK: - 問題1のテスト
    
    /// 各栄養素のグラムと総カロリーの計算結果のリスト
    ///
    /// - 同値分割として、0（カロリー計算しても0になる）・1（整数）・10.1（小数）をチェックしている
    /// - 異常値としてマイナスの値（-1）をチェックしている
    /// - グラム数は小数点第二位で四捨五入するので、10.44・10.45をチェックしている
    /// - カロリーは小数点第一位で四捨五入し整数となるため、プロテインの10.1と10.44でそれぞれ切り捨てと切り上げをチェックしている
    private static let nutrientsList: [(nutrients: Nutrients, result: Int)] = [
        (Protein(gram: -1), 0),
        (Protein(gram: 0), 0),
        (Protein(gram: 1), 4),
        (Protein(gram: 10.1), 40),
        (Protein(gram: 10.44), 42),
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
        
        // 納豆ご飯の総カロリーだけだと、納豆と白米の総カロリーがそれぞれ間違っている可能性があるため
        // 納豆・白米それぞれの総カロリーもチェックする
        #expect(viewModel.nattoRiceCalorie == riceCalorie + nattoCalorie)
        #expect(viewModel.riceCalorie == riceCalorie)
        #expect(viewModel.nattoCalorie == nattoCalorie)
    }
}
