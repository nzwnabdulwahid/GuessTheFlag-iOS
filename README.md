
# GuessTheFlag - iOS [HWS Project 2](https://www.hackingwithswift.com/100/swiftui/20)

<img src="https://raw.githubusercontent.com/nzwnabdulwahid/GuessTheFlag-iOS/main/Screenshot.png" width="150" >

## #TIL
1. Grouping and Basic Alignment with `VStack`, `HStack` and `ZStack`
2. Push element accordingly with `Spacer`
3. `LinearGradient` and `RadialGradient`
4. Button with trailing closures
```swift
Button {
	onFlagTapped(number)
} label: {
	Image(countries[number])
		.renderingMode(.original)
		.clipShape(Capsule())
		.shadow(radius: 5)
}
```
5. Hook basic `alert`
```swift
.alert(popupTitle, isPresented: $isPopupShown){
	Button("Continue", action: resetQuestion)
} message: {
	Text("Your score is \(totalScore)")
}
```
