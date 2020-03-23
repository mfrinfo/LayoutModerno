inherited frmBancoCadastro: TfrmBancoCadastro
  Caption = 'Cadastro de Banco'
  ClientHeight = 292
  ExplicitHeight = 292
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    inherited lblTitulo: TLabel
      Width = 105
      Caption = 'Cadastro de Banco'
      ExplicitWidth = 105
    end
  end
  inherited pnlFormLineLeft: TPanel
    Height = 264
    ExplicitHeight = 264
  end
  inherited pnlFormLineRight: TPanel
    Height = 264
    ExplicitHeight = 264
  end
  inherited pnlFormLineBottom: TPanel
    Top = 291
    ExplicitTop = 291
  end
  inherited pnlPrincipal: TPanel
    Height = 264
    ExplicitHeight = 264
    object Label1: TLabel [0]
      Left = 32
      Top = 21
      Width = 19
      Height = 13
      Caption = '#ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel [1]
      Left = 32
      Top = 64
      Width = 55
      Height = 13
      Caption = 'Cod. Banco'
      FocusControl = DBEdit2
    end
    object Label3: TLabel [2]
      Left = 32
      Top = 109
      Width = 93
      Height = 13
      Caption = 'Descri'#231#227'o do Banco'
      FocusControl = DBEdit3
    end
    object Label4: TLabel [3]
      Left = 32
      Top = 155
      Width = 18
      Height = 13
      Caption = 'Site'
      FocusControl = DBEdit4
    end
    inherited pnlPrincipalBottom: TPanel
      Top = 215
      ExplicitTop = 215
    end
    object DBEdit1: TDBEdit
      Tag = 81
      Left = 32
      Top = 37
      Width = 134
      Height = 21
      DataField = 'BancoId'
      DataSource = dtsCadastro
      Enabled = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 80
      Width = 93
      Height = 21
      DataField = 'CodBanco'
      DataSource = dtsCadastro
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 32
      Top = 126
      Width = 654
      Height = 21
      DataField = 'DescBanco'
      DataSource = dtsCadastro
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 32
      Top = 172
      Width = 654
      Height = 21
      DataField = 'WebSite'
      DataSource = dtsCadastro
      TabOrder = 4
    end
  end
  inherited QryCadastro: TZQuery
    Connection = dtmConexao.SQLConnection
    SQL.Strings = (
      
        'SELECT BancoId, CodBanco, DescBanco, WebSite FROM Banco WHERE Ba' +
        'ncoId=:BancoId')
    Params = <
      item
        DataType = ftUnknown
        Name = 'BancoId'
        ParamType = ptUnknown
      end>
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BancoId'
        ParamType = ptUnknown
      end>
    object QryCadastroBancoId: TIntegerField
      DisplayLabel = '#ID'
      FieldName = 'BancoId'
      ReadOnly = True
    end
    object QryCadastroCodBanco: TWideStringField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'CodBanco'
      Required = True
      Size = 3
    end
    object QryCadastroDescBanco: TWideStringField
      DisplayLabel = 'Descri'#231#227'o do Banco'
      FieldName = 'DescBanco'
      Required = True
      Size = 50
    end
    object QryCadastroWebSite: TWideStringField
      DisplayLabel = 'Site'
      FieldName = 'WebSite'
      Size = 100
    end
  end
  inherited updCadastro: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Banco'
      'WHERE'
      
        '  ((Banco.BancoId IS NULL AND :OLD_BancoId IS NULL) OR (Banco.Ba' +
        'ncoId = :OLD_BancoId))')
    InsertSQL.Strings = (
      'INSERT INTO Banco'
      '  (CodBanco, DescBanco, WebSite)'
      'VALUES'
      '  (:CodBanco, :DescBanco, :WebSite)')
    ModifySQL.Strings = (
      'UPDATE Banco SET'
      '  CodBanco = :CodBanco,'
      '  DescBanco = :DescBanco,'
      '  WebSite = :WebSite'
      'WHERE'
      
        '  ((Banco.BancoId IS NULL AND :OLD_BancoId IS NULL) OR (Banco.Ba' +
        'ncoId = :OLD_BancoId))')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CodBanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DescBanco'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'WebSite'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_BancoId'
        ParamType = ptUnknown
      end>
  end
end
