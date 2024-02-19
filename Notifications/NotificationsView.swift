//
//  NotificationsView.swift
//  songcreator
//
//  Created by Sean Meek on 1/7/24.
//

import SwiftUI

struct NotificationsView: View {
    @State private var selection: Int = 0
    @Namespace private var pickerTabs
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Button {
                        withAnimation(.linear) {
                            selection = 0
                        }
                    } label: {
                        ZStack {
                            if selection == 0 {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.purple)
                                    .matchedGeometryEffect(id: "tabs", in: pickerTabs)
                            } else {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(Color(UIColor.secondarySystemBackground))
                            }
                            
                            Text("Alerts")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        withAnimation(.linear) {
                            selection = 1
                        }
                    } label: {
                        ZStack {
                            if selection == 1 {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundStyle(.purple)
                                    .matchedGeometryEffect(id: "tabs", in: pickerTabs)
                            } else {
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(Color(UIColor.secondarySystemBackground))
                            }
                            
                            Text("Messages")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxHeight: 40)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                if selection == 0 {
                    List {
                        ForEach(0..<35) { notification in
                            NotificationsCell()
                                .padding(.vertical, 3)
                                .swipeActions {
                                    Button(role: .destructive) {
                                        print("Deleted")
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                            .foregroundStyle(.white)
                                    }
                                }
                        }
                    }
                    .transition(.backslide)
                    .refreshable {
                        print("Refreshed")
                    }
                    .listStyle(.plain)
                    .navigationTitle("Notifications")
                    .navigationBarTitleDisplayMode(.inline)
                } else if selection == 1 {
                    MessageListView()
                        .transition(.slide)
                }
            }
        }
    }
}

#Preview {
    NotificationsView()
}
