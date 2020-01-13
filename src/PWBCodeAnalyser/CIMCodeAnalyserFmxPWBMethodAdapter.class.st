Class {
	#name : #CIMCodeAnalyserFmxPWBMethodAdapter,
	#superclass : #CIMCodeAnalyserBasicAdapter,
	#category : #'PWBCodeAnalyser-Moose-adapters'
}

{ #category : #visiting }
CIMCodeAnalyserFmxPWBMethodAdapter class >> accept [
	^ {FamixPWBTrigger.
	FamixPWBFunction.
	FamixPWBEvent.
	FamixPWBSubRoutine}
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> allOutgoingInvocationCandidates [
	| scan scanTop |
	scan := OrderedCollection withAll: self outgoingInvocationsCandidates.
	scanTop := 1.
	[ scanTop > scan size ]
		whileFalse: [ scan
				addAll: ((scan at: scanTop) outgoingInvocations flatCollect: #candidates).
			scanTop := scanTop + 1 ].
	^ scan asSet
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> numberOfIncomingInvocations [
  ^self outgoingInvocationsCandidates size
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> numberOfInvocationToward: aCIMCodeAnalyserFmxPWBMethodAdapter [
	^ self outgoingInvocationsCandidatesName
		count: [ :each | each = aCIMCodeAnalyserFmxPWBMethodAdapter ]
]

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> outgoingInvocationsCandidates [
	^ (pbModel outgoingInvocations flatCollect: #candidates) asSet
]

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> outgoingInvocationsCandidatesName [
	^ (pbModel outgoingInvocations flatCollect: #candidates)
		collect: #name
]

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> parentType [
	^ pbModel parentType
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> roassalPresenter [
	^ CIMFunctionInvocationsPresenter
]

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> setContent [
  content := (self allOutgoingInvocationCandidates asOrderedCollection collect: [:each |  CIMCodeAnalyserBasicAdapter adapt: each ])
     add: self;
     yourself
]
