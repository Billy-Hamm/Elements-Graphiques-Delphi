object DataModule4: TDataModule4
  Height = 250
  Width = 584
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
  object ADOConnection2: TADOConnection
    Left = 40
    Top = 104
  end
  object ADOQuery2: TADOQuery
    Parameters = <>
    Left = 152
    Top = 104
  end
  object DataSource2: TDataSource
    Left = 272
    Top = 104
  end
end
