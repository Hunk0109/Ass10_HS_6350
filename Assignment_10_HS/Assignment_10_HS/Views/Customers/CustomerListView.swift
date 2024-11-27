import SwiftUI

struct CustomerListView: View {
    @StateObject private var viewModel = CustomerViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredCustomers) { customer in
                NavigationLink(destination: CustomerDetailView(customer: customer)) {
                    HStack {
                        AsyncImage(url: URL(string: customer.profilePictureURL)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text(customer.name)
                                .font(.headline)
                            Text("Age: \(customer.age)")
                                .font(.subheadline)
                        }
                    }
                }
            }
            .navigationTitle("Customers")
            .searchable(text: $viewModel.searchText)
        }
        .onAppear {
            viewModel.fetchCustomers()
        }
    }
}
