//
//  Recents.swift
//  TrackIt-ExpenseTracker
//
//  Created by Shivam Sultaniya on 10/06/24.
//

import SwiftUI

struct Recents: View {
    
    @State var startDate: Date = .now.startOfMonth
    @State var endDate: Date = .now.endOfMonth
    @State var selectedCategory: Category = .expense
    
    @Namespace private var animation
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical){
                LazyVStack(spacing:10, pinnedViews: [.sectionHeaders]){
                    Section {
                        //Date filter Button
                        Button(action: {
                            
                        }, label: {
                            Text("\(format(date: startDate, format: "dd MMM yy")) to \(format(date: endDate, format: "dd MMM yy"))")
                                .font(.callout)
                                .foregroundStyle(.gray)
                        })
                        .hSpacing(alignment: .leading)
                        
                        //Card View
                        CardView(income: 10000, expense: 5000)
                            .padding(.bottom,7)
                        
                        //Custom Segmented Control
                        CustomSegmentedControl()
                            .padding(.bottom,7)
                        
                        //Transaction Card View
                        ForEach(sampleTransactions.filter( { $0.category == selectedCategory.rawValue } )){ transaction in
                            TransactionCardView(transaction: transaction)
                        }
                        
                    } header: {
                        HeaderView()
                    }

                }
                .padding(15)
            }
            .background(.gray.opacity(0.15))
        }
    }
    
    @ViewBuilder
    func HeaderView() -> some View{
        HStack{
            VStack(alignment:.leading, spacing: 5){
                Text("Welcome")
                    .font(.title.bold())
                Text("Shivam")
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            NavigationLink {
                //
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(.blue, in: .circle)
            }

        }
        .hSpacing(alignment: .leading)
    }
    
    @ViewBuilder
    func CustomSegmentedControl() -> some View{
        HStack{
            ForEach(Category.allCases, id: \.rawValue){category in
                Text(category.rawValue)
                    .hSpacing()
                    .padding(.vertical,10)
                    .background{
                        if category == selectedCategory{
                            Capsule()
                                .fill(.background)
                                .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                        }
                    }
                    .contentShape(.capsule)
                    .onTapGesture {
                        withAnimation(.snappy){
                            selectedCategory = category
                        }
                    }
            }
        }
        .background(.gray.opacity(0.15), in: .capsule)
    }
}

#Preview {
    Recents()
}
