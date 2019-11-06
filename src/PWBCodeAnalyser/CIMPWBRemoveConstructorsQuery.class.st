Class {
	#name : #CIMPWBRemoveConstructorsQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBRemoveConstructorsQuery >> runOn: aMooseGroup [
	^ aMooseGroup
		reject: [ :each | each name = 'constructor' or: each name = 'destroy' ]
]
