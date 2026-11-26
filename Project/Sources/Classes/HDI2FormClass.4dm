

property data60 : Boolean
property data120 : Boolean

property quotaNames : Collection
property proposedQuotas : Object
property quotas : Object


Class constructor
	
	This:C1470.quotaNames:=["inBytesPerMin"; "outBytesPerMin"; "inBytesPerHour"; "outBytesPerHour"; \
		"nbRequestsPerMin"; "nbRequestsPerHour"; \
		"inBytesPerMinPerSession"; "outBytesPerMinPerSession"; "inBytesPerHourPerSession"; "outBytesPerHourPerSession"; \
		"nbRequestsPerMinPerSession"; "nbRequestsPerHourPerSession"; \
		"nbSessions"; "nbGuestSessions"; "nbEntitySetsPerSession"]
	
	
Function initProposedQuotas()
	
	Form:C1466.proposedQuotas:={inBytesPerMin: 4000; outBytesPerMin: 3000; nbRequestsPerMin: 5; \
		inBytesPerMinPerSession: 2000; outBytesPerMinPerSession: 3000; nbRequestsPerMinPerSession: 5; \
		nbSessions: 4; nbGuestSessions: 2; nbEntitySetsPerSession: 2}
	
	
Function formEventHandler($formEventCode : Integer)
	
	Case of 
			
		: ($formEventCode=On Load:K2:1)
			
			btnTrace:=False:C215
			
			InitInfo
			
			If (Not:C34(WEB Server:C1674().isRunning))
				//WEB Server().start({sessionCookieSameSite: Web SameSite Lax})
				WEB Server:C1674().start()
				DELAY PROCESS:C323(Current process:C322; 60)
			End if 
			
			This:C1470.initProposedQuotas()
			
			This:C1470.resetQuotas()
			Form:C1466.quotas:=This:C1470.getQuotas()
			
			
		: ($formEventCode=On Page Change:K2:54)
			
			This:C1470.initProposedQuotas()
			
			OBJECT SET VISIBLE:C603(*; "Restarting"; False:C215)
			
			This:C1470.resetQuotas()
			Form:C1466.quotas:=This:C1470.getQuotas()
			
			
		: ($formEventCode=On Timer:K2:25)
			
			var $signal : 4D:C1709.Signal
			var $signaled : Boolean
			
			
			$signal:=New signal:C1641
			CALL WORKER:C1389("startWebServer"; "Worker"; $signal)
			
			$signaled:=$signal.wait()
			
			OBJECT SET TITLE:C194(*; "Restarting"; Localized string("HDI2_Restarted"))
			OBJECT SET RGB COLORS:C628(*; "Restarting"; 0x0016A34A)
			
			Form:C1466.quotas:=This:C1470.getQuotas()
			
			SET TIMER:C645(0)
			
		: ($formEventCode=On Close Box:K2:21)
			If (Is Windows:C1573 && Application info:C1599().SDIMode)
				QUIT 4D:C291
			Else 
				CANCEL:C270
			End if 
			
	End case 
	
	
Function restartWebServer()
	
	If (btnTrace)
		TRACE:C157
	End if 
	
	OBJECT SET TITLE:C194(*; "Restarting"; Localized string("HDI2_Restarting"))
	OBJECT SET RGB COLORS:C628(*; "Restarting"; 0x00E11D48)
	OBJECT SET VISIBLE:C603(*; "Restarting"; True:C214)
	
	SET TIMER:C645(-1)
	
	
Function applyQuota($quotaName : Text; $quotaValue : Integer; $resetQuotas : Boolean)
	
	var $webServerQuotas:=WEB Server:C1674().quotas
	
	If (btnTrace)
		TRACE:C157
	End if 
	
	If ($resetQuotas)
		This:C1470.resetQuotas()
	End if 
	
	$webServerQuotas[$quotaName]:=$quotaValue
	
	Form:C1466.quotas:=This:C1470.getQuotas()
	
	
Function resetQuotas()
	
	var $name : Text
	
	var $webServerQuotas:=WEB Server:C1674().quotas
	
	For each ($name; This:C1470.quotaNames)
		$webServerQuotas[$name]:=Null:C1517
	End for each 
	
	
Function getQuotas() : Object
	
	var $name : Text
	
	var $result:={}
	
	var $webServerQuotas:=WEB Server:C1674().quotas
	
	For each ($name; $webServerQuotas)
		If ($name#"currentValues")
			$result[$name]:=$webServerQuotas[$name]
		End if 
	End for each 
	
	return $result
	
	
Function resetThisQuota($quotaName : Text)
	
	var $webServerQuotas:=WEB Server:C1674().quotas
	
	If (btnTrace)
		TRACE:C157
	End if 
	
	$webServerQuotas[$quotaName]:=Null:C1517
	Form:C1466.proposedQuotas[$quotaName]:=0
	Form:C1466.quotas:=This:C1470.getQuotas()
	
	
Function testNow($action : Text; $option : Text)
	
	var $url:="http://127.0.0.1:8044/testQuotas.html"
	
	If (btnTrace)
		TRACE:C157
	End if 
	
	startComponentWebServer
	
	//http://127.0.0.1:8044/testQuotas.html?action=sendData
	
	$url+="?action="+$action
	
	If (($option#Null:C1517) && ($option#""))
		$url+="&option="+$option
	End if 
	
	$url+="&lang="+Get database localization(Current localization)
	
	OPEN URL:C673($url)
	
	
	
	