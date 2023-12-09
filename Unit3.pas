unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Ani,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TForm3 = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Button1: TButton;
    FloatAnimation1: TFloatAnimation;
    FloatAnimation2: TFloatAnimation;
    Button2: TButton;
    Circle1: TCircle;
    FloatAnimation3: TFloatAnimation;
    FloatAnimation4: TFloatAnimation;
    Rectangle3: TRectangle;
    Button3: TButton;
    FloatAnimation5: TFloatAnimation;
    Button4: TButton;
    Label1: TLabel;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    FloatAnimation6: TFloatAnimation;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FloatAnimation1Finish(Sender: TObject);
    procedure FloatAnimation2Finish(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FloatAnimation3Finish(Sender: TObject);
    procedure FloatAnimation4Finish(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure FloatAnimation6Finish(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    posDeb, posFin : Single;
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;
  stopAni : Boolean;

implementation

{$R *.fmx}

procedure TForm3.Button1Click(Sender: TObject);
begin
stopAni := false;
FloatAnimation1.StopValue := Rectangle1.Width - Rectangle2.Width;
FloatAnimation1.Start;
//FloatAnimation3.StopValue := Rectangle1.Width - Circle1.Width;
//FloatAnimation3.Start;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
stopAni := True;

FloatAnimation1.Stop;
FloatAnimation2.Stop;

//FloatAnimation3.Stop;
//FloatAnimation4.Stop;
end;

procedure TForm3.Button3Click(Sender: TObject);
begin
FloatAnimation5.Start;
end;

procedure TForm3.Button4Click(Sender: TObject);
begin
FloatAnimation5.Stop;
end;

procedure TForm3.FloatAnimation1Finish(Sender: TObject);
begin
FloatAnimation1.Stop;
FloatAnimation2.Start;
//FloatAnimation3.Stop;
//Floatanimation4.Start;
end;

procedure TForm3.FloatAnimation2Finish(Sender: TObject);
begin
FloatAnimation2.Stop;
if stopAni = false then
FloatAnimation1.Start
  else
    exit
//FloatAnimation4.Stop;
//FloatAnimation3.Start;
end;

procedure TForm3.FloatAnimation3Finish(Sender: TObject);
begin
FloatAnimation3.Stop;
Floatanimation4.Start;
end;

procedure TForm3.FloatAnimation4Finish(Sender: TObject);
begin
  FloatAnimation4.Stop;
    if stopAni = false then
      FloatAnimation3.Start
    else
      exit
end;

procedure TForm3.FloatAnimation6Finish(Sender: TObject);
begin
  posFin := Rectangle5.Position.X;
  posDeb := posFin;
  FloatAnimation6.Stop;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
stopAni := True;
FloatAnimation1.Stop;
FloatAnimation2.Stop;
//FloatAnimation3.Stop;
//FloatAnimation4.Stop;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  posDeb := Rectangle5.Position.X;
end;

procedure TForm3.Label2Click(Sender: TObject);
begin
with FloatAnimation6 do
  begin
    StartValue := posDeb;
    StopValue := Label2.Position.X + 10;
    posDeb := Rectangle5.Position.X;
    Start;
  end;
end;

procedure TForm3.Label3Click(Sender: TObject);
begin
with FloatAnimation6 do
  begin
    StartValue := posDeb;
    StopValue := Label3.Position.X + 10;
    posDeb := Rectangle5.Position.X;
    Start;
  end;
end;

procedure TForm3.Label4Click(Sender: TObject);
begin
with FloatAnimation6 do
  begin
    StartValue := posDeb;
    StopValue := label4.Position.X + 10;
    posDeb := Rectangle5.Position.X;
    Start;
  end;
end;

end.
