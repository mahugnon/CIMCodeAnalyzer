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

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> content [
	^ {}
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> numberOfInvocationToward: aCIMCodeAnalyserFmxPWBMethodAdapter [
	^ self outgoingInvocationsCandidates
		count: [ :each | each = aCIMCodeAnalyserFmxPWBMethodAdapter ]
]

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> outgoingInvocationsCandidates [
	^ (pbModel outgoingInvocations flatCollect: #candidates)
		collect: #name
]

{ #category : #'as yet unclassified' }
CIMCodeAnalyserFmxPWBMethodAdapter >> roassalPresenter [
	^ CIMFunctionInvocationsPresenter
]
