program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Frame2: TFrame},
  Unit3 in 'Unit3.pas' {Form3},
  uMsgLicence in 'uMsgLicence.pas' {frMsgLicence: TFrame},
  uFcts in '..\Fcts\uFcts.pas' {foFcts};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TfoFcts, foFcts);
  Application.Run;
end.
