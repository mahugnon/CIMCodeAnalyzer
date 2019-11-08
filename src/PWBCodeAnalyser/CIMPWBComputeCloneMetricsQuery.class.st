Class {
	#name : #CIMPWBComputeCloneMetricsQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBComputeCloneMetricsQuery >> runOn: aMooseGroup [
	^ aMooseGroup
		collect: [ :each | 
			each name
				->
					(CloneMetricsResult new
						numberOfLinesOfCode: each numberOfLinesOfCode;
						numberOfLocalVariables: each numberOfLocalVariables;
						numberOfFunctionCalls: each outgoingInvocations size;
						numberOfIterions: each numberOfIterationStatements;
						numberOfReturns: each numberOfReturnStatements;
						numberOfAssignments: each numberOfAssignationStatements;
						numberOfSelections: each selectionStatement) ]
]
