// the button has the "accept" standard action
var $window : Integer

If (FORM Event.code=On Clicked)
	If (Form:C1466.quit)
		INVOKE ACTION(ak return to design mode)
	Else 
		// HDI2 instantiates its own form class (HDI2FormClass): do not pass Form
		$window:=Open form window("HDI2"; Plain form window; Horizontally centered; Vertically centered)
		SET WINDOW TITLE(Get window title(Current form window); $window)
		DIALOG("HDI2"; *)
	End if 
End if 
