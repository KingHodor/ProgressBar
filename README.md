Evercoin progress bar written in Swift.

## Features
- [x] CABasicAnimation linearMovement animation
- [x] CABasicAnimation scale animation

## Demo
<p align="center" >
<img src="https://github.com/Everc0in/ProgressBar/blob/master/example.gif" width="270" height="300"/>
</p>

## Requirement
- Swift3

## Usage
#### Animate ProgressBar
```swift
@IBOutlet weak var progressBar1: ProgressBar!
@IBOutlet weak var progressBar2: ProgressBar!

// animated ProgressBar
self.progressBar1.startLoading()
self.progressBar2.startLoadingReverse()
