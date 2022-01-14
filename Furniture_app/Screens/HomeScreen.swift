//
//  HomeScreen.swift
//  Furniture_app
//
//  Created by MacBook on 14.01.2022.
//

import SwiftUI

struct HomeScreen: View {
    @State private var selectedIndex: Int = 0
    private let names = ["Apple MacBook Pro","Apple iPhone 12 Pro","Apple iPad Pro","Apple AirPods Max"]
    private let prices = ["4500","1500","3000","500"]
    private let categories = ["All","Monitors","ORM","Batterie","Processor","Accesories","AudioCard"]
    var body: some View {
        NavigationView {
            ZStack {
                Color("Bg")
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack (alignment: .leading){
                        AppBarView()
                        
                        
                        TagLineView()
                            .padding()
                        
                        SearchAndScanView()
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack{
                                ForEach(0 ..< categories.count){
                                    i in CategoryView(isActive: i == selectedIndex, text: categories[i])
                                        .onTapGesture {
                                            selectedIndex = i
                                        }
                                }
                            }
                            .padding()
                        }
                        
                        Text("Popular")
                            .font(.system(size: 24))
                            .padding(.horizontal)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    NavigationLink(destination: DetailScreen(),
                                                   label: {ProductCardView(image: Image("prod_\(index + 1)"), size: 210, price: prices[index], name: names[index])
                                        
                                    })
                                        .navigationBarHidden(true)
                                        .foregroundColor(.black)
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                        
                        Text("Best")
                            .font(.system(size: 24))
                            .padding(.horizontal)
                            .padding(.top)
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(0 ..< 4) { index in
                                    ProductCardView(image: Image("prod_\(index + 1)"), size: 180, price: prices[index], name: names[index])
                                }
                                .padding(.trailing)
                            }
                            .padding(.leading)
                        }
                        
                    }
                }
                HStack{
                    BottomNavBarItem(image: Image("Home")) {}
                    BottomNavBarItem(image: Image("fav")) {}
                    BottomNavBarItem(image: Image("shop")) {}
                    BottomNavBarItem(image: Image("User")) {}
                }
                .padding()
                .background(Color.white)
                .clipShape(Capsule())
                .padding(.horizontal)
                .shadow(color: Color.black.opacity(0.15 ), radius: 8, x: 2, y: 6)
                .frame (maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}
 

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

struct AppBarView: View {
    var body: some View {
        HStack {
            Button(action: {}){
                Image("menu")
                    .padding()
                    .background(Color(.white))
                    .cornerRadius(10)
            }
            Spacer()
            Button(action: {}){
                Image("Profile")
                    .resizable()
                    .frame(width: 42, height: 42)
                    .cornerRadius(10.0)
            }
            
        }
        .padding(.horizontal)
    }
}

struct TagLineView: View {
    var body: some View {
        Text("Find The best \n")
            .font(.title)
            .foregroundColor(Color("Primary"))
        + Text("Devices")
            .font(.system(size: 28, weight: .bold, design: .default))
            .foregroundColor(Color("Primary"))
    }
}

struct SearchAndScanView: View {
    @State private var search: String = ""
    var body: some View {
        HStack{
            HStack{
                Image("Search")
                    .padding(.trailing, 8)
                TextField("Search", text: $search)
            }
            .padding(.all, 20)
            .background(Color.white)
            .cornerRadius(10.0)
            .padding(.trailing)
            
            
            Button(action: {}) {
                Image("Scan")
                    .padding()
                    .background(Color("Primary"))
                    .cornerRadius(10.0)
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}

struct CategoryView: View {
    let isActive: Bool
    let text: String
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(text)
                .font(.system(size: 18))
                .fontWeight(.medium)
                .foregroundColor(isActive ? Color("Primary"): Color.black.opacity(0.7))
            if (isActive){
                Color("Primary")
                    .frame(width: 15, height: 2)
                    .clipShape(Capsule())
            }
        }
        .padding(.trailing)
    }
}

struct ProductCardView  : View {
    let image: Image
    let size: CGFloat
    let price: String
    let name: String
    var body: some View {
        VStack{
            image
                .resizable()
                .frame(width: size, height: 200 * (size/210))
                .cornerRadius(20.0)
            
            Text(name)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 2){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                
                Spacer()
                
                Text(price) + Text("$")
                
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
        }
        .frame(width: size)
        .padding()
        .background(Color.white)
        .cornerRadius(20.0)
    }
}

struct BottomNavBarItem: View {
    let image: Image
    let action: ()-> Void
    var body: some View {
        Button(action: {}, label: {
            image
                .frame(maxWidth: .infinity)
        })
    }
}
