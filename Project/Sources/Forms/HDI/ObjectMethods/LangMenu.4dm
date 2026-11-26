var $lang : Text

If (FORM Event.code=On Data Change)
	
	$lang:=["en"; "ja"][Form:C1466.languages.index]
	SET DATABASE LOCALIZATION($lang)
	
	// reopen the splash so that every :xliff: reference is resolved again
	CANCEL:C270
	CALL WORKER(1; "00_Start"; {})
	
End if 
