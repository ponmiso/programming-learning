import SwiftData
import SwiftUI

struct SwiftDataView: View {
    @Environment(\.modelContext) private var context

    @Query(sort: \SwiftDataModel.created)
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
                context.insert(SwiftDataModel(name: inputName))
                $inputName.wrappedValue = ""
            }
        }
        .padding()
    }
}

#Preview {
    SwiftDataView()
}
