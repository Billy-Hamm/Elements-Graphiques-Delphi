program Delphi_UI;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMain in 'UMain.pas' {FoMain},
  UBtnSw in 'UBtnSw.pas' {FrBtnSw: TFrame},
  Unit3 in 'Unit3.pas' {Form3},
  uMsgLicence in 'uMsgLicence.pas' {frMsgLicence: TFrame},
  uFcts in '..\Fcts\uFcts.pas' {foFcts},
  DM1 in 'DM1.pas' {DataModule4: TDataModule},
  UEmployeeDataDisplayFrame in 'UEmployeeDataDisplayFrame.pas' {frDataDisplay: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFoMain, FoMain);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfoFcts, foFcts);
  Application.CreateForm(TDataModule4, DataModule4);
  Application.Run;
end.
