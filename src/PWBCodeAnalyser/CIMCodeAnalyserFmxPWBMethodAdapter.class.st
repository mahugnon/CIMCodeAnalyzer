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

{ #category : #accessing }
CIMCodeAnalyserFmxPWBMethodAdapter >> outgoingInvocations [
	^ pbModel outgoingInvocations flatCollect: #candidates
]
