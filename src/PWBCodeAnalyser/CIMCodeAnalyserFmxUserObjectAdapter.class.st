Class {
	#name : #CIMCodeAnalyserFmxUserObjectAdapter,
	#superclass : #CIMCodeAnalyserBasicAdapter,
	#category : #'PWBCodeAnalyser-Moose-adapters'
}

{ #category : #visiting }
CIMCodeAnalyserFmxUserObjectAdapter class >> accept [
	^ {FamixPWBUserObject}
]

{ #category : #metrics }
CIMCodeAnalyserFmxUserObjectAdapter >> adaptPbModel [
	^ ((((pbModel methods asSet
		reject: [ :method | method name = 'constructor' or: method name = 'destroy' ])
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ])
		flatCollect: #withAllOutgoingInvocationCandidates)
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ])
		asOrderedCollection
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
CIMCodeAnalyserFmxUserObjectAdapter >> incomingReferencesFrom [
	^ pbModel incomingReferences collect: #from
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxUserObjectAdapter >> incomingReferencesFromNames [
	^ pbModel incomingReferences
		collect: [ :reference | reference from name ]
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
CIMCodeAnalyserFmxUserObjectAdapter >> roassalPresenter [
	^ CIMFunctionInvocationsPresenter
]

{ #category : #accessing }
CIMCodeAnalyserFmxUserObjectAdapter >> setContent [
	content := self adaptPbModel
]
