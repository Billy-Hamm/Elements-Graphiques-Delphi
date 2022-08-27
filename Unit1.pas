﻿unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.FMXUI.Wait, Data.DB,
  FireDAC.Comp.Client, FMX.Edit, Fmx.DialogService, FMX.Effects,
  FMX.Filter.Effects, FMX.Layouts, FMX.Ani, Unit2, Unit3, uMsgLicence, uFcts;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    AniIndicator1: TAniIndicator;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Layout1: TLayout;
    ShadowEffect1: TShadowEffect;
    rectSel: TRectangle;
    animTrans: TFloatAnimation;
    ShadowEffect2: TShadowEffect;
    Rectangle3: TRectangle;
    FloatAnimationHeight: TFloatAnimation;
    FloatAnimationWidth: TFloatAnimation;
    Label5: TLabel;
    Rectangle4: TRectangle;
    FloatAnimation1: TFloatAnimation;
    ShadowEffect3: TShadowEffect;
    Button1: TButton;
    Layout2: TLayout;
    Frame21: TFrame2;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Layout3: TLayout;
    frMsgLicence1: TfrMsgLicence;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    FloatAnimation6: TFloatAnimation;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ShadowEffect4: TShadowEffect;

    function PosElemClique(lab: TLabel): Single;

    procedure lancerAttente(Sender: TObject);
    procedure restaurerBoutonConn(Sender: TObject);
    procedure verificationIDs(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Rectangle1Click(Sender: TObject);
    //procedure creationRectangleDeSelection(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Frame21Circle1Click(Sender: TObject);
    procedure Frame21Rectangle1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FloatAnimation6Finish(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form1: TForm1;
  rectangleDeSelection : TRectangle;
  coorX : Single;
  elemClick : integer;

implementation

{$R *.fmx}


//cette partie la sert à restaurer le bouton à son état normal pour réésssayer
procedure TForm1.Button1Click(Sender: TObject);
begin
  FloatAnimation1.Enabled := true;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
form3.show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
restaurerBoutonConn(Sender);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
frMsgLicence1.animMsgLicence.StopValue := frMsgLicence1.rectMsgLicence.width;
frMsgLicence1.animMsgLicence.start;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
Fofcts.show;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  restaurerBoutonConn(sender);
end;

//cette partie sert à capturer le clique sur la fenetre (13 = Entrée)
procedure TForm1.FloatAnimation6Finish(Sender: TObject);
begin
  posFin := Rectangle6.Position.X;
  posDeb := posFin;
  FloatAnimation6.Stop;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if key = 13 then
  verificationIDs(sender);
end;

procedure TForm1.Frame21Circle1Click(Sender: TObject);
begin
  Frame21.Circle1Click(Sender);
end;

procedure TForm1.Frame21Rectangle1Click(Sender: TObject);
begin
  Frame21.Rectangle1Click(Sender);
end;

function TForm1.PosElemClique(lab: TLabel): Single;
begin
  coorX := lab.Position.X;
  Result := coorX
end;


procedure TForm1.Label6Click(Sender: TObject);
begin
with FloatAnimation6 do
  begin
    StartValue := posDeb;
    StopValue := label6.Position.X + 10;
    posDeb := Rectangle6.Position.X;
    Start;
  end;
end;

procedure TForm1.Label7Click(Sender: TObject);
begin
with FloatAnimation6 do
  begin
    StartValue := posDeb;
    StopValue := label7.Position.X + 10;
    posDeb := Rectangle6.Position.X;
    Start;
  end;
end;

procedure TForm1.Label8Click(Sender: TObject);
begin
with FloatAnimation6 do
  begin
    StartValue := posDeb;
    StopValue := label8.Position.X + 10;
    posDeb := Rectangle6.Position.X;
    Start;
  end;
end;



(*procedure TForm1.creationRectangleDeSelection(Sender: TObject);
begin
  rectangleDeSelection := TRectangle.Create(Self);
  with rectangleDeSelection do
  begin
    Parent := Layout1;
    Align := TAlignLayout.Left;
    Position.X := 0 ;
    HitTest := False;
    width := 200;
    Opacity := 0.15;
    Fill.Color := $FF878787;
    Stroke.Thickness := 0;
    XRadius := 25;
    YRadius := 25;
    with Margins do
    begin
      Left := 10;
      Right := 10;
      Top := 10;
      Bottom := 10;
    end;
  end;
end;*)

procedure TForm1.lancerAttente(Sender: TObject);
begin
  Label1.Visible := false;
  Rectangle1.Enabled := false;
  Cursor := crHourGlass;
  with AniIndicator1 do
  begin
    Visible := True;
    Enabled := True;
  end;

end;


procedure TForm1.Rectangle1Click(Sender: TObject);
begin
  verificationIDs(sender);
end;

procedure TForm1.Rectangle3Click(Sender: TObject);
begin
  FloatAnimationWidth.Enabled := False;
  FloatAnimationHeight.Enabled := False;
  if FloatAnimationWidth.Enabled = False then
  begin
    //FMX.DialogService.TDialogService.ShowMessage(' ');
    //activer l'animation la premiere fois
    with FloatAnimationHeight do
      begin
        Enabled := True;
        //inverser instantanement l'animation
        AutoReverse:= True;
      end;
    with FloatAnimationWidth do
      begin
        Enabled := True;
        AutoReverse:= True;
      end
  end
    (*begin
      //FMX.DialogService.TDialogService.ShowMessage(' ');
      with FloatAnimationHeight do
         begin
          Enabled := False;
          Enabled := True;
          AutoReverse:= True;
         end;
      with FloatAnimationWidth do
         begin
          Enabled := False;
          Enabled := True;
          AutoReverse:= True;
         end;
    end;*)
end;

procedure TForm1.restaurerBoutonConn(Sender: TObject);
begin
  Label1.Visible := true;
  Rectangle1.Enabled := true;
  Cursor := crHandPoint;
  with AniIndicator1 do
  begin
    Visible := False;
    Enabled := False;
  end;
end;


(*cette partie va servir a verifier les identifiants avant de soit lancer
l'application ou sortir un message d'erreur et restaurer le bouton pour
rééssayer*)
procedure TForm1.verificationIDs(Sender: TObject);
begin
  // la tu pourras inserer le code nécéssaire pour verifier les identifiants
  if strtoint(Edit1.Text) = 1 then
  begin
    lancerAttente(Sender);
    // juste le showmessage il est chiant sur FMX
    FMX.DialogService.TDialogService.ShowMessage('Connexion echouée');
    restaurerBoutonConn(sender);
  end
    else
    lancerAttente(sender);
    (*si il se connecte on devra restaurer le bouton de connexion à son état
    d'origine soit en se decconectant ou juste apres avoir réussie la connexion
    ce qui est préférable*)
    // restaurerBoutonConn(sender)
    (*franchement je met "SENDER" et "SELF" les deux marchent mais je sais pas
    ce qu'est exactement la différence*)
end;

end.
