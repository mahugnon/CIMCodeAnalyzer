Class {
	#name : #CIMCodeAnalyserFmxUserObjectAdapter,
	#superclass : #CIMCodeAnalyserBasicAdapter,
	#category : #PWBCodeAnalyser
}

{ #category : #visiting }
CIMCodeAnalyserFmxUserObjectAdapter class >> accept [
	^ {FamixPWBUserObject}
]

{ #category : #accessing }
CIMCodeAnalyserFmxUserObjectAdapter >> content [
	^ pbModel methods
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ]
]
