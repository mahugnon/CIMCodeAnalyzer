Class {
	#name : #CIMPWBAttributeUsedOnlyOnceQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBAttributeUsedOnlyOnceQuery >> runOn: aMooseGroup [
	^ aMooseGroup
		select: [ :attribut | attribut incomingAccesses size = 1 ]
]
