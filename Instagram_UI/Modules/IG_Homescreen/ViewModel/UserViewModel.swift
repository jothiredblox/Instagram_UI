import Combine

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    private var currentPage = 1
    private let pageSize = 10
    
    func loadUsers() {
        guard !isLoading else { return }
        
        isLoading = true
        fetchUsers(page: currentPage, pageSize: pageSize)
    }
    
    private func fetchUsers(page: Int, pageSize: Int) {
        // Simulate a network request or API call with fake data
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let newUsers = generateFakeUsers(count: pageSize)
            
            DispatchQueue.main.async {
                self.users.append(contentsOf: newUsers)
                self.isLoading = false
                self.currentPage += 1
            }
        }
    }
}
