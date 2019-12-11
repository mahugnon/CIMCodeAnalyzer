Class {
	#name : #QueryPWBInstanceVariables,
	#superclass : #Object,
	#category : #'CIMPWBFunctionDecomposition-Queries'
}

{ #category : #running }
QueryPWBInstanceVariables >> runOn: aMethod [
	^ aMethod variables select: [ :var | var name matchesRegex: 'i.*' ]
]
