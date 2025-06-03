import SwiftUI

struct NutrientsView: View {
    @State private var proteinValue: Double = 0.0
    @State private var fatValue: Double = 0.0
    @State private var carbohydrateValue: Double = 0.0

    private var calorie: Int {
        let rice = FoodNutrients(protein: Protein(gram: proteinValue),
                                 fat: Fat(gram: fatValue),
                                 carbohydrate: Carbohydrate(gram: carbohydrateValue))
        return NutrientsManager().toCalorie(foodNutrients: rice)
    }

    var body: some View {
        VStack {
            nutrientsView(title: "Protein", value: $proteinValue)
            nutrientsView(title: "Fat", value: $fatValue)
            nutrientsView(title: "Carbohydrate", value: $carbohydrateValue)
                .padding(.bottom, 16)

            total()

            Spacer()
        }
        .padding()
    }
    
    private func nutrientsView(title: String, value: Binding<Double>) -> some View {
        HStack {
            Text(title)
                .frame(width: 150, alignment: .leading)
            // TODO: 入力がおかしい...
            TextField("", value: value, format: .number)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.trailing)
        }
    }

    private func total() -> some View {
        Text(verbatim: "総カロリー：\(calorie)")
    }
}

#Preview {
    NutrientsView()
}
