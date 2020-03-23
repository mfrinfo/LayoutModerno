inherited frmCartaoListagem: TfrmCartaoListagem
  Caption = 'Cadastro de Cart'#227'o'
  ClientWidth = 971
  ExplicitWidth = 971
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Width = 971
    inherited imgBtnClose: TImage
      Left = 950
    end
    inherited lblTitulo: TLabel
      Width = 109
      Caption = 'Cadastro de Cart'#227'o'
      ExplicitWidth = 109
    end
    inherited pnlHeaderLineTop: TPanel
      Width = 971
    end
    inherited pnlHeaderLineRight: TPanel
      Left = 970
    end
    inherited pnlHeaderLineGray: TPanel
      Width = 955
    end
  end
  inherited pnlFormLineRight: TPanel
    Left = 970
  end
  inherited pnlFormLineBottom: TPanel
    Width = 971
  end
  inherited pnlFormPrincipal: TPanel
    Width = 969
    inherited pnlFormPrincipalTop: TPanel
      Width = 969
      inherited pnlLineBottom: TPanel
        Width = 969
      end
      inherited btnNovo: TJvImgBtn
        Left = 625
      end
      inherited bntModificar: TJvImgBtn
        Left = 740
        OnClick = bntModificarClick
      end
      inherited btnApagar: TJvImgBtn
        Left = 855
        OnClick = btnApagarClick
      end
    end
    inherited pnlFormPrincipalBottom: TPanel
      Width = 969
      inherited pnlLineTop: TPanel
        Width = 969
      end
      inherited DBNavigator1: TDBNavigator
        Hints.Strings = ()
      end
      inherited btnFechar: TJvImgBtn
        Left = 855
      end
    end
    inherited grdListagem: TDBGrid
      Width = 969
      OnDblClick = bntModificarClick
      Columns = <
        item
          Expanded = False
          FieldName = 'cartaoId'
          Width = 167
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricaoCartao'
          Width = 540
          Visible = True
        end>
    end
  end
  inherited QryListagem: TZQuery
    SortedFields = 'descricaoCartao'
    SQL.Strings = (
      'SELECT cartaoId, descricaoCartao FROM Cartao')
    IndexFieldNames = 'descricaoCartao Asc'
    object QryListagemcartaoId: TIntegerField
      DisplayLabel = '#ID'
      FieldName = 'cartaoId'
      ReadOnly = True
    end
    object QryListagemdescricaoCartao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricaoCartao'
      Required = True
      Size = 30
    end
  end
end
