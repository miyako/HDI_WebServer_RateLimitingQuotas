//%attributes = {}
#DECLARE($params : Object)

var $title : Text
var $window; $i; $left; $top; $right; $bottom : Integer
var $options : Object
$title:=""  // the splash is a title-less card; HDI2 inherits the same title

If (Count parameters:C259=0)
	
	// already open? bring it to the front instead of opening a duplicate
	ARRAY LONGINT($windows; 0)
	WINDOW LIST($windows)
	For ($i; 1; Size of array($windows))
		$window:=$windows{$i}
		If (Window process($window)=1) && (Get window title($window)=$title)
			GET WINDOW RECT($left; $top; $right; $bottom; $window)
			CALL FORM($window; Formula(SET WINDOW RECT($left; $top; $right; $bottom; $window)))
			return 
		End if 
	End for 
	
	CALL WORKER(1; Current method name:C684; {})
	
Else 
	
	SET MENU BAR(1)
	
	$options:={}
	$options.title:=Localized string("HDI_Title")
	$options.info:=Localized string("HDI_Info")
	$options.blog:="blog.4d.com"
	$options.minimumVersion:="2150"  // 2150 = 4D 21 R5
	// $options.license:=4D View license  // if the demo needs a license
	
	$window:=Open form window("HDI"; Plain form window; Horizontally centered; Vertically centered)
	SET WINDOW TITLE($title; $window)
	DIALOG("HDI"; $options; *)
	
End if 
