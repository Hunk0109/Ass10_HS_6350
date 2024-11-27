import SwiftUI

class CustomerViewModel: ObservableObject {
    @Published var customers: [Customer] = []
    @Published var searchText = ""
    
    var filteredCustomers: [Customer] {
        if searchText.isEmpty {
            return customers
        } else {
            return customers.filter { $0.name.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func fetchCustomers() {
        guard let url = URL(string: "https://673fe514d0b59228b7ee1189.mockapi.io/Customer") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decodedCustomers = try? JSONDecoder().decode([Customer].self, from: data) {
                    DispatchQueue.main.async {
                        self.customers = decodedCustomers
                    }
                }
            }
        }.resume()
    }
}
