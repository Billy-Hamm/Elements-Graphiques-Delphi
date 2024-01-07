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
  FMX.Grid, UEmployeeDataDisplayFrame;

type

  //////////////////////////////////////////////////////////
                          {custom types}
  arrayofFrame = array of TFrame;
  arrayOfLayout = array of TLayout;
  arrayOfLabel = array of TLabel;

  arrayOfDBCount = array [0..1] of Integer;
  arrayOfArrayOfString = array of array of string;
                          {custom types}
  //////////////////////////////////////////////////////////
  TFoMain = class(TForm)
    Rectangle1: TRectangle;
    Label1: TLabel;
    AniIndicator1: TAniIndicator;
    RectMenu1: TRectangle;
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
    RectMenu2: TRectangle;
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
    FloatAnimation2: TFloatAnimation;
    labCount: TLabel;
    layDataFrame: TLayout;
    BtnDisplayData: TButton;
    Button1: TButton;
    FlowLayout1: TFlowLayout;
    Button2: TButton;

    ////////////////////////////////////

    procedure lancerAttente(Sender: TObject);
    procedure restaurerBoutonConn(Sender: TObject);
    procedure verificationIDs(Sender: TObject);

    ////////////////////////////////////

    procedure Edit1Change(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure Rectangle1Click(Sender: TObject);
    //procedure creationRectangleDeSelection(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure Label8Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure BtnRectAnimClick(Sender: TObject);
    procedure Frame21Circle1Click(Sender: TObject);
    procedure Frame21Rectangle1Click(Sender: TObject);
    procedure BtnFoShowClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure BtnFctShowClick(Sender: TObject);
    procedure SliderAnimation( SliderFloatAnimation : TFloatanimation; RectangleSlider : TRectangle; Sender : Tcontrol);

    procedure btnDBTestClick(Sender: TObject);
    procedure btnDataDispClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataDisplay(Sender : TobJect);
    procedure btnSqliteDBTestClick(Sender: TObject);
    procedure btnSqliteDispClick(Sender: TObject);

    procedure BtnDisplayDataClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);

                  {custom functions}
    function PosElemClique(lab: TLabel): Single;
    function getElemPosX(ElemClick : TControl) : single;

    function FrameCreate() : ArrayOfFrame;
    function LayoutCreate () : ArrayOfLayout;
    function LabelCreate () : ArrayOfLabel;

    function DBConStatus(): Boolean;
    function databaseRecordAndFieldCount () : arrayOfDBCount;

    function GetData (FDCOnn : TFDConnection;
    FDQuery : TFDQuery; FieldName : string ) : TArray<string>;
                  {custom functions}

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);


  private
//  procedure OnAnimFinish(Sender : TObject; floatAnim : TFloatAnimation; RectSlider : TRectangle);
  procedure myFinishEvent(Sender : TObject; rectslider : Trectangle; floatAnim : TFloatAnimation );

//  FloatAnim : TFloatAnimation;
  //myFinishEvent  : TNotifyEvent;
    { Private declarations }
  public
  AlreadyConn, LoadSuccess : boolean;

    { Public declarations }
  end;

var
  FoMain: TFoMain;
  rectangleDeSelection : TRectangle;
  coorX : Single;
  elemClick, J : integer;
  dbInfo : string;
  startPos, finalPos : single;
  globalFloatAnimName : TFloatAnimation;

  alreadyCreated : Boolean;
  frDyn : ArrayofFrame;
  Frame : TFrame;
  layoutDyn : TLayout;
  contentLabel : TLabel;
  dbRecCount : integer;

  labDataArray : array of Tlabel;

implementation

{$R *.fmx}


function TFoMain.FrameCreate(): ArrayOfFrame;
var

X : integer;

begin
  if alreadyCreated = False then
    begin
      alreadyCreated := True;

      SetLength(FrDyn, databaseRecordAndFieldCount[0]);

      for X := 0 to databaseRecordAndFieldCount [0] - 1 do
      begin
        Frame := UEmployeeDataDisplayFrame.TfrDataDisplay.Create(layDataFrame);
        with Frame do
        begin
          Name := Name + IntToStr(x);

          Parent := FlowLayout1;

          {* this is to align them in ascending order, because without
          that we get Frame 1 on top , then the last frame, then the frame
          before it and so on for some reason *}

          Align := TAlignLayout.Top;
          Align := TAlignLayout.Bottom;
          Align := TAlignLayout.Top;

          FrDyn[X] := Frame;
        end;

        {*dynamically create a layout to host the label and align to Top
        because if you align them to Top without a layout they will  push
        any element on the right or left in th frame*}
      end;
      Result := FrDyn;
      alreadyCreated := False;
    end;
end;

function TFoMain.LabelCreate : ArrayOfLabel;
var
ArrayOfLabels : ArrayOfLabel;
ArrayOfResultLayouts : ArrayOfLayout;
I, X, IntStart, IntFinal, IntLab : Integer;

begin
  ArrayOfResultLayouts := LayoutCreate;

  SetLength(ArrayOfLabels, (databaseRecordAndFieldCount[0]*3) - 1);
  for I := 0 to Length(ArrayOfLabels) do
  begin
    contentlabel := Tlabel.Create(Frame);
    with contentLabel do
    begin
      Name := 'LabDyn' + IntToStr(I);
      Align := TAlignLayout.Top;

      Text := 'test' + IntToStr(I);

      Arrayoflabels[I] := contentLabel;
    end;
  end;
  Result := ArrayOfLabels;

  X := 0;
  IntStart := 0;
  IntFinal := 2;

  for J := 0 to Length(ArrayOfLabels) do
  begin
    for IntLab := IntStart to IntFinal do
    ArrayOfLabels[IntLab].Parent := ArrayOfResultLayouts[X];

    if X < (Length(ArrayOfResultLayouts)) then
      begin
        IntStart := IntStart + 2;
        IntFinal := IntFinal + 2;
        X := X + 1;
      end

      else
        break

  end;
end;


function TFoMain.LayoutCreate (): ArrayOfLayout;
var
ArrayOfLayouts : ArrayOfLayout;
I : Integer;

begin
  SetLength(ArrayOfLayouts, (databaseRecordAndFieldCount [0] - 1) );
  for I := 0 to databaseRecordAndFieldCount[0] - 1 do
  begin
    layoutDyn := Tlayout.Create(Frame);
    with layoutDyn do
    begin
      Parent := Frame;
      Name := 'LayoutDyn' + IntToStr(I);
      Align := TAlignLayout.Client;
      Arrayoflayouts[I] := layoutdyn;
    end;
  end;
Result := ArrayOfLayouts;
end;


function TFoMain.GetData( FDConn: TFDConnection;
FDQuery : TFDQuery; FieldName : string): TArray<string>;
var
  ArrayOfID : TArray<string>;
  I, J : integer;
begin
  SetLength(ArrayOfId, databaseRecordAndFieldCount[0]);
  with FDQuery do
        begin

          Connection := DataModule4.FDConnection1;

          SQL.Text.Empty;
          SQL.text := ('SELECT * FROM ets');

          Active := True;

        end;


  for I := 0 to databaseRecordAndFieldCount[0] - 1 do
    begin
      ArrayOfID[I] := FDQuery.FieldByName(FieldName).AsString;

      FDQuery.Next;
    end;
    FDQuery.Close;
  Result := ArrayOfId;
end;

procedure TFoMain.myFinishEvent(Sender : TObject; rectslider: Trectangle;floatAnim : TFloatAnimation );
  begin
    finalPos := RectSlider.Position.X;
    startPos := finalPos;
    floatAnim.Stop
  end;

procedure TFoMain.SliderAnimation(SliderFloatAnimation : TFloatanimation; RectangleSlider : TRectangle; Sender : Tcontrol);
var
  ClickedElement : TControl;
begin

  ClickedElement := Sender;
  //globalFloatAnimName := SliderFloatAnimation;

    with SliderFloatAnimation do
      begin

        PropertyName := 'Position.X';

        StartValue := startPos;

        StopValue :=   getElemPosX(ClickedElement) + 10;

        startPos := RectangleSlider.Position.X;

        OnFinish:=nil;

        //OnFinish := myFinishEvent(Sender, RectangleSlider, SliderFloatAnimation);

        Start;
      end;

end;


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
        if FileExists ('E:\Delphi Apps\BdD\sqlitedb.db') = True then
          begin
            Params.Database := ('E:\Delphi Apps\BdD\sqlitedb.db');
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

procedure TFoMain.btnSqliteDispClick(Sender: TObject);
var
I : integer;
arrayOfField1, arrayOfField2, arrayOfField3 : array of string;
begin
    if DBConStatus = True then
      begin
        I := 1;
        with DataModule4.FDQuery1 do
        begin

          Connection := DataModule4.FDConnection1;

          SQL.Text.Empty;
          SQL.text := ('SELECT * FROM ets');

          Active := True;

        end;

        labDataId.Text := '';
        labDataNomCan.Text := '';

//Display the data
      while not DataModule4.FDQuery1.Eof do
        begin
          labDataId.Text := labDataId.Text + DataModule4.FDQuery1.FieldByName('id_ets').AsString + sLineBreak;
          labDataNomCan.text := labDataNomCan.text + DataModule4.FDQuery1.FieldByName('nom_ets').AsString + sLineBreak;

          I := I + 1;

          DataModule4.FDQuery1.Next;
        end;
      end
    else
    TDialogService.ShowMessage('DataBase Connection failed')

end;

procedure TFoMain.BtnDisplayDataClick(Sender: TObject);
begin
  DBConStatus;

  databaseRecordAndFieldCount;
    FrameCreate();
        LabelCreate();
end;

procedure TFoMain.Button1Click(Sender: TObject);
var

I : integer;

begin
//  GetData(Datamodule4.FDConnection1, Datamodule4.FDQuery1, 'id_ets')
//for I := 0 to ((databaseRecordAndFieldCount[0] * 3) - 1) do
//  labCount.Text := labCount.Text + LayoutCreate[I].name + sLineBreak;
LabelCreate;

end;

procedure TFoMain.Button2Click(Sender: TObject);
begin
  labDbStatus.Text := GetCurrentDir;
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


function TFoMain.databaseRecordAndFieldCount  : arrayOfDBCount;
var
fieldCount, recordCount : integer;

begin
  DBConStatus;
    with DataModule4.FDQuery1 do
      begin
        Connection := DataModule4.FDConnection1;
        SQL.Text := ('SELECT * FROM ets');
        Active := true;
      end;
      Result [0] := DataModule4.FDQuery1.RecordCount;
      Result [1] := DataModule4.FDQuery1.FieldCount;
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
    DataModule4.ADOConnection1.ConnectionString := 'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security Info=False;User ID="";Initial Catalog="";Data Source=DESKTOP-6F8DECJ\ASHEN;Initial File Name="";Trust Server Certificate=True;Server SPN="";Authentication="";Access Token=""';

    DataModule4.ADOConnection1.loginPrompt := False;
    dbInfo := dbInfo + 'Login prompt : ' + BoolToStr ( DataModule4.ADOConnection1.LoginPrompt ) + sLineBreak;

    DataModule4.ADOQuery1.Connection := DataModule4.ADOconnection1;
    dbinfo := dbinfo +  'Conn : ' + DataModule4.ADOQuery1.Connection.Name + sLineBreak ;

    with DataModule4.ADOQuery1 do
    begin
      SQL.Text := '';
      SQL.Text := 'select * from TestTable';
      Active := True;
    end;
    dbInfo := dbInfo + 'Query status : ' + BoolToStr ( DataModule4.ADOQuery1.Active ) + sLineBreak;

    Datamodule4.Datasource1.Dataset := Datamodule4.Adoquery1;
    dbInfo := dbInfo + 'DataSet : ' + Datamodule4.Datasource1.Dataset.Name + sLineBreak;

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

//procedure TFoMain.FloatAnimation2Finish(Sender: TObject);
//begin
//  posFin := RectSel.Position.X;
//  posDeb := posFin;
//  FloatAnimation2.Stop;
//end;

//procedure TFoMain.FloatAnimation6Finish(Sender: TObject);
//begin
//  posFin := Rectangle6.Position.X;
//  posDeb := posFin;
//  FloatAnimation6.Stop;
//end;


procedure FloatAnimationFinish(floatAnim: TFloatAnimation; rectAnim: TRectangle);
begin
  finalPos := rectAnim.Position.X;
  startPos := finalPos;
  floatAnim.Stop
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

//
procedure TFoMain.Label2Click(Sender: TObject);
begin
  SliderAnimation(FloatAnimation2, RectSel, Label2);
end;

procedure TFoMain.Label3Click(Sender: TObject);
begin
  SliderAnimation(FloatAnimation2 ,RectSel, Label3);
end;

procedure TFoMain.Label4Click(Sender: TObject);
begin
  SliderAnimation(FloatAnimation2, RectSel, Label4);
end;
//

//
procedure TFoMain.Label6Click(Sender: TObject);
begin
  SliderAnimation(FloatAnimation6,Rectangle6, Label6);
end;

procedure TFoMain.Label7Click(Sender: TObject);
begin
  SliderAnimation(FloatAnimation6,Rectangle6, Label7);
end;

procedure TFoMain.Label8Click(Sender: TObject);
begin
  SliderAnimation(FloatAnimation6,Rectangle6, Label8);
end;


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
