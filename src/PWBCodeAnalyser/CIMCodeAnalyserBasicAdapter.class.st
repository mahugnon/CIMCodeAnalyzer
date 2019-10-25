Class {
	#name : #CIMCodeAnalyserBasicAdapter,
	#superclass : #Object,
	#instVars : [
		'pbModel'
	],
	#category : #PWBCodeAnalyser
}

{ #category : #visiting }
CIMCodeAnalyserBasicAdapter class >> accept [
	^ self subclassResponsibility
]

{ #category : #initialization }
CIMCodeAnalyserBasicAdapter class >> adapt: aFamixClass [
	^ (self subclasses
		detect: [ :sub | sub accept includes: aFamixClass class ])
		new: aFamixClass
]

{ #category : #initialization }
CIMCodeAnalyserBasicAdapter class >> new: aFamixClass [
	^ self new pbModel: aFamixClass
]

{ #category : #accessing }
CIMCodeAnalyserBasicAdapter >> content [
	^ self subclassResponsibility
]

{ #category : #accessing }
CIMCodeAnalyserBasicAdapter >> name [
	^ pbModel name
]

{ #category : #metrics }
CIMCodeAnalyserBasicAdapter >> numberOfLinesOfCode [
	^ pbModel numberOfLinesOfCode
]

{ #category : #accessing }
CIMCodeAnalyserBasicAdapter >> pbModel [
	^ pbModel
]

{ #category : #accessing }
CIMCodeAnalyserBasicAdapter >> pbModel: anObject [
	pbModel := anObject
]
