import SwiftUI

struct PolicyListView: View {
    @StateObject private var viewModel = PolicyViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.filteredPolicies) { policy in
                NavigationLink(destination: PolicyDetailView(policy: policy)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(policy.type)
                                .font(.headline)
                            Text("Premium: $\(policy.premium)")
                                .font(.subheadline)
                        }
                        Spacer()
                        Image(systemName: policy.iconName)
                            .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Policies")
            .searchable(text: $viewModel.searchText)
        }
        .onAppear {
            viewModel.fetchPolicies()
        }
    }
}
