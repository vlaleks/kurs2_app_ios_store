//
//  DetailScreen.swift
//  Furniture_app
//
//  Created by MacBook on 14.01.2022.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentaionMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Color("Bg")
                .edgesIgnoringSafeArea(.all)
            
            ScrollView{
                Image("prod_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                
                DescriptionView()
                    .offset(y: -80)
                
                
            }
            .edgesIgnoringSafeArea(.top)
            
           
            HStack{
                Text("$4500")
                    .font(.title)
                    .foregroundColor(.white)
                
                Spacer()
        
                
                Button(action: {}, label: {
                    Text("Add to Cart")
                        .padding()
                        .padding(.horizontal)
                        .background(Color.white)
                        .foregroundColor(Color("Primary"))
                        .cornerRadius(10.0)
                })
            }
            .padding()
            .padding(.horizontal)
            .background(Color("Primary"))
            .cornerRadius(50, corners: .topLeft)
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: CustomBackButtonView(action: {presentaionMode.wrappedValue.dismiss()}), trailing: Image("threeDot")
        )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}

struct DescriptionView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Apple MacBook Pro")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 4){
                ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    Image("star")
                }
                Text("(4.9)")
                    .opacity(0.5)
                    .padding(.leading, 8)
                Spacer()
            }
            
            Text("Description")
                .fontWeight(.medium)
                .padding(.vertical, 8)
            
            Text("The super fast M1 Pro and M1 Max chips give phenomenal performance and provide surprisingly long battery life. Add to this the stunning Liquid Retina XBM display and even more ports for professional work. This is the laptop you've been waiting for.")
                .lineSpacing(8.0)
                .opacity(0.7)
            
            HStack(alignment: .top){
                VStack(alignment: .leading){
                    Text("Main")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("RAM 32 ГБ").opacity(0.6)
                    Text("M1 Max 32-Core").opacity(0.6)
                    Text("RAM 32 ГБ").opacity(0.6)
                    Text("Apple M1 Max").opacity(0.6)
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading){
                    Text("Appearance")
                        .fontWeight(.semibold)
                        .padding(.bottom, 4)
                    Text("Top cover is gray").opacity(0.6)
                    Text("Material aluminum").opacity(0.6)
                    Text("Design is classic").opacity(0.6)
                    
                }
                
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical)
            
            HStack(alignment: .bottom){
                VStack(alignment: .leading){
                    Text("Colors")
                        .fontWeight(.semibold)
                    
                    HStack{
                        ColorDotView(color: .white)
                        ColorDotView(color: .yellow)
                        ColorDotView(color: .black)
                    }
                }
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Quantity")
                        .fontWeight(.semibold)
                    HStack{
                        Button(action: {}){
                            Image(systemName: "minus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .overlay(RoundedRectangle(cornerRadius: 50).stroke())
                        .foregroundColor(.black)
                        
                        Text("1")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal, 8)
                        
                        Button(action: {}){
                            Image(systemName: "plus")
                                .padding(.all, 8)
                        }
                        .frame(width: 30, height: 30)
                        .background(Color("Primary"))
                        .clipShape(Circle())
                        .foregroundColor(.white)
                    }
                    
                }
            }
        }
        .padding()
        .padding(.top)
        .background(Color("Bg"))
        .cornerRadius(40.0)
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View {
        color
            .frame(width: 24, height: 24)
            .clipShape(Circle())
    }
}

struct CustomBackButtonView: View {
    let action: ()-> Void
    
    var body: some View {
        Button(action: action , label: {
            Image(systemName: "chevron.backward").padding(.all, 12)
                .background(Color.white)
                .cornerRadius(8.0)
                .foregroundColor(.black)
        })
    }
}
