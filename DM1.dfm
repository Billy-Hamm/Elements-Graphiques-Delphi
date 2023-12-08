object DataModule4: TDataModule4
  Height = 386
  Width = 668
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=TestDB;Data Source=ASHEN-A' +
      'CER\ASHEN;Initial File Name="";Trust Server Certificate=True;Ser' +
      'ver SPN="";Authentication="";Access Token="";'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 40
    Top = 16
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Integrated Security=SSPI;Persist Security ' +
      'Info=False;User ID="";Initial Catalog=TestDB;Data Source=ASHEN-A' +
      'CER\ASHEN;Initial File Name="";Trust Server Certificate=True;Ser' +
      'ver SPN="";Authentication="";Access Token="";'
    Parameters = <>
    Left = 144
    Top = 16
  end
  object DataSource1: TDataSource
    Left = 264
    Top = 16
  end
  object DataSource2: TDataSource
    Left = 264
    Top = 112
  end
  object SQLQuery1: TSQLQuery
    Params = <>
    Left = 152
    Top = 112
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'SQLITECONNECTION'
    DriverName = 'Sqlite'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Sqlite'
      'Database=test.db')
    Left = 40
    Top = 112
  end
  object FDConnection1: TFDConnection
    Left = 40
    Top = 200
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 200
  end
end
