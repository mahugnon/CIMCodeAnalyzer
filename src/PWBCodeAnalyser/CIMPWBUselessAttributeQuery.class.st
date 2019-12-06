Class {
	#name : #CIMPWBUselessAttributeQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBUselessAttributeQuery >> runOn: aMooseGroup [
	^ aMooseGroup select: [ :each | each incomingAccesses isEmpty ]
]
