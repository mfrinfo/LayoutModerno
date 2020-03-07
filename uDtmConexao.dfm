object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 245
  Width = 399
  object SQLConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    TransactIsolationLevel = tiReadCommitted
    HostName = '.\SQLEXPRESS2017'
    Port = 0
    Database = 'dbLayoutModerno'
    User = 'sa'
    Password = 'mudar@123'
    Protocol = 'mssql'
    LibraryLocation = 'C:\udemy\LayoutModerno\ntwdblib.dll'
    Left = 88
    Top = 40
  end
end
