Class {
	#name : #ColorToBlack,
	#superclass : #ColorStrategy,
	#category : #'PWBCodeAnalyser-RoassalElementColorStrategy'
}

{ #category : #private }
ColorToBlack class >> accept: aMooseAdapter [
  ^aMooseAdapter outgoingInvocationsCandidates isEmpty or: [ aMooseAdapter incomingInvocations isEmpty ]
]

{ #category : #accessing }
ColorToBlack >> color [
  ^Color black
]
