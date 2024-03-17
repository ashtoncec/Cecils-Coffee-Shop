
import SwiftUI

struct UtilitiesView: View {
    @ObservedObject var finances: Finances

    var body: some View {
        ScrollView {
            VStack {
                Text("Profit/Loss Percentage: \(finances.profitOrLossPercentage, specifier: "%.2f")%")
                    .foregroundColor(finances.profitOrLossPercentage > 0 ? .green : (finances.profitOrLossPercentage < 0 ? .red : .blue))
                    .font(.title)
                    .padding()

                Image("DeliciousCoffee")
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 150)
                    .padding(.bottom)

                HStack(spacing: 20) {
                   
                    AsyncImage(url: URL(string: "https://cdnlearnblog.etmoney.com/wp-content/uploads/2023/02/investing-at-market-high-1.jpg")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                        case .failure:
                            Text("Unable to load image.")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 150, height: 150)
                    .clipped()

                    
                    AsyncImage(url: URL(string: "https://blog.tipranks.com/wp-content/uploads/2023/09/shutterstock_1713378805-750x406.jpg")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image.resizable()
                                 .aspectRatio(contentMode: .fill)
                        case .failure:
                            Text("Unable to load image.")
                        @unknown default:
                            EmptyView()
                        }
                    }
                    .frame(width: 150, height: 150)
                    .clipped()
                }
                .padding(.bottom)

                NavigationLink(destination: IncomeView(finances: finances)) {
                    Text("View and Modify Income")
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color.blue.opacity(0.5))
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ExpenseView(finances: finances)) {
                    Text("View and Modify Expense")
                        .foregroundColor(.primary)
                        .padding()
                        .background(Color.red.opacity(0.5))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Utilities")
    }
}
