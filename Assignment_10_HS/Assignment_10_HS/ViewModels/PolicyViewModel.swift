import SwiftUI

class PolicyViewModel: ObservableObject {
    @Published var policies: [Policy] = []
    @Published var searchText = ""
    
    var filteredPolicies: [Policy] {
        if searchText.isEmpty {
            return policies
        } else {
            return policies.filter { $0.type.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func fetchPolicies() {
        guard let url = URL(string: "https://673fe514d0b59228b7ee1189.mockapi.io/Policies") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                if let decodedPolicies = try? JSONDecoder().decode([Policy].self, from: data) {
                    DispatchQueue.main.async {
                        self.policies = decodedPolicies
                    }
                }
            }
        }.resume()
    }
}
