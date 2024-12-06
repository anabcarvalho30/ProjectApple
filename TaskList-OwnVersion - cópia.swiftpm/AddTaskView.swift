////
//  SwiftUIView.swift
//  TaskList
//
//  Created by found on 03/12/24.
//

import SwiftUI

struct AddTaskView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @State var title = ""
    
    //É @Binding porque você está trazendo uma informação de uma tela e levando-a para outra tela.
    @Binding var isShowing: Bool
    
    @State var category_name: String = ""
    
    @State var category_color: Color = Color.secondary
    
    var body: some View {
        List{
            //Seção da Task
            Section {
                HStack{
                    TextField("Task", text: $title)
                    Button {
                        // Verifica se o título não é vazio após remover espaços em branco
                        if !title.trimmingCharacters(in: .whitespaces).isEmpty {
                            let task = Task(title: title, date: .now)
                            modelContext.insert(task)
                        }
                        title = ""  // Limpa o título após salvar
                        dismiss()   // Fecha a tela
                    } label: {
                        Text("SALVAR")
                    }
                }
            } header: {
                Text("Criar Nova Task")
            }
        }
    }
}

#Preview {
    //Nesse caso, você está esclarecendo que a variável que está chamada lá de isShowing
    AddTaskView(isShowing: .constant(true))
}
