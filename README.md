# SwiftUI macOS TextField 输入框

## 简介

演示 SwiftUI 中 TextField 和 SecureField 的各种用法。

## 快速开始

```bash
cd swiftui-macos-textfield-demo
xcodegen generate
open SwiftUITextFieldDemo.xcodeproj
# Cmd+R 运行
```

## 概念讲解

### 基础 TextField

```swift
@State private var text = ""

TextField("占位文字...", text: $text)
```

- 第一个参数是占位提示文字
- `text` 是绑定的状态变量
- `$text` 是 Binding，允许 TextField 修改状态

### SecureField 密码框

```swift
@State private var password = ""

SecureField("输入密码...", text: $password)
```

SecureField 会隐藏输入文字，用于密码等敏感信息。

### TextFieldStyle 样式

macOS 提供了多种内置样式：

```swift
TextField("", text: $text)
    .textFieldStyle(.plain)        // 无边框

TextField("", text: $text)
    .textFieldStyle(.roundedBorder) // 圆角边框

TextField("", text: $text)
    .textFieldStyle(.squareBorder)  // 直角边框
```

### Form 中的布局

在 Form 中使用 HStack 可以创建标签+输入框的布局：

```swift
HStack {
    Text("用户名:")
    TextField("输入用户名", text: $username)
        .textFieldStyle(.roundedBorder)
}
```

### 禁用状态

```swift
TextField("", text: $text)
    .disabled(true)  // 禁用输入
```

### 自动对焦

```swift
TextField("自动聚焦", text: $text)
    .focused(true)
```

## 完整示例

```swift
struct ContentView: View {
    @State private var username = ""
    @State private var password = ""

    var body: some View {
        Form {
            Section("登录") {
                HStack {
                    Text("用户名:")
                    TextField("输入用户名", text: $username)
                        .textFieldStyle(.roundedBorder)
                }

                HStack {
                    Text("密码:")
                    SecureField("输入密码", text: $password)
                        .textFieldStyle(.roundedBorder)
                }
            }
        }
        .formStyle(.grouped)
    }
}
```

## 完整讲解（中文）

### TextField 工作原理

TextField 是 SwiftUI 中用于文本输入的组件。它需要：
1. 一个占位提示文字
2. 一个 Binding 到状态变量

当用户输入时，TextField 通过 Binding 自动更新状态，状态变化又触发视图重新渲染显示输入内容。

### 为什么用 Form

Form 是 macOS 原生的表单容器，自动提供：
- 分组样式
- 适合输入的布局
- 系统原生的表单外观

使用 `.formStyle(.grouped)` 可以让表单在 macOS 上显示更美观。

### SecureField 的用途

SecureField 用于密码输入，它：
- 将输入显示为圆点符号
- 提供安全性
- 与普通 TextField 用法相同

### 下一步

- 学习 TextEditor - 多行文本编辑
- 学习 Toggle - 开关控件
- 学习 Picker - 选择器
