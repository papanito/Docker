# Image Description
Image containing .Net4.5 and IIS plus required IIS extensions

    IIS-Webserver
    IIS-NetFxExtensibility45
    IIS-ISAPIFilter
    IIS-ASPNET45
    IIS-ASP
    IIS-CGI
    WCF-Services45
    WCF-HTTP-Activation45
    WCF-TCP-Activation45
    WCF-Pipe-Activation45
    WCF-MSMQ-Activation45
    WCF-TCP-PortSharing45

# Issues
Installation of Fature "WCF-Pipe-Activation45" fails

```
Error: 0x800f0922

DISM failed. No operation was performed.
For more information, review the log file.

The DISM log file can be found at C:\Windows\Logs\DISM\dism.log
The command 'cmd /S /C 

Activation45 /all' returned a non-zero code: 2

148469026
```

Output C:\Windows\Logs\DISM\dism.log
```...
2017-03-10 10:24:08, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Provider has previously been initialized.  Returning the existing instance. - CDISMProviderStore::Internal_GetPr
ovider
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Processing the top level command token(enable-feature). - CPackageManagerCLIHandler::Private_ValidateCmdLine
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Attempting to route to appropriate command handler. - CPackageManagerCLIHandler::ExecuteCmdLine
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Routing the command... - CPackageManagerCLIHandler::ExecuteCmdLine
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Encountered the option "featurename" with value "WCF-MSMQ-Activation45" - CPackageManagerCLIHandler::Private_Ge
tPackagesFromCommandLine
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Encountered an unknown option "featurename" with value "WCF-MSMQ-Activation45" - CPackageManagerCLIHandler::Pri
vate_GetPackagesFromCommandLine
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature WCF-Services45 with CBS state 7(CbsInstallStateInstalled) being mapped to dism state 7(DISM_INSTALL_STA
TE_INSTALLED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature NetFx4 with CBS state 7(CbsInstallStateInstalled) being mapped to dism state 7(DISM_INSTALL_STATE_INSTA
LLED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature NetFx4Extended-ASPNET45 with CBS state 7(CbsInstallStateInstalled) being mapped to dism state 7(DISM_IN
STALL_STATE_INSTALLED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature WAS-ProcessModel with CBS state 7(CbsInstallStateInstalled) being mapped to dism state 7(DISM_INSTALL_S
TATE_INSTALLED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature WAS-ConfigurationAPI with CBS state 7(CbsInstallStateInstalled) being mapped to dism state 7(DISM_INSTA
LL_STATE_INSTALLED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature MSMQ-Server with CBS state 4(CbsInstallStateStaged) being mapped to dism state 4(DISM_INSTALL_STATE_STA
GED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Feature MSMQ-Services with CBS state 7(CbsInstallStateInstalled) being mapped to dism state 7(DISM_INSTALL_STAT
E_INSTALLED) - CDISMPackageFeature::LogInstallStateMapping
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Initiating Changes on Package with values: 5, 7 - CDISMPackage::Internal_ChangePackageState
2017-03-10 10:24:08, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 CBS session options=0x40100! - CDISMPackageManager::Internal_Finalize
2017-03-10 10:24:32, Info                  DISM   DISM Package Manager: PID=6108 TID=4556  Error in operation: (null) (CBS HRESULT=0x800f0922) - CCbsConUIHandler::Error
2017-03-10 10:24:32, Error                 DISM   DISM Package Manager: PID=6108 TID=5192 Failed finalizing changes. - CDISMPackageManager::Internal_Finalize(hr:0x800f0922)
2017-03-10 10:24:32, Error                 DISM   DISM Package Manager: PID=6108 TID=5192 Failed processing package changes with session options - CDISMPackageManager::ProcessChangesWithOptions(hr:0x80
0f0922)
2017-03-10 10:24:32, Error                 DISM   DISM Package Manager: PID=6108 TID=5192 Failed ProcessChanges. - CPackageManagerCLIHandler::Private_ProcessFeatureChange(hr:0x800f0922)
2017-03-10 10:24:32, Error                 DISM   DISM Package Manager: PID=6108 TID=5192 Failed while processing command enable-feature. - CPackageManagerCLIHandler::ExecuteCmdLine(hr:0x800f0922)
2017-03-10 10:24:32, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Further logs for online package and feature related operations can be found at %WINDIR%\logs\CBS\cbs.log - CPac
kageManagerCLIHandler::ExecuteCmdLine
2017-03-10 10:24:32, Error                 DISM   DISM.EXE: DISM Package Manager processed the command line but failed. HRESULT=800F0922
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Found the OSServices.  Waiting to finalize it until all other providers are unloaded. - CDISMProviderStore::Fina
l_OnDisconnect
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Found the OSServices.  Waiting to finalize it until all other providers are unloaded. - CDISMProviderStore::Fina
l_OnDisconnect
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Found the PE Provider.  Waiting to finalize it until all other providers are unloaded. - CDISMProviderStore::Fin
al_OnDisconnect
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(DISM Package Manager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Package Manager: PID=6108 TID=5192 Finalizing CBS core. - CDISMPackageManager::Finalize
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: DISM Package Manager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(MsiManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: MsiManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(IntlManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: IntlManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(DriverManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: DriverManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(DISM Unattend Manager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: DISM Unattend Manager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(SmiManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: SmiManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(ProvManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: ProvManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(GenericManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: GenericManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(OfflineSetupManager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: OfflineSetupManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Finalizing the servicing provider(Edition Manager) - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: Edition Manager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Releasing the local reference to OSServices. - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Disconnecting Provider: OSServices - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=6108 TID=5192 Releasing the local reference to DISMLogger.  Stop logging. - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Manager: PID=10200 TID=10816 Closing session event handle 0x188 - CDISMManager::CloseImageSession
2017-03-10 10:24:32, Info                  DISM   DISM.EXE: Image session has been closed. Reboot required=no.
2017-03-10 10:24:32, Info                  DISM   DISM.EXE:
2017-03-10 10:24:32, Info                  DISM   DISM.EXE: <----- Ending Dism.exe session ----->
2017-03-10 10:24:32, Info                  DISM   DISM.EXE:
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=10200 TID=10816 Found the OSServices.  Waiting to finalize it until all other providers are unloaded. - CDISMProviderStore::Fi
nal_OnDisconnect
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=10200 TID=10816 Disconnecting Provider: FolderManager - CDISMProviderStore::Internal_DisconnectProvider
2017-03-10 10:24:32, Info                  DISM   DISM Provider Store: PID=10200 TID=10816 Releasing the local reference to DISMLogger.  Stop logging. - CDISMProviderStore::Internal_DisconnectProvider```

Output %WINDIR%\logs\CBS\cbs.log
```...
2017-03-10 10:24:32, Info                  CBS    Reporting selectable update change for package: Microsoft-Windows-NetFx4-WCF-OC-Package~31bf3856ad364e35~amd64~~10.0.14393.0, update: WCF-MSMQ-Activati
on45, start: Staged, applicable: Installed, target: Installed, client id: DISM Package Manager Provider, initiated offline: False, execution sequence: 82, first merged sequence: 82, download source: 0,
 download time (secs): 4294967295, download status: 0x0 (S_OK),reboot required: False, overall result:0x800f0922 (CBS_E_INSTALLERS_FAILED)
2017-03-10 10:24:32, Info                  CBS    SQM: Update change report datapoints not populated because SQM is not initialized or not running online.
2017-03-10 10:24:32, Info                  CBS    Reporting package change for package: Microsoft-Windows-NetFx4-WCF-OC-Package~31bf3856ad364e35~amd64~~10.0.14393.0, current: Installed, pending: Defaul
t, start: Installed, applicable: Installed, target: Installed, limit: Installed, hotpatch status: StillGoing, status: 0x0, failure source: Execute, reboot required: False, client id: DISM Package Manag
er Provider, initiated offline: False, execution sequence: 82, first merged sequence: 82, reboot reason: REBOOT_NOT_REQUIRED, RM App session: -1, RM App name: N/A, FileName in use: N/A, release type: F
eature Pack, release quality: final, OC operation: True, download source: 0, download time (secs): 4294967295, download status: 0x0 (S_OK), Express download: False, Download Size: 0
2017-03-10 10:24:32, Info                  CBS    SQM: Package change report datapoints not populated because SQM is not initialized or not running online.
2017-03-10 10:24:32, Info                  CBS    Reporting package change completion for package: Microsoft-Windows-NetFx4-WCF-OC-Package~31bf3856ad364e35~amd64~~10.0.14393.0, current: Installed, orig
inal: Installed, target: Installed, status: 0x800f0922, failure source: Execute, failure details: "(null)", client id: DISM Package Manager Provider, initiated offline: False, execution sequence: 82, f
irst merged sequence: 82, pending decision: InteractiveInstallFailed, primitive execution context: Interactive Flight: False
2017-03-10 10:24:32, Info                  CBS    The store corruption status report is incomplete. [HRESULT = 0x80070002 - ERROR_FILE_NOT_FOUND]
2017-03-10 10:24:32, Info                  CBS    Execute time performance datapoint is invalid. [HRESULT = 0x80070490 - ERROR_NOT_FOUND]
2017-03-10 10:24:32, Info                  CBS    SQM: Package change report datapoints not populated because SQM is not initialized or not running online.
2017-03-10 10:24:32, Info                  CBS    FinalCommitPackagesState: Completed persisting state of packages
2017-03-10 10:24:32, Info                  CBS    Enabling LKG boot option
2017-03-10 10:24:32, Info                  CBS    Exec: Processing complete.  Session: 30579072_298067563, Package: Microsoft-Windows-Foundation-Package~31bf3856ad364e35~amd64~~10.0.14393.0 [HRESULT =
0x800f0922 - CBS_E_INSTALLERS_FAILED]
2017-03-10 10:24:32, Error                 CBS    Failed to perform operation.  [HRESULT = 0x800f0922 - CBS_E_INSTALLERS_FAILED]
2017-03-10 10:24:32, Info                  CBS    Session: 30579072_298067563 finalized. Reboot required: no [HRESULT = 0x800f0922 - CBS_E_INSTALLERS_FAILED]
2017-03-10 10:24:32, Info                  CBS    Failed to FinalizeEx using worker session [HRESULT = 0x800f0922]
2017-03-10 10:26:32, Info                  CBS    Trusted Installer is shutting down because: SHUTDOWN_REASON_AUTOSTOP
...
```