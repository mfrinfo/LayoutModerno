inherited frmHerancaCadastro: TfrmHerancaCadastro
  ClientHeight = 345
  ExplicitHeight = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFormLineLeft: TPanel
    Height = 317
  end
  inherited pnlFormLineRight: TPanel
    Height = 317
  end
  inherited pnlFormLineBottom: TPanel
    Top = 344
  end
  object pnlPrincipal: TPanel [4]
    Left = 1
    Top = 27
    Width = 743
    Height = 317
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    ExplicitLeft = 408
    ExplicitTop = 232
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlPrincipalBottom: TPanel
      Left = 0
      Top = 268
      Width = 743
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = -6
      ExplicitTop = 299
      object btnCancelar: TJvImgBtn
        Left = 6
        Top = 7
        Width = 100
        Height = 36
        ImageIndex = 7
        Images = imgButtons
        TabOrder = 0
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
        OnMouseEnter = btnApagarMouseEnter
        OnMouseLeave = btnApagarMouseLeave
      end
    end
  end
end
