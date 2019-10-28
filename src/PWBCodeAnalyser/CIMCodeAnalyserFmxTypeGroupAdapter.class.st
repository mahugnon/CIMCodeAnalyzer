Class {
	#name : #CIMCodeAnalyserFmxTypeGroupAdapter,
	#superclass : #CIMCodeAnalyserBasicAdapter,
	#category : #'PWBCodeAnalyser-Moose-adapters'
}

{ #category : #visiting }
CIMCodeAnalyserFmxTypeGroupAdapter class >> accept [
	^ {FAMIXTypeGroup.
	FAMIXMethodGroup}
]

{ #category : #accessing }
CIMCodeAnalyserFmxTypeGroupAdapter >> content [
	^ (pbModel
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ])
		asOrderedCollection
		sorted: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ]
]

{ #category : #metrics }
CIMCodeAnalyserFmxTypeGroupAdapter >> cyclomaticComplexity [
	^ self content
		inject: 0
		into: [ :sum :each | sum + each cyclomaticComplexity ]
]

{ #category : #accessing }
CIMCodeAnalyserFmxTypeGroupAdapter >> outgoingInvocations [
	^ self content collect: #outgoingInvocations
]
