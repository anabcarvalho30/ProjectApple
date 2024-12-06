////
//  SwiftUIView.swift
//  TaskList
//
//  Created by found on 03/12/24.
//

import SwiftUI

struct AddCategoryView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var title = ""
    
    //É @Binding porque você está trazendo uma informação de uma tela e levando-a para outra tela.
    @Binding var isShowing: Bool
    
    @State var category_name: String = ""
    
    @State var category_color: Color = Color.secondary
    
    var body: some View {
        List{
            //Seção das Categorias
            Section{
                HStack{
                    TextField("Categoria            ", text: $category_name)
                    
                    ColorPicker(selection: $category_color, label: {
                        Text("")
                    })
                    Button{
                        let category = Category(name: category_name, color:category_color)
                        print(category)
                        if category_name != ""{
                            modelContext.insert(category)
                        }
                        category_name = ""
                        dismiss()
                        
                    } label: {
                        Text("SALVAR")
                    }
                }
            }header: {
                HStack{
                    Text("Criar Nova Categoria")
                }
            }
        }
    }
}

#Preview {
    //Nesse caso, você está esclarecendo que a variável que está chamada lá de isShowing
    AddCategoryView(isShowing: .constant(true))
}
