unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Effects, FMX.Layouts;

type
  TFrame2 = class(TFrame)
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Circle1: TCircle;
    ShadowEffect1: TShadowEffect;
    procedure clickSwitch(Sender: TObject);
    procedure reinitialiserSwitch(sender : TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure Circle1Click(Sender: TObject);
  private

    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

implementation
var
  clicked : boolean;
{$R *.fmx}


procedure TFrame2.clickSwitch(Sender: TObject);

begin
  if clicked = true then
    reinitialiserSwitch(Sender)
  else
  begin
    Circle1.Align := TAlignLayout.Right;
    Rectangle1.Fill.Color := $FF4E4E4E;
    Circle1.Fill.Color := $FFFFFFFF;
    ShadowEffect1.ShadowColor := $FFFFFFFF;
    ShowMessage('false');
    clicked := True;
  end;
end;

procedure TFrame2.reinitialiserSwitch(Sender : TObject);
begin
  Clicked := false;
  Circle1.Align := TAlignLayout.Left;
  Rectangle1.Fill.Color := $FFFFFFFF;
  Circle1.Fill.Color := $FF000000;
  ShadowEffect1.ShadowColor := $FF000000;
end;

procedure TFrame2.Circle1Click(Sender: TObject);
begin
  clickSwitch(Sender);
end;


procedure TFrame2.Rectangle1Click(Sender: TObject);
begin
  clickSwitch(Sender);
end;

end.
