inherited frmHerancaCadastro: TfrmHerancaCadastro
  ClientHeight = 345
  KeyPreview = True
  OnKeyDown = FormKeyDown
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    ExplicitLeft = -7
    ExplicitTop = -6
  end
  inherited pnlFormLineLeft: TPanel
    Height = 317
    ExplicitHeight = 317
  end
  inherited pnlFormLineRight: TPanel
    Height = 317
    ExplicitHeight = 317
  end
  inherited pnlFormLineBottom: TPanel
    Top = 344
    ExplicitTop = 344
  end
  object pnlPrincipal: TPanel [4]
    Left = 1
    Top = 27
    Width = 743
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlPrincipalBottom: TPanel
      Left = 0
      Top = 268
      Width = 743
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancelar: TJvImgBtn
        Left = 6
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 7
        Images = imgButtons
        TabOrder = 0
        OnClick = btnCancelarClick
        OnMouseEnter = btnCancelarMouseEnter
        OnMouseLeave = btnCancelarMouseLeave
      end
      object bntGravar: TJvImgBtn
        Left = 112
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 5
        Images = imgButtons
        TabOrder = 1
        OnClick = bntGravarClick
        OnMouseEnter = bntGravarMouseEnter
        OnMouseLeave = bntGravarMouseLeave
      end
      object btnApagar: TJvImgBtn
        Left = 218
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 9
        Images = imgButtons
        TabOrder = 2
        OnClick = btnApagarClick
        OnMouseEnter = btnApagarMouseEnter
        OnMouseLeave = btnApagarMouseLeave
      end
    end
  end
  object QryCadastro: TZQuery
    UpdateObject = updCadastro
    AfterPost = QryCadastroAfterPost
    AfterDelete = QryCadastroAfterDelete
    Params = <>
    Left = 425
    Top = 11
  end
  object updCadastro: TZUpdateSQL
    UseSequenceFieldForRefreshSQL = False
    Left = 497
    Top = 11
  end
  object dtsCadastro: TDataSource
    DataSet = QryCadastro
    Left = 561
    Top = 11
  end
end
