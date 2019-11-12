Class {
	#name : #CIMPWBComputeCloneMetricsQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBComputeCloneMetricsQuery >> runOn: aMooseGroup [
	^ (aMooseGroup asSet
		collect: [ :each | 
			CloneMetricsResult new
				name: each name;
				parent:  each belongsTo ;
				numberOfLinesOfCode: each numberOfLinesOfCode;
				numberOfLocalVariables: each numberOfLocalVariables;
				numberOfFunctionCalls: each outgoingInvocations size;
				numberOfIterions: each numberOfIterationStatements;
				numberOfReturns: each numberOfReturnStatements;
				numberOfAssignments: each numberOfAssignationStatements;
				numberOfSelections: each selectionStatement;
				yourself ]) asOrderedCollection
]
