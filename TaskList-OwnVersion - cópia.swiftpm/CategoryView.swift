import SwiftUI

struct CategoryView : View{
    let category: Category
    let color: String
    
    //let category_color: Color = category.color
    
    init(_ category: Category) {
        self.category = category
        self.color = category.color
    }
    
    var body: some View{
        Text(category.name)
            .font(.subheadline)
            .cornerRadius(10)
    }
}
//CONSERTAR ERROS AQUI COM RELACAO À COR DA CATEGORIA.
//FALTA FAZER O FOREACH PRA MOSTRAR AS CATEGORIAS.

