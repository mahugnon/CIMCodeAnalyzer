Class {
	#name : #CIMCodeAnalyserFmxTypeGroupAdapter,
	#superclass : #CIMCodeAnalyserBasicAdapter,
	#category : #PWBCodeAnalyser
}

{ #category : #visiting }
CIMCodeAnalyserFmxTypeGroupAdapter class >> accept [
	^ {FAMIXTypeGroup}
]

{ #category : #accessing }
CIMCodeAnalyserFmxTypeGroupAdapter >> content [
	^ (pbModel
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ])
		sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ]
]

{ #category : #metrics }
CIMCodeAnalyserFmxTypeGroupAdapter >> cyclomaticComplexity [
	^ self content
		inject: 0
		into: [ :sum :each | sum + each cyclomaticComplexity ]
]
