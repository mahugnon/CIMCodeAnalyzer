Class {
	#name : #CIMPWBUnusedFunctionQuery,
	#superclass : #CIMPWBAbstractQuery,
	#category : #'PWBCodeAnalyser-Queries'
}

{ #category : #running }
CIMPWBUnusedFunctionQuery >> runOn: aMooseGroup [
	^ (CIMPWBRemoveConstructorsQuery runOn: aMooseGroup)
		select: [ :function | 
			function outgoingInvocations isEmpty
				and: function incomingInvocations isEmpty ]
]
