import SwiftUI

struct ContentView: View {
    @State private var text1 = ""
    @State private var text2 = ""
    @State private var text3 = ""
    @State private var secureText = ""
    @FocusState private var isAutoFocused: Bool

    var body: some View {
        Form {
            // 1. 基础 TextField
            Section("基础 TextField") {
                TextField("占位文字...", text: $text1)
                    .textFieldStyle(.roundedBorder)

                Text("你输入的是: \(text1)")
                    .foregroundColor(.secondary)
            }

            // 2. 带标签的 TextField
            Section("带标签") {
                HStack {
                    Text("用户名:")
                    TextField("输入用户名", text: $text2)
                        .textFieldStyle(.roundedBorder)
                }

                HStack {
                    Text("邮箱:")
                    TextField("输入邮箱", text: $text3)
                        .textFieldStyle(.roundedBorder)
                }
            }

            // 3. 密码输入框
            Section("密码输入 (SecureField)") {
                SecureField("输入密码...", text: $secureText)
                    .textFieldStyle(.roundedBorder)

                Text("密码长度: \(secureText.count)")
                    .foregroundColor(.secondary)
            }

            // 4. 不同的 TextFieldStyle
            Section("TextFieldStyle 样式") {
                TextField("plainTextField", text: .constant(""))
                    .textFieldStyle(.plain)
                    .padding(8)
                    .background(Color.gray.opacity(0.2))

                TextField("squareBorder", text: .constant(""))
                    .textFieldStyle(.squareBorder)
                    .padding(8)

                TextField("roundedBorder", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
            }

            // 5. 只读和禁用
            Section("状态") {
                TextField("只读", text: .constant("无法编辑"))
                    .textFieldStyle(.roundedBorder)
                    .disabled(true)

                TextField("禁用", text: .constant(""))
                    .textFieldStyle(.roundedBorder)
                    .disabled(true)
            }

            // 6. 自动对焦
            Section("自动对焦") {
                TextField("自动聚焦的输入框", text: $text1)
                    .focused($isAutoFocused)
            }
        }
        .formStyle(.grouped)
        .padding()
        .onAppear {
            isAutoFocused = true
        }
    }
}
