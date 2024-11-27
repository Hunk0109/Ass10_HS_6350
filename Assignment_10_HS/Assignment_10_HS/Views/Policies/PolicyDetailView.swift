import SwiftUI

struct PolicyDetailView: View {
    let policy: Policy
    
    var body: some View {
        VStack {
            Image(systemName: policy.iconName)
                .font(.system(size: 100))
                .foregroundColor(.blue)
            
            Text(policy.type)
                .font(.title)
            Text("Premium: $\(policy.premium)")
                .font(.headline)
        }
        .navigationTitle("Policy Details")
    }
}
