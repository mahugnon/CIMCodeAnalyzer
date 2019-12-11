Class {
	#name : #QueryPWBInstanceVariablesWithSameName,
	#superclass : #Object,
	#category : #'CIMPWBFunctionDecomposition-Queries'
}

{ #category : #'as yet unclassified' }
QueryPWBInstanceVariablesWithSameName >> runOn: aCollection with: aString [
	^ aCollection
		flatCollectAsSet: [ :each | 
			(QueryPWBInstanceVariables new runOn: each)
				select: [ :variable | variable name = aString ] ]
]
