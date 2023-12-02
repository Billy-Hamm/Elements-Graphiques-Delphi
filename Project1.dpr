program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  UMain in 'UMain.pas' {FoMain},
  UBtnSw in 'UBtnSw.pas' {FrBtnSw: TFrame},
  Unit3 in 'Unit3.pas' {Form3},
  uMsgLicence in 'uMsgLicence.pas' {frMsgLicence: TFrame},
  uFcts in '..\Fcts\uFcts.pas' {foFcts};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFoMain, FoMain);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfoFcts, foFcts);
  Application.Run;
end.
