/// Copyright (c) 2023 Kodeco Inc.
///
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
///
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
///
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
///
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var redColor: Double = 0.0
  @State private var greenColor: Double = 0.0
  @State private var blueColor: Double = 0.0
  @State private var foregroundColor = Color(red: 0, green: 0, blue: 0)

  var body: some View {

    VStack {
      Text("Color Picker")
        .font(.largeTitle)

      RoundedRectangle(cornerRadius: 0)
        .foregroundColor(foregroundColor)
        .border(Color("RectBorderColor"), width: 5)
      VStack {
        TitleText(text: "Red")
        HStack {
          Slider(value: $redColor, in: 0...255)
            .accentColor(.red)
          Text("\(Int(redColor.rounded()))")
        }
      }
      VStack {
        TitleText(text: "Green")
        HStack {
          Slider(value: $greenColor, in: 0...255)
            .accentColor(.green)
          Text("\(Int(greenColor.rounded()))")
        }
      }
      VStack {
        TitleText(text: "Blue")
        HStack {
          Slider(value: $blueColor, in: 0...255)
            .accentColor(.blue)
          Text("\(Int(blueColor.rounded()))")
        }
      }
      SetColorButton(redColor: $redColor, greenColor: $greenColor, blueColor: $blueColor, foregroundColor: $foregroundColor)
    }
    .padding(20)

  }
}

struct SetColorButton: View {
  @Binding var redColor: Double
  @Binding var greenColor: Double
  @Binding var blueColor: Double
  @Binding var foregroundColor: Color
  
  var body: some View {
    Button("Set Color") {
      foregroundColor = Color(red: redColor / 255, green: greenColor / 255, blue: blueColor / 255)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColor")
        LinearGradient(
          gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      })
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
    )
    .foregroundColor(Color.white)
    .cornerRadius(Constants.General.roundedRectCornerRadius)
    .bold()
    .font(.title3)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
  }
}
