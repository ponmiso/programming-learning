import SwiftData
import SwiftUI

struct SwiftDataView: View {
    @Environment(\.modelContext) private var context

    @Query(sort: \SwiftDataModel.sort)
    private var models: [SwiftDataModel]
    @State private var inputName = ""

    var body: some View {
        VStack {
            List(models) { model in
                Text(model.name)
            }
        }
        HStack {
            TextField("Added Name", text: $inputName)
            Button("Add") {
                if inputName.isEmpty { return }

                let sort = models.count
                context.insert(SwiftDataModel(name: inputName, sort: sort))

                $inputName.wrappedValue = ""
            }
        }
        .padding()
    }
}

#Preview {
    SwiftDataView()
}
