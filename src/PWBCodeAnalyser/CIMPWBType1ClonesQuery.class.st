Class {
	#name : #CIMPWBType1ClonesQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBType1ClonesQuery >> compare: r1 and: r2 [
	^ ((r1 numberOfLinesOfCode = r2 numberOfLinesOfCode
		and: [ r1 numberOfLocalVariables = r2 numberOfLocalVariables ])
		and: [ r1 numberOfFunctionCalls = r2 numberOfFunctionCalls
				and: [ r1 numberOfIterions = r2 numberOfIterions ] ])
		and: [ (r1 numberOfReturns = r2 numberOfReturns
				and: [ r1 numberOfAssignments = r2 numberOfAssignments ])
				and: [ r1 numberOfSelections = r2 numberOfSelections ] ]
]

{ #category : #running }
CIMPWBType1ClonesQuery >> runOn: aCollection [
	^ (aCollection
		collect: [ :each | 
			each name
				-> (aCollection select: [ :method | self compare: each and: method ]) ])
		reject: [ :each | each value size = 1 ]
]
