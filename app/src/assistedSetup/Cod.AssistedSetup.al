//Used for assisted setup for your extension snippet can be found tassistedsetup should be used to 
//populate all your setup tables and publish end point need for your extension
//Create a setup wizzard to guide user though setup
// codeunit id "Name Meth"
// {
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnRegister', '', false, false)]
//     local procedure AddExtensionAssistedSetup_OnRegisterAssistedSetup();
//     var
//         AssistedSetup: Codeunit "Assisted Setup";
//         CurrentGlobalLanguage: Integer;
//         WizardTxt: label 'Text in Assited Setup List';
//     begin
//         CurrentGlobalLanguage := GlobalLanguage();
//         AssistedSetup.Add(GetAppId(), GetPageId(), WizardTxt, "Assisted Setup Group"::Extensions);
//         GLOBALLANGUAGE(1033);
//         AssistedSetup.AddTranslation(GetAppId(), GetPageId(), 1033, WizardTxt);

//             UpdateStatus();
//     end;

//     //TODO: remove the following subscriber if not necessary to run
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnReRunOfCompletedSetup', '', false, false)]
//     local procedure OnReRunOfCompletedSetup(ExtensionId: Guid; PageID: Integer; var Handled: Boolean)
//     var
//         SetupAlreadyDoneQst: Label 'This setup is already done. Do you want to open the setup page instead?';
//     begin
//         if ExtensionId <> GetAppId() then exit;
//         if PageID <> GetPageId() then exit;

//         if Confirm(SetupAlreadyDoneQst, true) then
//             Page.Run(GetPageId()); //TODO: Might have to be be a different page (like not the wizard, but the setup page instead)

//         Handled := true;
//     end;

//     //TODO: remov the following subscriber if not necessary to run 
//     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Assisted Setup", 'OnAfterRun', '', false, false)]
//     local procedure OnAfterRunOfSetup(ExtensionID: Guid; PageID: Integer)
//     begin
//         if ExtensionId <> GetAppId() then exit;
//         if PageID <> GetPageId() then exit;

//         //TODO: put code here to run 'OnAfterRun' 
//     end;

//     procedure UpdateStatus()
//     var
//         Rec: Record "Just Some Table";
//         AssistedSetup: Codeunit "Assisted Setup";
//     begin
//         if not Rec.Get() then exit;

//         if Rec.Description.ToLower().EndsWith('waldo.be') then  //TODO: You probably are going to want to change this ;-)
//             AssistedSetup.Complete(GetAppId(), GetPageId());
//     end;

//     local procedure GetAppId(): Guid
//     var
//         EmptyGuid: Guid;
//         Info: ModuleInfo;
//     begin
//         if Info.Id() = EmptyGuid then
//             NavApp.GetCurrentModuleInfo(Info);
//         exit(Info.Id());
//     end;

//     local procedure GetPageId(): Integer
//     begin
//         exit(page::"Your Wizard");
//     end;

//     //TODO: Call "SomeAssistedSetup.UpdateStatus(); in case the wizard is run without the assisted setup.  It should call the "UpdateStatus" of this codeunit.
// }
