inherited frmBancoListagem: TfrmBancoListagem
  Caption = 'Cadastro de Banco'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    ExplicitLeft = -7
    ExplicitTop = -6
    inherited lblTitulo: TLabel
      Width = 105
      Caption = 'Cadastro de Banco'
      ExplicitWidth = 105
    end
  end
  inherited pnlFormPrincipal: TPanel
    inherited pnlFormPrincipalTop: TPanel
      inherited bntModificar: TJvImgBtn
        OnClick = bntModificarClick
      end
      inherited btnApagar: TJvImgBtn
        OnClick = btnApagarClick
      end
    end
    inherited pnlFormPrincipalBottom: TPanel
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
    end
    inherited grdListagem: TDBGrid
      OnDblClick = bntModificarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'BancoId'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CodBanco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescBanco'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WebSite'
          Visible = True
        end>
    end
  end
  inherited QryListagem: TZQuery
    SortedFields = 'CodBanco'
    SQL.Strings = (
      'SELECT BancoId, CodBanco, DescBanco, WebSite FROM Banco')
    IndexFieldNames = 'CodBanco Asc'
    object QryListagemBancoId: TIntegerField
      DisplayLabel = '#ID'
      FieldName = 'BancoId'
      ReadOnly = True
    end
    object QryListagemCodBanco: TWideStringField
      DisplayLabel = 'Cod. Banco'
      FieldName = 'CodBanco'
      Required = True
      Size = 3
    end
    object QryListagemDescBanco: TWideStringField
      DisplayLabel = 'Descri'#231#227'o do Banco'
      FieldName = 'DescBanco'
      Required = True
      Size = 50
    end
    object QryListagemWebSite: TWideStringField
      DisplayLabel = 'Site'
      FieldName = 'WebSite'
      Size = 100
    end
  end
end
