unit Unit1;

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
  FMX.Filter.Effects, FMX.Layouts, FMX.Ani, Unit2;

type
  TForm1 = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    AniIndicator1: TAniIndicator;
    Edit1: TEdit;
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

    function PosElemClique(lab: TLabel): Single;

    procedure lancerAttente(Sender: TObject);
    procedure restaurerBoutonConn(Sender: TObject);
    procedure verificationIDs(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Rectangle1Click(Sender: TObject);
    //procedure creationRectangleDeSelection(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Frame21Circle1Click(Sender: TObject);
    procedure Frame21Rectangle1Click(Sender: TObject);
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


//cette partie la sert ? restaurer le bouton ? son ?tat normal pour r??sssayer
procedure TForm1.Button1Click(Sender: TObject);
begin
  FloatAnimation1.Enabled := true;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  restaurerBoutonConn(sender);
end;

//cette partie sert ? capturer le clique sur la fenetre (13 = Entr?e)
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


procedure TForm1.Label2Click(Sender: TObject);
begin
  PosElemClique(Label2);
  if animTrans.Enabled = False then
  begin
    animTrans.StartValue := coorX;
    animTrans.StopValue := Label2.Position.X + 10;
    animTrans.Enabled:= True;
    animTrans.Enabled := False;
  end
  else
    begin
      animTrans.Enabled := False
    end;
end;

procedure TForm1.Label3Click(Sender: TObject);
begin
  PosElemClique(Label3);
  if animTrans.Enabled = False then
  begin
    animTrans.StartValue := coorX;
    animTrans.StopValue := Label3.Position.X + 10;

    animTrans.Enabled:= True;
    animTrans.Enabled := False;
  end
  else
    begin
      animTrans.Enabled := False
    end;
end;

procedure TForm1.Label4Click(Sender: TObject);
begin
  PosElemClique(Label4);
  Label5.Text := FloatToStr(coorX);
    if animTrans.Enabled = False then
  begin
    animTrans.StartValue := coorX;
    animTrans.StopValue := Label4.Position.X + 10;
    animTrans.Enabled:= True;
    animTrans.Enabled := False;
  end
  else
    begin
      animTrans.Enabled := False
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
r??ssayer*)
procedure TForm1.verificationIDs(Sender: TObject);
begin
  // la tu pourras inserer le code n?c?ssaire pour verifier les identifiants
  if strtoint(Edit1.Text) = 1 then
  begin
    // juste le showmessage il est chiant sur FMX
    FMX.DialogService.TDialogService.ShowMessage('Connexion echou?e');
    restaurerBoutonConn(sender);
  end
    else
    lancerAttente(sender);
    (*si il se connecte on devra restaurer le bouton de connexion ? son ?tat
    d'origine soit en se decconectant ou juste apres avoir r?ussie la connexion
    ce qui est pr?f?rable*)
    // restaurerBoutonConn(sender)
    (*franchement je met "SENDER" et "SELF" les deux marchent mais je sais pas
    ce qu'est exactement la diff?rence*)
end;

end.
