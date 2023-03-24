//
//  UserDetailView.swift
//  apitest
//
//  Created by Stanis Humez on 24/03/2023.
//

import Foundation
import SwiftUI
import MapKit

struct UserDetailView: View {
    @State var user: User
    
    func randomColors() -> [Color] {
        let colors: [Color] = [.red, .blue, .brown, .cyan, .gray, .green, .indigo, .mint, .orange, .pink, .purple, .teal, .yellow]
        return [colors.randomElement()!, colors.randomElement()!]
    }
    var body: some View {
        VStack(alignment: .center) {
            Form {
                Section("Informations") {
                    FieldElement(title: "Username", value: user.username)
                    FieldElement(title: "Name", value: user.name)
                }
                Section("Contact") {
                    LinkFieldElement(title: "Email", link: "mailto:"+user.email)
                    FieldElement(title: "Phone", value: user.phone)
                    LinkFieldElement(title: "Website", link: user.website)
                }
                Section("Company") {
                    HStack {
                        Spacer()
                        VStack(alignment: .center) {
                            
                            LinearGradient(gradient: Gradient(colors: randomColors()), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .mask(
                                    Image(systemName: "person.3.fill")
                                        .font(.system(size: 40))
                                        .padding()
                                )
                                .frame(height: 40)
                                .padding(3)
                            
                            VStack {
                                Text(user.company.name)
                                    .font(.title2)
                                Text(user.company.catchPhrase)
                                    .font(.caption)
                            }.padding(2)
                            Text(user.company.bs)
                                .font(.system(size: 10))
                                .opacity(0.7)
                        }
                        Spacer()
                    }
                }
                Section("Adress") {
                    FieldElement(title: "City", value: user.address.city)
                    FieldElement(title: "Street", value: user.address.street)
                    FieldElement(title: "Suite", value: user.address.suite)
                    FieldElement(title: "Zipcode", value: user.address.zipcode)
                    
                }
                Section {
                    MapElement(region: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: Double(user.address.geo.lat)!, longitude: Double(user.address.geo.lng)!), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
                        .frame(minHeight: 200)
                        .cornerRadius(10)
                        .padding(.horizontal, -15)
                }
                FieldElement(title: "ID", value: "\(user.id)")
                    .font(.footnote)
            }
        }
    }
}
struct MapElement: View {
    @State var region: MKCoordinateRegion
    var body: some View {
        Map(coordinateRegion: $region)
    }
}
struct FieldElement: View {
    // Should be another way to do it without this but im lazy ok
    
    @State var title: String
    @State var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.callout)
            Spacer()
            Text(value)
        }
    }
}

struct LinkFieldElement: View {
    
    @State var title: String
    @State var link: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.callout)
            Spacer()
            Link(link.replacing("mailto:", with: ""), destination: URL(string: link)!)
        }
    }
}

