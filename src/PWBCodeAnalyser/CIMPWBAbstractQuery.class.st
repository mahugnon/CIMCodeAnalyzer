Class {
	#name : #CIMPWBAbstractQuery,
	#superclass : #Object,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBAbstractQuery class >> runOn: aGroup [
	^ self new runOn: aGroup
]

{ #category : #running }
CIMPWBAbstractQuery >> runOn: aMooseGroup [
	^ self subclassResponsibility
]
