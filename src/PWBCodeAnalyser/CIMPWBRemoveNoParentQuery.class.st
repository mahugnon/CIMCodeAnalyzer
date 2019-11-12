Class {
	#name : #CIMPWBRemoveNoParentQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBRemoveNoParentQuery >> runOn: aMooseGroup [
	^ aMooseGroup reject: [ :each | each belongsTo = nil ]
]
