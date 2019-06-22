![Language](https://img.shields.io/badge/Language-Swift_5-yellow.svg) ![Version](https://img.shields.io/badge/version-1.0.4-orange.svg) ![Unit Tests](https://img.shields.io/badge/Unit_Tests-passed-green.svg) ![macOS](https://img.shields.io/badge/macOS-built-green.svg) ![iOS](https://img.shields.io/badge/iOS-built-green.svg) ![Build Linux](https://img.shields.io/badge/Linux-under_development-red.svg) 

To see the documentation, click [**here**](https://strike65.github.io/SwiftyStats).
===

SwiftyStats
===========
SwiftyStats is a generic statistical framework completely written in Swift. The framework is basically a port from an existing Objective C framework I've written years ago. The framework includes often used statistical routines. This framework is far from being perfect and is "work in progress".
>Due to some external limitations (earning money) the code will be updated rather sporadically.


## Probability Distributions
This library provides some of the more common probability distributions. Functions are prefixed by `pdf`, `cdf`, `quantile` for "probability density function", "cumulative density function" and "inverse cumulative density" function respectively. The prefix `para` denotes functions returning a `SSContProbDistParams` struct (fields: `mean`, `variance`, `skewness`, `kurtosis`).  
Probability distributions in general are defined within relatively narrow conditions expressed in terms of certain parameters such as "degree of freedom", "shape" or "mean".  

>**Note:**  
Please always check if `NaN` or `nil` is returned.  


The integrated test suite uses numerical data for comparison with the results calculated by SwiftyStats. The comparison data were generated using common computer algebra systems. 

Important changes
=================
**This update contains a lot of new features. That is, your code have to be updated.**

Version 1.0.0 or newer requires at least Swift 4.2 or later. If you cannot use Swift 4.2 or later, you will need to customize the Podfile (see below). 

> Due to the heavy use of generics, the first build takes a long time. The same problem occurs if the contents of the `DerivedData` folder have been deleted.
>
>**Therefore the target "SwiftyStatsMobile" is not included in the list "Target Dependencies" of the target "SwiftyStats"**

# Documentation
A jazzy-generated reference can be found here: [SwiftyStats Doc](http://www.vpedia.net/swiftystats).

**macOS only**:  
Locally you can always generate a docset using `SwiftyStats/make_doc.sh`script. To do this, [Jazzy](https://github.com/realm/jazzy) must be installed on your system:

```bash
$> cd <CLONE_DIRECTORY>/SwiftyStats
$> ./make_docs.sh
$> open docs/index.html
```

# How to Install
## CocoaPods (recommended if your are on a Mac)
[CocoaPods](http://cocoapods.org) is the preferred way to add SwiftyStats to your project:

```bash
$> cd <YOUR_PROJECT_FOLDER>
$> vi Podfile
```
Your Podfile should looks like:  

```ruby
target 'YOURPROJECT' do
  use_frameworks!
  pod 'SwiftyStats'  
end
```
If you have to use a Swift version **earlier** than 4.2, replace the line `pod 'SwiftyStats'` by:

```ruby
...
   pod 'SwiftyStats", '0.8.14'
...
```
Save your changes and run:

```bash
$ pod install
```

## Swift Package Manager (recommended for Linux)
**The Linux package is still under development and is considered to be unstable.**

Edit your `Package.swift` file:

```swift
import PackageDescription
// for Swift 4.2 or 5
let version = "1.0.4"
// for earlier versions:
// let version = "0.8.14"
let package = Package(
	name: "<YOUR_PACKAGE_NAME>",
	dependencies: [
		.package(url: "https://github.com/strike65/SwiftyStats", from: version)
	]
)
```
Then rebuild your project.  
For more information about the Swift Package Manager click [here](https://github.com/apple/swift-package-manager/tree/master/Documentation)

## Manually
* Clone:  

```bash
$> cd <YOUR_FOLDER_FOR_CLONED_REPOS>
$> git clone https://github.com/strike65/SwiftyStats.git
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

## Build Swift Module from command line

**Clone** the repo to a directory of your choice and change to the directory.  

* `make` or `make debug` builds the module in debug-configuration
* `make release` builds the module in release-configuration
* `make test` builds the module and performs some tests
* `make clean` resets the build-process

# How to Use
## Accuracy and Precision
Although the internal accuracy is much larger, only the **first four decimal places** should be used. For more information on this click [here](https://docs.oracle.com/cd/E19957-01/806-3568/ncg_goldberg.html).

> It is recommended to use this library with at least double accuracy.

## Descriptive stats
The central class of the framework is `SSExamine`
`SSExamine` objects encapsulate your data and delivers various statistics. To initialize a new instance follow the steps below.


```swift
import SwiftyStats

// example data
let data: Array<Double> = [3.14,1.21,5.6]
// because our data are double valued items, the parameter "characterSet" is ignored
let test = SSExamine<Double, Double>.init(withObject: data, levelOfMeasurement: .interval, characterSet: nil)
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
	newObject: SSExamine<Double, Double> = try SSExamine<Double, Double>.unarchiveFrom(filePath: "~/data/myexamine.ssexamine")
}
catch {
    // error handling
}
```

### Obtainable Statistics
(This list is not exhaustive.)

### Obtainable Statistics
(This list is not exhaustive.)

#### SSExamine
    arithmeticMean
    mode
    commonest
    scarcest
    quantile(q:)
    quartile
    geometricMean
    harmonicMean
    contraHarmonicMean
    poweredMean(order:)
    trimmedMean(alpha:)
    winsorizedMean(alpha:)
    gastwirth
    median
    product
    logProduct
    maximum
    minimum
    range
    quartileDeviation
    relativeQuartileDistance
    midRange
    interquartileRange
    interquantileRange(lowerQuantile:upperQuantile:)
    variance(type:)
    standardDeviation(type:)
    standardError
    entropy
    relativeEntropy
    herfindahlIndex
    conc
    gini
    giniNorm
    CR(_:)
    normalCI(alpha:populationSD:)
    studentTCI(alpha:)
    meanCI
    cv
    coefficientOfVariation
    meanDifference
    medianAbsoluteDeviation(center:scaleFactor:)
    meanAbsoluteDeviation(center:)
    meanRelativeDifference
    semiVariance(type:)
    moment(r:type:)
    autocorrelation(n:)
    kurtosisExcess
    kurtosis
    kurtosisType
    skewness
    skewnessType
    hasOutliers(testType:)
    outliers(alpha:max:testType:)
    isGaussian
    testForDistribution(targetDistribution:)
    boxWhisker
    elementsAsString(withDelimiter:asRow:encloseElementsBy:)
    elementsAsArray(sortOrder:)
    uniqueElements(sortOrder:)
    frequencyTable(sortOrder:)
    cumulativeFrequencyTable(format:)
    eCDF(_:)
    smallestFrequency
    largestFrequency 

#### SSCrossTab
    rowCount
    columnCount
    firstRow
    lastRow
    firstColumn
    lastColumn
    rowNames
    columnNames
    columnLevelOfMeasurement
    rowLevelOfMeasurement
    isNumeric
    encode(to:)
    init(from:)
    is2x2Table
    isEmpty
    isSquare
    row(at:sorted:)
    column(at:sorted:)
    rowNamed(_:sorted:)
    columnNamed(_:sorted:)
    appendRow(_:name:)
    appendColumn(_:name:)
    removeRow(rowName:)
    removeColumn(columnName:)
    removeRow(at:)
    removeColumn(at:)
    setRow(at:newRow:)
    setRow(name:newRow:)
    setColumn(name:newColumn:)
    setColumn(at:newColumn:)
    insertRow(newRow:at:name:)
    insertColumn(newColumn:at:name:)
    replaceRow(newRow:at:name:)
    replaceColumn(newColumn:at:name:)
    setRowNames(rowNames:)
    setColumnNames(columnNames:)
    description
    rowSums
    columnSums
    rowSum(row:)
    rowSum(rowName:)
    columnSum(column:)
    columnSum(columnName:)
    nameOfColumn(column:)
    nameOfRow(row:)
    firstIndexOfColumn(columnName:)
    firstIndexOfRow(rowName:)
    total
    rowTotal()
    colummTotal()
    largestRowTotal()
    largestCellCount(atColumn:)
    largestCellCount(atRow:)
    relativeTotalFrequency(row:column:)
    relativeTotalFrequency(rowName:columnName:)
    relativeRowFrequency(row:column:)
    relativeColumnFrequency(row:column:)
    relativeRowMarginFrequency(row:)
    relativeColumnMarginFrequency(column:)
    expectedFrequency(row:column:)
    expectedFrequency(rowName:columnName:)
    residual(row:column:)
    standardizedResidual(row:column:)
    adjustedResidual(row:column:)
    degreesOfFreedom
    chiSquare
    chiSquareLikelihoodRatio
    chiSquareYates
    covariance
    pearsonR
    chiSquareMH
    phi
    ccont
    coefficientOfContingency
    cramerV
    lambda_C_R()
    lambda_R_C()
    r0
    r1 

#### Probability Functions

Beta

    paraBetaDist(shapeA:shapeB:)
    pdfBetaDist(x:shapeA:shapeB:)
    cdfBetaDist(x:shapeA:shapeB:)
    quantileBetaDist(p:shapeA:shapeB:)
    cdfBetaDist(x:shapeA:shapeB:lambda:)
    pdfBetaDist(x:shapeA:shapeB:lambda:)

binomial

    cdfBinomialDistribution(k:n:probability:tail:)
    pdfBinomialDistribution(k:n:probability:)

Cauchy

    paraCauchyDist(location:scale:)
    pdfCauchyDist(x:location:scale:)
    cdfCauchyDist(x:location:scale:)
    quantileCauchyDist(p:location:scale:)

Central

    para(degreesOfFreedom:)
    pdf(chi:degreesOfFreedom:)
    cdf(chi:degreesOfFreedom:tail:rlog:)
    quantile(p:degreesOfFreedom:)

noncentral

    para(degreesOfFreedom:lambda:)
    pdf(chi:degreesOfFreedom:lambda:)
    cdf(chi:degreesOfFreedom:lambda:)
    quantile(p:degreesOfFreedom:lambda:)

Erlang

    paraErlangDist(shape:rate:)
    pdfErlangDist(x:shape:rate:)
    cdfErlangDist(x:shape:rate:)
    quantileErlangDist(p:shape:rate:)

Exponential Dist

    paraExponentialDist(lambda:)
    pdfExponentialDist(x:lambda:)
    cdfExponentialDist(x:lambda:)
    quantileExponentialDist(p:lambda:)

Chi Square

    paraExtremValueDist(location:scale:)
    pdfExtremValueDist(x:location:scale:)
    cdfExtremValueDist(x:location:scale:)
    quantileExtremValueDist(p:location:scale:)

F-RATIO

    paraFRatioDist(numeratorDF:denominatorDF:)
    pdfFRatioDist(f:numeratorDF:denominatorDF:)
    cdfFRatioDist(f:numeratorDF:denominatorDF:)
    quantileFRatioDist(p:numeratorDF:denominatorDF:)
    paraFRatioDist(numeratorDF:denominatorDF:lambda:)
    pdfFRatioDist(f:numeratorDF:denominatorDF:lambda:)
    cdfFRatioDist(f:numeratorDF:denominatorDF:lambda:)

Gamma

    paraGammaDist(shape:scale:)
    pdfGammaDist(x:shape:scale:)
    cdfGammaDist(x:shape:scale:)
    quantileGammaDist(p:shape:scale:)

GAUSSIAN

    paraNormalDistribution(mean:standardDeviation:)
    cdfNormalDist(x:mean:standardDeviation:)
    cdfNormalDist(x:mean:variance:)
    cdfStandardNormalDist(u:)
    pdfNormalDist(x:mean:standardDeviation:)
    pdfNormalDist(x:mean:variance:)
    pdfStandardNormalDist(u:)
    quantileStandardNormalDist(p:)
    quantileNormalDist(p:mean:standardDeviation:)
    quantileNormalDist(p:mean:variance:)

Laplace

    paraLaplaceDist(mean:scale:)
    pdfLaplaceDist(x:mean:scale:)
    cdfLaplaceDist(x:mean:scale:)
    quantileLaplaceDist(p:mean:scale:)

Log Normal

    paraLogNormalDist(mean:variance:)
    pdfLogNormalDist(x:mean:variance:)
    cdfLogNormal(x:mean:variance:)
    quantileLogNormal(p:mean:variance:)

Logistic

    logit(p:)
    paraLogisticDist(mean:scale:)
    pdfLogisticDist(x:mean:scale:)
    cdfLogisticDist(x:mean:scale:)
    quantileLogisticDist(p:mean:scale:)

Pareto

    paraParetoDist(minimum:shape:)
    pdfParetoDist(x:minimum:shape:)
    cdfParetoDist(x:minimum:shape:)
    quantileParetoDist(p:minimum:shape:)

binomial

    cdfPoissonDist(k:rate:tail:)
    pdfPoissonDist(k:rate:)

Chi Square

    paraRayleighDist(scale:)
    pdfRayleighDist(x:scale:)
    cdfRayleighDist(x:scale:)
    quantileRayleighDist(p:scale:)

STUDENT's T

    paraStudentTDist(degreesOfFreedom:)
    pdfStudentTDist(t:degreesOfFreedom:rlog:)
    cdfStudentTDist(t:degreesOfFreedom:)
    quantileStudentTDist(p:degreesOfFreedom:)

NON-CENTRAL T-DISTRIBUTION

    paraStudentTDist(degreesOfFreedom:nonCentralityPara:)
    cdfStudentTDist(t:degreesOfFreedom:nonCentralityPara:rlog:)
    pdfStudentTDist(x:degreesOfFreedom:nonCentralityPara:rlog:)
    quantileStudentTDist(p:degreesOfFreedom:nonCentralityPara:rlog:)

TRIANGULAR

    paraTriangularDist(lowerBound:upperBound:mode:)
    pdfTriangularDist(x:lowerBound:upperBound:mode:)
    cdfTriangularDist(x:lowerBound:upperBound:mode:)
    quantileTriangularDist(p:lowerBound:upperBound:mode:)

TRIANGULAR with two params

    paraTriangularDist(lowerBound:upperBound:)
    pdfTriangularDist(x:lowerBound:upperBound:)
    cdfTriangularDist(x:lowerBound:upperBound:)
    quantileTriangularDist(p:lowerBound:upperBound:)

UNIFORM

    paraUniformDist(lowerBound:upperBound:)
    pdfUniformDist(x:lowerBound:upperBound:)
    cdfUniformDist(x:lowerBound:upperBound:)
    quantileUniformDist(p:lowerBound:upperBound:)

Wald / Inverse Normal

    paraWaldDist(mean:lambda:)
    pdfWaldDist(x:mean:lambda:)
    cdfWaldDist(x:mean:lambda:)
    quantileWaldDist(p:mean:lambda:)
    paraInverseNormalDist(mean:lamdba:)
    pdfInverseNormalDist(x:mean:scale:)
    cdfInverseNormalDist(x:mean:scale:)
    quantileInverseNormalDist(p:mean:scale:)

Weibull

    paraWeibullDist(location:scale:shape:)
    pdfWeibullDist(x:location:scale:shape:)
    cdfWeibullDist(x:location:scale:shape:)
    quantileWeibullDist(p:location:scale:shape:)

CIRCULAR DISTRIBUTION

    paraVonMisesDist(mean:concentration:)
    pdfVonMisesDist(x:mean:concentration:)
    cdfVonMisesDist(x:mean:concentration:useExpIntegration:)
    quantileVonMisesDist(p:mean:concentration:) 

    
#### SSHypothesisTesting

Equality of means

    twoSampleTTest(data1:data2:alpha:)
    twoSampleTTest(sample1:sample2:alpha:)
    oneSampleTTest(sample:mean:alpha:)
    oneSampleTTEst(data:mean:alpha:)
    matchedPairsTTest(set1:set2:alpha:)
    matchedPairsTTest(data1:data2:alpha:)
    oneWayANOVA(data:alpha:)
    oneWayANOVA(data:alpha:)
    oneWayANOVA(dataFrame:alpha:)
    multipleMeansTest(dataFrame:alpha:)
    multipleMeansTest(data:alpha:)
    multipleMeansTest(data:alpha:)
    tukeyKramerTest(dataFrame:alpha:)
    tukeyKramerTest(data:alpha:)
    scheffeTest(dataFrame:alpha:)
    bonferroniTest(dataFrame:)

Autocorrelation

    autocorrelationCoefficient(array:lag:)
    autocorrelationCoefficient(data:lag:)
    autocorrelation(array:)
    autocorrelation(data:)

NPAR tests

    kolmogorovSmirnovGoFTest(array:targetDistribution:)
    ksGoFTest(array:targetDistribution:)
    kolmogorovSmirnovGoFTest(data:targetDistribution:)
    ksGoFTest(data:targetDistribution:)
    adNormalityTest(data:alpha:)
    adNormalityTest(array:alpha:)
    mannWhitneyUTest(set1:set2:)
    mannWhitneyUTest(set1:set2:)
    wilcoxonMatchedPairs(set1:set2:)
    wilcoxonMatchedPairs(set1:set2:)
    signTest(set1:set2:)
    signTest(set1:set2:)
    binomialTest(numberOfSuccess:numberOfTrials:probability:alpha:alternative:)
    binomialTest(data:characterSet:testProbability:successCodedAs:alpha:alternative:)
    binomialTest(data:testProbability:successCodedAs:alpha:alternative:)
    kolmogorovSmirnovTwoSampleTest(set1:set2:alpha:)
    kolmogorovSmirnovTwoSampleTest(set1:set2:alpha:)
    waldWolfowitzTwoSampleTest(set1:set2:)
    kruskalWallisHTest(data:alpha:)

Outliers

    grubbsTest(array:alpha:)
    grubbsTest(data:alpha:)
    esdOutlierTest(array:alpha:maxOutliers:testType:)
    esdOutlierTest(data:alpha:maxOutliers:testType:)

Randomness

    runsTest(array:alpha:useCuttingPoint:userDefinedCuttingPoint:alternative:)
    runsTest(data:alpha:useCuttingPoint:userDefinedCuttingPoint:alternative:)

Equality of variances

    bartlettTest(data:alpha:)
    bartlettTest(array:alpha:)
    leveneTest(data:testType:alpha:)
    leveneTest(array:testType:alpha:)
    chiSquareVarianceTest(array:nominalVariance:alpha:)
    chiSquareVarianceTest(sample:nominalVariance:alpha:)
    fTestVarianceEquality(data1:data2:alpha:)
    fTestVarianceEquality(sample1:sample2:alpha:) 

# LICENSE
This framework is published under the [GNU GPL 3](http://www.gnu.org/licenses/)

Copyright 2017,2018 strike65

