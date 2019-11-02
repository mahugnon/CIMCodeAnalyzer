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

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> roassalPresenter [
	^ CIMFunctionInvocationsPresenter
]

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> setContent [
	content := (self outgoingInvocationsCandidates
		collect: [ :each | CIMCodeAnalyserBasicAdapter adapt: each ])
		add: self;
		yourself
]
