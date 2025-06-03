import Testing
@testable import programming_learning_ios

struct NutrientsTests {
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
