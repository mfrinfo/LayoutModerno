object dtmConexao: TdtmConexao
  OldCreateOrder = False
  Height = 245
  Width = 399
  object SQLConnection: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    TransactIsolationLevel = tiReadCommitted
    Connected = True
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
  object QryMenu: TZQuery
    Connection = SQLConnection
    SQL.Strings = (
      'SELECT menuId'
      '      ,titulo'
      '      ,nomeImagem'
      '      ,nomeFormulario'
      '      ,processo'
      '  FROM Menu'
      ' WHERE processo=:processo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'processo'
        ParamType = ptUnknown
      end>
    Left = 216
    Top = 40
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'processo'
        ParamType = ptUnknown
      end>
  end
end
