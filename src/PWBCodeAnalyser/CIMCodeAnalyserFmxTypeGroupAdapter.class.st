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
	^ pbModel
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ]
]
