import SwiftUI

struct CustomerDetailView: View {
    let customer: Customer
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: customer.profilePictureURL)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            
            Text(customer.name)
                .font(.title)
            Text("Age: \(customer.age)")
                .font(.headline)
        }
        .navigationTitle("Customer Details")
    }
}
