import SwiftUI
import SwiftData

struct ContentView: View {
    
    //Quando você quer alterar algo dentro da View, você usa o @State.
    
    @State var title = ""
    
    @State var category_name: String = ""
    
//    @State var categories = Category()
    
    @State var category_color: Color = Color.secondary
    
    @State var isShowingSheetTask: Bool = false
    @State var isShowingSheetCategory: Bool = false
    
    @Environment(\.modelContext) var modelContext
    
    @Query var tasks: [Task]
    @Query var categories : [Category]
    
    @State var isBtnVsbl : Bool = true
    
    
    let categorias : [Category] = [Category(name: "De Casa", color: .blue), Category(name: "Escolar", color: .green), Category(name: "Religioso", color: .yellow), Category(name: "Do Trabalho", color: .red), Category(name: "Animais de Estimação", color: .pink)]
    
    var body: some View {
        
        Text("Lista de Tarefas")
            .foregroundColor(.red)
            .font(.largeTitle)
        if categories.isEmpty{
            if isBtnVsbl{
                Button{
                    for categoria in categorias{
                        modelContext.insert(categoria)
                        isBtnVsbl = false
                    }
                } label: {
                    Text("Adicionar as Categorias-Padrão")
                }
            }
        }
        
        List{
            //Usando o cifrão($) para conetar com uma variável State!
            Section{
            } header: {
                HStack{
                    Text("Criar nova tarefa")
                    Button{
                        isShowingSheetTask = true
                    }label: {
                        Spacer()
                        Image(systemName: "plus")
                    }
                }
            }
            
            Section{
            }header: {
                HStack{
                    Text("Criar Cova Categoria")
                    Button{
                        isShowingSheetCategory = true
                    }label: {
                        Spacer()
                        Image(systemName: "plus")
                    }
                }
            }
            
            Section{
                ForEach(categories){ categ in
                    CategoryView(category: categ)
                }
            } header: {
                HStack{
                    Text("Categorias")
                }
            }
            .onAppear {
                print(categories.count)
            }
            
            Section{
                ForEach(tasks){ task in
                    TaskView(task)
                }
            } header: {
                HStack{
                    Text("Lista de Tarefas")
                }
            }
        }
        .sheet(isPresented: $isShowingSheetTask){
            AddTaskView(isShowing: $isShowingSheetTask)
        }
        .sheet(isPresented: $isShowingSheetCategory){
            AddCategoryView(isShowing: $isShowingSheetCategory)
        }
    }
}

