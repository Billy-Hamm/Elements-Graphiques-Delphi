object DataModule4: TDataModule4
  Height = 579
  Width = 1002
  PixelsPerInch = 144
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog="";Data Source=DESKTOP-6F8' +
      'DECJ\ASHEN;Initial File Name="";Trust Server Certificate=True;Se' +
      'rver SPN="";Authentication="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 60
    Top = 24
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=TestDB;Data Source=ASHEN-A' +
      'CER\ASHEN;Initial File Name="";Trust Server Certificate=True;Ser' +
      'ver SPN="";Authentication="";Access Token="";'
    Parameters = <>
    Left = 216
    Top = 24
  end
  object DataSource1: TDataSource
    Left = 396
    Top = 24
  end
  object DataSource2: TDataSource
    Left = 396
    Top = 168
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 228
    Top = 168
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'SQLITECONNECTION'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'Database=test.db')
    Left = 60
    Top = 168
  end
  object FDConnection1: TFDConnection
    Left = 72
    Top = 324
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 228
    Top = 300
  end
end
