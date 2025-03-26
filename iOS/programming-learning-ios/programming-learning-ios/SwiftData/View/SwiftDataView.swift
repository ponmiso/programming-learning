import SwiftData
import SwiftUI

struct SwiftDataView: View {
    @Environment(\.modelContext) private var context

    @Query(sort: \SwiftDataModel.sort)
    private var models: [SwiftDataModel]
    @State private var inputName = ""

    var body: some View {
        VStack {
            List {
                ForEach(models) { model in
                    Text(model.name)
                }
                .onMove { from, to in
                    var orderedModels = models
                    orderedModels.move(fromOffsets: from, toOffset: to)
                    for (index, model) in orderedModels.enumerated() {
                        model.sort = index
                    }
                    try? context.save()
                }
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
