import SwiftUI

struct CategoryView : View{
    let category: Category
    
    //let category_color: Color = category.color
    
    var body: some View{
        HStack {
            Text(category.name)
                .font(.subheadline)
                .cornerRadius(10)
        
        
            category.colorComponent.color
                .frame(width: 30, height: 30)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10)
                )
                

        }
    }
}
//CONSERTAR ERROS AQUI COM RELACAO À COR DA CATEGORIA.
//FALTA FAZER O FOREACH PRA MOSTRAR AS CATEGORIAS.

#Preview {
    CategoryView(category: Category(name: "Teste", color: .pink))
}
