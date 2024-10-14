//
//  ESIMListView.swift
//  aerolink
//
//  Created by asadbek on 21/09/24.
//

import SwiftUI

struct StoreView: View {
    @State private var searchText = ""
    @State private var selectedCategory = "Local eSIMs"
    
    let categories = ["Favorites", "Local eSIMs", "Regional eSIMs"]
    
    @State private var countries: [Country] = []
    @State private var selectedCountry: Country?
    
    init() {
        _countries = State(initialValue: loadCountries())
    }
    
    private func loadCountries() -> [Country] {
        guard let url = Bundle.main.url(forResource: "countries", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Failed to load countries.json")
            return []
        }
        
        do {
            return try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Failed to decode countries: \(error)")
            return []
        }
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    // Header
                    HStack {
                        AvatarImage(size: 40)
                        Text("Hello, Veronika")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 17)
                    
                    
                    // Search bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("", text: $searchText, prompt: Text("Search data packs for 200+ countries")
                            .foregroundColor(.customGray)
                            .font(.system(size: 16))
                        )
                           
                    }
                    .padding(10)
                    .background(Color.customLightGray)
                    .cornerRadius(20)
                    .padding(.horizontal)
                    .padding(.bottom, 23)
                    
                    
                    // Categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(categories, id: \.self) { category in
                                Button(action: {
                                    selectedCategory = category
                                }) {
                                    Text(category)
                                        .padding(.vertical, 12)
                                        .padding(.horizontal, 25)
                                        .foregroundColor(selectedCategory == category ? .black : .gray)
                                        .background(
                                            RoundedRectangle(cornerRadius: 20)
                                            .fill(Color.customLightGray)
                                        )
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 20)
                                                .stroke(selectedCategory == category ? Color.black: Color.clear, lineWidth: 2.5)
                                        )
                                }
                                
                            }
                        }
                        .padding(.vertical, 3)
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 21)
                    
                    // Referral banner
                    HStack {
                        Image("diamond")
                            .font(.largeTitle)
                            .padding(.trailing, 8)
                        
                        Text("Give USD $5.00 to every friend that tries Aerolink")
                            .font(.subheadline)
                            .fontWeight(.medium)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 18)
                    .background(Color.primaryColor)
                    .foregroundColor(.white)
                    .cornerRadius(18)
                    .padding(.horizontal)
                    .padding(.bottom, 38)
                    
                    // Popular countries list
                    Text("Popular countries")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.bottom, 18)
                        
                    
                    VStack(spacing: 20) {
                        ForEach(countries) { country in
                            CountryRow(country: country, isSelected: country.id == selectedCountry?.id)
                                .onTapGesture {
                                    selectedCountry = country
                                }
                        }
                    }
                }
            }
            .padding(.top, 8)
            .background(Color(.white))
            .navigationBarHidden(true)
        }
    }
    
   
}

struct CountryRow: View {
    let country: Country
    var isSelected: Bool = false
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: country.flagImgUrl)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                case .failure:
                    Image(systemName: "flag")
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 38, height: 38)
            .clipShape(Circle())
            .padding(.trailing, 12)            
            
            Text(country.name)
                .font(.body)
                .foregroundColor(.black)
                .fontWeight(.medium)
            Spacer()
            
            if isSelected {
                Image(systemName: "checkmark.circle.fill")
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.primaryColor)
            } else {
                Image(systemName: "circle.fill")
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.customLightGray)
            }
            
            Image(systemName: "chevron.right")
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(.horizontal)
        .background(Color.white)
    }
}

struct AvatarImage: View {
    let size: CGFloat
    
    var body: some View {
        AsyncImage(url: URL(string: Constants.avatarUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            case .failure:
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(.blue)
            @unknown default:
                EmptyView()
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
}

#Preview {
    StoreView()
}
