# CIMCodeAnalyzer
This is a project to analyze  PowerBuilder  source code for reengineering purpose
 ```Smalltalk
 Metacello new
    	githubUser: 'mahugnon' project: 'CIMCodeAnalyzer' commitish: 'master' path: 'src';
    	baseline: 'PWBCodeAnalyser';
	 onConflict: [ :e | e useIncoming ];
        onUpgrade: [ :e | e useIncoming ];
        
    	load```
