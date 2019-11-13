Class {
	#name : #CIMPWBRemoveConstructorsQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBRemoveConstructorsQuery >> runOn: aMooseGroup [
	^ aMooseGroup reject: [ :each | self toRemove includes: each name ]
]

{ #category : #'as yet unclassified' }
CIMPWBRemoveConstructorsQuery >> toRemove [
	^ #('constructor' 'destroy' 'create')
]
