import Foundation

class MockAPI {
    static let shared = MockAPI()
    
    private init() {}

    // Fetch Customers from Mock API
    func fetchCustomers(completion: @escaping ([Customer]) -> Void) {
        guard let url = URL(string: "https://673fe514d0b59228b7ee1189.mockapi.io/Customer") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching customers: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let customers = try JSONDecoder().decode([Customer].self, from: data)
                DispatchQueue.main.async {
                    completion(customers)
                }
            } catch {
                print("Error decoding customers: \(error.localizedDescription)")
            }
        }.resume()
    }

    // Fetch Policies from Mock API
    func fetchPolicies(completion: @escaping ([Policy]) -> Void) {
        guard let url = URL(string: "https://673fe514d0b59228b7ee1189.mockapi.io/Policies") else {
            print("Invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching policies: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let policies = try JSONDecoder().decode([Policy].self, from: data)
                DispatchQueue.main.async {
                    completion(policies)
                }
            } catch {
                print("Error decoding policies: \(error.localizedDescription)")
            }
        }.resume()
    }
}

