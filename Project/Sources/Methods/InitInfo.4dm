//%attributes = {"invisible":true}
// Tab titles and step descriptions come from Resources/<lang>.lproj/HDI2*.xlf

var $i : Integer
var $key : Text

Infos:=[]
For ($i; 1; 8)
	Infos.push({PageNumber: $i; TabTitle: Localized string("HDI2_Tab"+String:C10($i)); Description: Localized string("HDI2_Info"+String:C10($i))})
End for 

Infos2:=[]
For each ($key; ["A"; "B"; "C"; "D"; "E"])
	Infos2.push({Description: Localized string("HDI2_Info"+$key)})
End for each 

objTabs:={values: Infos.extract("TabTitle"); index: 0}
