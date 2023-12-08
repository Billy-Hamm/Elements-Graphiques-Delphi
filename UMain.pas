unit UMain;

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
  FMX.Filter.Effects, FMX.Layouts, FMX.Ani, Unit2, Unit3, uMsgLicence, uFcts,
  UBtnSw, DM1, System.Rtti, FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Fmx.Bind.Grid, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.ScrollBox,
  FMX.Grid;

type
  TFoMain = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    AniIndicator1: TAniIndicator;
    Rectangle2: TRectangle;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LayRectSel: TLayout;
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
    BtnRectAnim: TButton;
    Frame21: TFrBtnSw;
    BtnFoShow: TButton;
    Edit1: TEdit;
    Button3: TButton;
    LayLicenceMsg: TLayout;
    frMsgLicence1: TfrMsgLicence;
    Button4: TButton;
    BtnFctShow: TButton;
    btnDBTest: TButton;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    FloatAnimation6: TFloatAnimation;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ShadowEffect4: TShadowEffect;
    Label9: TLabel;
    ScrollBoxMain: TScrollBox;
    LayBtnConn: TLayout;
    LayRectSelMain: TLayout;
    labDbStatus: TLabel;
    OpenDialog1: TOpenDialog;
    layDB: TLayout;
    layRectSel2: TLayout;
    btnDataDisp: TButton;
    labDataId: TLabel;
    labDataNomCan: TLabel;
    btnSqliteDBTest: TButton;
    btnSqliteDisp: TButton;
    labLoop: TLabel;
    btnGetParams: TButton;



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
    procedure BtnRectAnimClick(Sender: TObject);
    procedure Frame21Circle1Click(Sender: TObject);
    procedure Frame21Rectangle1Click(Sender: TObject);
    procedure BtnFoShowClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BtnFctShowClick(Sender: TObject);
    procedure FloatAnimation6Finish(Sender: TObject);


    function PosElemClique(lab: TLabel): Single;
    function getElemPosX(ElemClick : TControl) : single;
    procedure btnDBTestClick(Sender: TObject);
    procedure btnDataDispClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataDisplay(Sender : TobJect);
    procedure btnSqliteDBTestClick(Sender: TObject);
    procedure btnSqliteDispClick(Sender: TObject);
    procedure btnGetParamsClick(Sender: TObject);
    function DBConStatus(): Boolean;


  private
    { Private declarations }
  public
  AlreadyConn, LoadSuccess : boolean;

    { Public declarations }
  end;

var
  FoMain: TFoMain;
  rectangleDeSelection : TRectangle;
  coorX : Single;
  elemClick : integer;
  dbInfo : string;

implementation

{$R *.fmx}


//cette partie la sert à restaurer le bouton à son état normal pour réésssayer
procedure TFoMain.BtnRectAnimClick(Sender: TObject);
begin
  FloatAnimation1.Enabled := true;
end;

function TFoMain.DBConStatus(): Boolean;
var
  dbFileLoc : TFileName;
begin
  if AlreadyConn = False then
    try
      AlreadyConn:= True;
      with DataModule4.FDConnection1 do
      begin
        labDbStatus.Text.Empty;

        LoginPrompt := False;
        dbInfo := dbInfo + 'Login prompt : ' + BoolToStr ( DataModule4.FDConnection1.LoginPrompt ) + sLineBreak;

        DriverName := 'SQLite';
        dbInfo := dbInfo + 'DriverName : ' + DataModule4.FDConnection1.DriverName + sLineBreak;

        //Verification for file existence :
        if FileExists('F:\Delphi Apps\BdD\sqlitedb.db') = True then
          begin
            Params.Database := ('F:\Delphi Apps\BdD\sqlitedb.db');
            dbInfo := dbInfo + 'Database path : ' + DataModule4.FDConnection1.Params.Database + sLineBreak;
          end
        else
        begin
          TDialogService.ShowMessage('Database file requested not Found');
          with OpenDialog1 do
          begin
            Title := 'Open SQLite (.db) file';
            Filter := ('Sqlite Database|*.db|tous les fichiers|*.*');
            Execute;
          end;
          dbFileLoc := OpenDialog1.FileName;
          Params.Database := (dbFileLoc);
          dbInfo := dbInfo + 'Database path : ' + DataModule4.FDConnection1.Params.Database + sLineBreak;
        end;


        Connected := True;
        dbInfo := dbInfo + 'Connected : ' + BoolToStr ( DataModule4.FDConnection1.Connected ) + sLineBreak;

        labDbStatus.Text := dbInfo;

        Result := True;
      end;
    Except
      AlreadyConn := False;
      Result := False;
    end

  else

end;

procedure TFoMain.btnSqliteDBTestClick(Sender: TObject);
begin
  DBConStatus
end;

procedure TFoMain.BtnFoShowClick(Sender: TObject);
begin
form3.show;
end;

procedure TFoMain.btnGetParamsClick(Sender: TObject);
var i : integer;
begin
//  for i  := 0 to Length( DataModule4.FDConnection1.Params) do
//  begin
    labDbStatus.Text := labDbStatus.Text + BoolToStr(btnGetParams.Enabled)
//  end;

end;

procedure TFoMain.btnSqliteDispClick(Sender: TObject);
begin
    if DBConStatus = True then
      begin
        with DataModule4.FDQuery1 do
        begin

          Connection := DataModule4.FDConnection1;

          SQL.text := ('Select * From ets');

          Active := True;

        end;

        labDataId.Text := '';
        labDataNomCan.Text := '';

//Display the data
      while not DataModule4.FDQuery1.Eof do
        begin

          labDataId.Text := labDataId.Text + DataModule4.FDQuery1.FieldByName('id_ets').AsString + sLineBreak;
          labDataNomCan.text := labDataNomCan.text + DataModule4.FDQuery1.FieldByName('nom_ets').AsString + sLineBreak;

          DataModule4.FDQuery1.Next;
        end;
      end
    else
    TDialogService.ShowMessage('DataBase Connection failed')

end;

procedure TFoMain.Button3Click(Sender: TObject);
begin
restaurerBoutonConn(Sender);
end;

procedure TFoMain.Button4Click(Sender: TObject);
begin
frMsgLicence1.animMsgLicence.StopValue := frMsgLicence1.rectMsgLicence.width;
frMsgLicence1.animMsgLicence.start;
end;

procedure TFoMain.BtnFctShowClick(Sender: TObject);
begin
Fofcts.show;
end;

procedure TFoMain.DataDisplay(Sender: TObject);
begin
  try
    labDataNomCan.text := '';
    labDataId.text := '';
    while not DataModule4.Adoquery1.Eof do
    begin
      labDataId.text := labDataId.text + DataModule4.AdoQuery1.FieldByName('IdCan').AsString + sLineBreak;
      labDataNomCan.text := labDataNomCan.text + DataModule4.AdoQuery1.FieldByName('NomCan').AsString + sLineBreak;

      DataModule4.AdoQuery1.Next;
    end;
  Except
    TDialogService.ShowMessage('DB Connexion Failed')
  end;
end;

procedure TFoMain.btnDataDispClick(Sender: TObject);
begin
  if LoadSuccess = False then
    begin
      btnDBTestClick(Sender);
      DataDisplay(sender)
    end
      else
        DataDisplay(Sender)
end;

procedure TFoMain.btnDBTestClick(Sender: TObject);

var
  dbLoc : string;

begin
  LoadSuccess := False;
  try
    DataModule4.ADOConnection1.ConnectionString := 'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog=TestDB;Data Source=ASHEN-ACER\ASHEN;Initial File Name="";Trust Server Certificate=True;Server SPN="";Authentication="";Access Token="";';
//    dbinfo := 'ConName : ' + DataModule4.ADOConnection1.ConnectionString + sLineBreak ;

    DataModule4.ADOConnection1.loginPrompt := False;
    dbInfo := dbInfo + 'Login prompt : ' + BoolToStr ( DataModule4.ADOConnection1.LoginPrompt ) + sLineBreak;

    DataModule4.ADOQuery1.Connection := DataModule4.ADOconnection1;
    dbinfo := dbinfo +  'Conn : ' + DataModule4.ADOQuery1.Connection.Name + sLineBreak ;

//    DataModule4.SQLConnection1.DriverName := 'Sqlite';
//    dbInfo := dbInfo + 'DriverName : ' + DataModule4.SQLConnection1.connectionName + sLineBreak;

    with DataModule4.ADOQuery1 do
    begin
      SQL.Text := '';
      SQL.Text := 'select * from TestTable';
      Active := True;
    end;
    dbInfo := dbInfo + 'Query status : ' + BoolToStr ( DataModule4.ADOQuery1.Active ) + sLineBreak;

    Datamodule4.Datasource1.Dataset := Datamodule4.Adoquery1;
    dbInfo := dbInfo + 'DataSet : ' + Datamodule4.Datasource1.Dataset.Name + sLineBreak;


//      try
//        OpenDialog1.Filter := ('Sqlite Database|*.db|tous les fichiers|*.*');
//        OpenDialog1.Execute;
//        dbloc := OpenDialog1.FileName;
//
//        DataModule4.SQLConnection1.Params [0] := 'sqlite' ;
//        DataModule4.SQLConnection1.Params [1] := dbLoc ;
//
//        dbInfo := dbInfo + 'dbLoc : ' + DataModule4.SQLConnection1.Params [1] + sLineBreak;
//      except
//        TDialogService.ShowMessage('Fichier invalide');
//      end;

//    DataModule4.SQLConnection1.connected := True;
//    dbInfo := dbInfo + 'Connected : ' + BoolToStr ( DataModule4.SQLConnection1.Connected ) + sLineBreak;

//      try
//        DataModule4.SQLTable1.SQLConnection := DataModule4.SQLConnection1;
//        TDialogService.ShowMessage('sql Conn');
//
//        DataModule4.SQLTable1.TableName := 'ENFANTS';
//        TDialogService.ShowMessage('table name');
//
//        DataModule4.SQLTable1.Active := True;
//        TDialogService.ShowMessage('activation');
//
//        TDialogService.ShowMessage('Table loaded');
//
//      except
//        TDialogService.ShowMessage('file is not a database or is encrypted');
//      end;

//    TDialogService.ShowMessage('DB successfully connected.');
    labDbStatus.Text := dbinfo;
    loadsuccess := True;
  Except
    TDialogService.ShowMessage('File could not be loaded');
  end;
end;


procedure TFoMain.Edit1Change(Sender: TObject);
begin
  restaurerBoutonConn(sender);
end;

//cette partie sert à capturer le clique sur la fenetre (13 = Entrée)
procedure TFoMain.FloatAnimation6Finish(Sender: TObject);
begin
  posFin := Rectangle6.Position.X;
  posDeb := posFin;
  FloatAnimation6.Stop;
end;

procedure TFoMain.FormCreate(Sender: TObject);
begin
  LoadSuccess := False;
  alreadyConn := False;
end;

procedure TFoMain.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if key = 13 then
  verificationIDs(sender);
end;

procedure TFoMain.Frame21Circle1Click(Sender: TObject);
begin
  Frame21.Circle1Click(Sender);
end;

procedure TFoMain.Frame21Rectangle1Click(Sender: TObject);
begin
  Frame21.Rectangle1Click(Sender);
end;

function TFoMain.getElemPosX(ElemClick: TControl): Single;
begin
  Result := ElemClick.position.X;
end;

function TFoMain.PosElemClique(lab: TLabel): Single;
begin
  coorX := lab.Position.X;
  Result := coorX
end;


procedure TFoMain.Label6Click(Sender: TObject);
begin
  with FloatAnimation6 do
    begin
      StartValue := posDeb;
      StopValue :=   getElemPosX(Label6) + 10;
      posDeb := Rectangle6.Position.X;
      Start;
    end;
end;

procedure TFoMain.Label7Click(Sender: TObject);
begin
  with FloatAnimation6 do
    begin
      StartValue := posDeb;
      StopValue := getElemPosX(Label7) + 10;
      posDeb := Rectangle6.Position.X;
      Start;
    end;
end;

procedure TFoMain.Label8Click(Sender: TObject);
begin
  with FloatAnimation6 do
    begin
      StartValue := posDeb;
      StopValue := getElemPosX(Label8) + 10;
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

procedure TFoMain.lancerAttente(Sender: TObject);
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


procedure TFoMain.Rectangle1Click(Sender: TObject);
begin
  verificationIDs(sender);

end;

procedure TFoMain.Rectangle3Click(Sender: TObject);
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

procedure TFoMain.restaurerBoutonConn(Sender: TObject);
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
procedure TFoMain.verificationIDs(Sender: TObject);
begin

  // la on insere le code nécéssaire pour verifier les identifiants
  if strtoint (Edit1.Text) = 1 then
  begin
    lancerAttente(Sender);
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
