Class {
	#name : #ColorToBlue,
	#superclass : #ColorStrategy,
	#category : #'PWBCodeAnalyser-RoassalElementColorStrategy'
}

{ #category : #private }
ColorToBlue class >> accept: aMooseAdapter [
  ^aMooseAdapter outgoingInvocationsCandidates isNotEmpty and: [ aMooseAdapter incomingInvocations isNotEmpty ]
]

{ #category : #accessing }
ColorToBlue >> color [
  ^Color blue
]
