inherited frmCartaoCadastro: TfrmCartaoCadastro
  Caption = 'Cadastro de Cart'#227'o'
  ClientHeight = 211
  ClientWidth = 457
  ExplicitWidth = 457
  ExplicitHeight = 211
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Width = 457
    inherited imgBtnClose: TImage
      Left = 436
    end
    inherited lblTitulo: TLabel
      Width = 109
      Caption = 'Cadastro de Cart'#227'o'
      ExplicitWidth = 109
    end
    inherited pnlHeaderLineTop: TPanel
      Width = 457
    end
    inherited pnlHeaderLineRight: TPanel
      Left = 456
    end
    inherited pnlHeaderLineGray: TPanel
      Width = 441
    end
  end
  inherited pnlFormLineLeft: TPanel
    Height = 183
  end
  inherited pnlFormLineRight: TPanel
    Left = 456
    Height = 183
  end
  inherited pnlFormLineBottom: TPanel
    Top = 210
    Width = 457
  end
  inherited pnlPrincipal: TPanel
    Width = 455
    Height = 183
    ExplicitWidth = 474
    ExplicitHeight = 205
    object Label1: TLabel [0]
      Left = 32
      Top = 24
      Width = 19
      Height = 13
      Caption = '#ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel [1]
      Left = 32
      Top = 64
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit2
    end
    inherited pnlPrincipalBottom: TPanel
      Top = 134
      Width = 455
    end
    object DBEdit1: TDBEdit
      Tag = 81
      Left = 32
      Top = 40
      Width = 134
      Height = 21
      DataField = 'cartaoId'
      DataSource = dtsCadastro
      Enabled = False
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 32
      Top = 80
      Width = 394
      Height = 21
      DataField = 'descricaoCartao'
      DataSource = dtsCadastro
      TabOrder = 2
    end
  end
  inherited QryCadastro: TZQuery
    Connection = dtmConexao.SQLConnection
    SQL.Strings = (
      
        'SELECT cartaoId, descricaoCartao FROM Cartao WHERE cartaoId=:car' +
        'taoId')
    Params = <
      item
        DataType = ftInteger
        Name = 'cartaoId'
        ParamType = ptInput
      end>
    Left = 233
    Top = 35
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cartaoId'
        ParamType = ptInput
      end>
    object QryCadastrocartaoId: TIntegerField
      DisplayLabel = '#ID'
      FieldName = 'cartaoId'
      ReadOnly = True
    end
    object QryCadastrodescricaoCartao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoCartao'
      Required = True
      Size = 30
    end
  end
  inherited updCadastro: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM Cartao'
      'WHERE'
      
        '  ((Cartao.cartaoId IS NULL AND :OLD_cartaoId IS NULL) OR (Carta' +
        'o.cartaoId = :OLD_cartaoId))')
    InsertSQL.Strings = (
      'INSERT INTO Cartao'
      '  (descricaoCartao)'
      'VALUES'
      '  (:descricaoCartao)')
    ModifySQL.Strings = (
      'UPDATE Cartao SET'
      '  descricaoCartao = :descricaoCartao'
      'WHERE'
      
        '  ((Cartao.cartaoId IS NULL AND :OLD_cartaoId IS NULL) OR (Carta' +
        'o.cartaoId = :OLD_cartaoId))')
    Left = 305
    Top = 35
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'descricaoCartao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_cartaoId'
        ParamType = ptUnknown
      end>
  end
  inherited dtsCadastro: TDataSource
    Left = 369
    Top = 35
  end
end
