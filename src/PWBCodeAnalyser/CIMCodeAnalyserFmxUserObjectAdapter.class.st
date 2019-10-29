Class {
	#name : #CIMCodeAnalyserFmxUserObjectAdapter,
	#superclass : #CIMCodeAnalyserBasicAdapter,
	#category : #'PWBCodeAnalyser-Moose-adapters'
}

{ #category : #visiting }
CIMCodeAnalyserFmxUserObjectAdapter class >> accept [
	^ {FamixPWBUserObject}
]

{ #category : #accessing }
CIMCodeAnalyserFmxUserObjectAdapter >> content [
	^ (pbModel methods
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ])
		sort: [ :a :b | a numberOfLinesOfCode > b numberOfLinesOfCode ]
]

{ #category : #metrics }
CIMCodeAnalyserFmxUserObjectAdapter >> cyclomaticComplexity [
	^ self content
		inject: 0
		into: [ :sum :each | sum + each cyclomaticComplexity ]
]

{ #category : #api }
CIMCodeAnalyserFmxUserObjectAdapter >> incomingReferences [
	^ pbModel incomingReferences collectAsSet: #from
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxUserObjectAdapter >> numberOfMethods [
	^ self content size
]

{ #category : #accessing }
CIMCodeAnalyserFmxUserObjectAdapter >> outgoingInvocations [
	^ self content collect: #outgoingInvocations
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxUserObjectAdapter >> outgoingReferencesTo [
	^ pbModel outgoingInvocations collectAsSet: #to
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxUserObjectAdapter >> roassalPresenter [
	^ CIMFunctionInvocationsPresenter
]
