unit uMsgLicence;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Ani, FMX.Controls.Presentation, FMX.Objects;

type
  TfrMsgLicence = class(TFrame)
    rectMsgLicence: TRectangle;
    Label1: TLabel;
    animMsgLicence: TFloatAnimation;
    procedure animMsgLicenceFinish(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation

{$R *.fmx}

procedure TfrMsgLicence.animMsgLicenceFinish(Sender: TObject);
begin
Label1.Position.X:= -abs(Label1.Width);
animMsgLicence.Duration := 7;
animMsgLicence.Start;
end;

end.
