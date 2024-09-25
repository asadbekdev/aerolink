import SwiftUI

struct ContentView: View {
    @State private var esimItems: [ESIMItem] = [
        ESIMItem(country: "USA", provider: "AT&T", dataAmount: "5GB", price: 19.99, validityPeriod: "30 days"),
        ESIMItem(country: "Japan", provider: "Docomo", dataAmount: "3GB", price: 24.99, validityPeriod: "15 days"),
        // Add more sample items as needed
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(esimItems) { item in
                    ESIMItemRow(item: item)
                }
            }
            .navigationTitle("Available eSIMs")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }
    
    private func addItem() {
        // Implement adding new eSIM item logic here
    }
}

struct ESIMItemRow: View {
    let item: ESIMItem
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(item.country)
                .font(.headline)
            HStack {
                Text(item.provider)
                Spacer()
                Text(item.dataAmount)
            }
            .font(.subheadline)
            HStack {
                Text("$\(item.price, specifier: "%.2f")")
                Spacer()
                Text(item.validityPeriod)
            }
            .font(.caption)
        }
    }
}
