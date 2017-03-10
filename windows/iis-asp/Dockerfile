FROM microsoft/dotnet-framework
	RUN DISM /Online /Enable-Feature /FeatureName:IIS-Webserver /all
	RUN DISM /Online /Enable-Feature /FeatureName:IIS-NetFxExtensibility45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:IIS-ISAPIFilter /all
	RUN DISM /Online /Enable-Feature /FeatureName:IIS-ASPNET45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:IIS-ASP /all
	RUN DISM /Online /Enable-Feature /FeatureName:IIS-CGI /all
	RUN DISM /Online /Enable-Feature /FeatureName:WCF-Services45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:WCF-HTTP-Activation45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:WCF-TCP-Activation45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:WCF-Pipe-Activation45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:WCF-MSMQ-Activation45 /all
	RUN DISM /Online /Enable-Feature /FeatureName:WCF-TCP-PortSharing45 /all
	CMD ["Powershell"]
