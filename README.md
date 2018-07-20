![Version](https://img.shields.io/badge/version-0.8.6-orange.svg) ![Language](https://img.shields.io/badge/language-Swift_4-yellow.svg) ![DevelopmentPlatform](https://img.shields.io/badge/Development_Platform-macos-red.svg) ![SupportedOS](https://img.shields.io/badge/Supported_OS-macOS/iOS-blue.svg) ![Build](https://img.shields.io/badge/Build-passed-green.svg)   
SwiftyStats
===========
SwiftyStats is a generic statistical framework completely written in Swift 4. The framework is basically a port from an existing Objective C framework I've written years ago. The framework includes often used statistical routines. This is framework is far from being perfect and is "work in progress". Due to some external limitations (earning money) the code will be updated rather sporadically.

# Documentation
A jazzy-generated reference can be found here: [SwiftyStats Doc](http://www.vpedia.net/swiftystats).

**macOS only**:  
Locally you can always generate a docset using the `SwiftyStats/make_doc.sh`script.

```bash
cd <CLONE_DIRECTORY>/SwiftyStats
./make_docs.sh
open docs/index.html
```

# How to Install
## CocoaPods (recommended if your are on a Mac)
[CocoaPods](http://cocoapods.org) is the preferred way to add SwiftyStats to your project.
To do this, create (if it doesn't exist already) a file called `Podfile` in the root of your project (the place, where your .xcodeproj-file resides) e.g. by typing `touch Podfile` in a terminal window. Open the file (`vi Podfile`) and insert `pod 'SwiftyStats'`, Your file should loke like this:

```ruby
target 'YOURPROJECT' do
  use frameworks!
  pod 'SwiftyStats'  
end
```
Save changes and execute

```bash
$ pod install
```
## Swift Package Manager (recommended for use on Linux)

Edit your `Package.swift` file:

```swift
import PackageDescription

let package = Package(
	name: "<YOUR_PACKAGE_NAME>",
	dependencies: [
		.Package(url: "https://gitlab.com/strike65/SwiftyStats", from: "0.8.7")
	]
)		
```

## Manually
Clone the repo using the command
```
cd <YOUR_FOLDER_FOR_CLONED_REPOS>
git clone https://github.com/strike65/SwiftyStats.git
```
Then drag the `SwiftyStats.xcodeproj` into your project and make sure the following build options are set:
### Targeting iOS
- add "SwiftyStats"/"SwiftyStatsMobile" to ```Targets->Build Phases->Target Dependencies```
- add "SwiftyStats"/"SwiftyStatsMobile" to ```Targets->Build Phases->Link Binary With Libraries```
- add "SwiftyStats"/"SwiftyStatsMobile" to ```Targets->Build Phases->Embed Frameworks```

### Targeting macOS
- add "SwiftyStats"/"SwiftyStats" to ```Targets->Build Phases->Target Dependencies```
- add "SwiftyStats"/"SwiftyStats" to ```Targets->Build Phases->Link Binary With Libraries```
- add "SwiftyStats"/"SwiftyStats" to ```Targets->Build Phases->Embed Frameworks```
for macOS targets.

### Targeting Linux
As there is no Xcode-Project, you have to use the Swift Package Manager. See above.

# How to Use

## Descriptive stats

The central class of the framework is `SSExamine`
`SSExamine` objects encapsulate your data and delivers various statistics. To initialize a new instance follow the steps below.


```swift
import SwiftyStats

// example data
let data: Array<Double> = [3.14,1.21,5.6]
// because our data are double valued items, the parameter "characterSet" is ignored
let test = SSExamine<Double>.init(withObject: data, levelOfMeasurement: .interval, characterSet: nil)
// prints out the arithmetic mean
print("\(test.arithmeticMean)")
// you can use the class to analyze strings too:
let testString = "This string must be analyzed!"
// in this case, only characters contained in CharacterSet.alphanumerics are added
let stringAnalyze = VTExamine<String>(withObject: data, levelOfMeasurement: .nominal, characterSet: CharacterSet.alphanumerics)
print("\(stringAnalyze.frequency("i")")
```
SSExamine objects can be stored and restored in various ways, e.g.:

```swift
do {
	try myExamineObject.archiveTo(filePath: "~/data/myexamine.ssexamine", overwrite: true)
}
catch {
    // error handling
}
...
do {
	newObject: SSExamine<Double> = try SSExamine<Double>.unarchiveFrom(filePath: "~/data/myexamine.ssexamine")
}
catch {
    // error handling
}
```

### Obtainable Statistics
(This list is not exhaustive.)

- sample size
- length (= number of unique elements)
- frequencies (absolute, relative, cumulative)
- empirical cdf
- means (arithmetic, geometric, harmonic, contraharmonic)
- empirical dispersion measures (variance, semi variance, standard deviation, standard error)
- empirical moments (central, about the origin, standardized)
- mode
- maximum, minimum
- quantiles
- entropy based statistics
- ...

## SSHypothesisTesting
The framework implements the following tests so far:

- Kolmogorov Smirnov test (one/two sample))
- Anderson Darling test
- Bartlett test
- Levene test (with variants)
- Grubbs test
- ESD test (Rosner test)
- t test (matched, 2-sample)
- Mann Whitney U-test
- Wilcoxon matched pairs test
- sign test
- one factor ANOVA
- Tukey-Kramer post hoc test
- Scheffé-Test
- basic analysis of cross-tables
- ...



## SSProbabilityDistributions

- PDF (Probability Density Function)
- CDF (Cumulative Distribution Function)
- Quantile (= inverse CDF)
- Parameters (kurtosis, skewness, variance, mean)

###List of supported distributions:

- Normal Distribution
- F-Ratio Distribution
- Student's T Distribution
- Chi^2 Distribution
- Beta Distribution
- Gamma Distribution
- Log Normal Distribution
- Cauchy Distribution
- Laplace Distribution
- Pareto Distribution
- Wald Distribution
- Exponential Distribution
- Uniform Distribution
- Triangular Distribution

# Documentation
This framework is "work in progress". A html-based documentation can be generated by invoking 

```
SwiftyStats/make_doc.sh
```
[Jazzy](https://github.com/realm/jazzy)

# LICENSE
This framework is published under the [GNU GPL 3](http://www.gnu.org/licenses/)

Copyright 2017,2018 Volker Thieme

