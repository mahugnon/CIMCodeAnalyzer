Class {
	#name : #CIMPWBAbstractQuery,
	#superclass : #Object,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBAbstractQuery >> runOn: aMooseGroup [
	^ self subclassResponsibility
]
