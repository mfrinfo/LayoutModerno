inherited frmHerancaListagem: TfrmHerancaListagem
  Caption = 'Digite o Titulo da Tela Aqui'
  ClientHeight = 596
  ClientWidth = 986
  OnClose = FormClose
  ExplicitWidth = 986
  ExplicitHeight = 596
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlHeader: TPanel
    Width = 986
    ExplicitWidth = 986
    DesignSize = (
      986
      27)
    inherited imgBtnClose: TImage
      Left = 965
      ExplicitLeft = 970
    end
    inherited pnlHeaderLineTop: TPanel
      Width = 986
      ExplicitWidth = 986
    end
    inherited pnlHeaderLineRight: TPanel
      Left = 985
      ExplicitLeft = 985
    end
    inherited pnlHeaderLineGray: TPanel
      Width = 970
      ExplicitWidth = 970
    end
  end
  inherited pnlFormLineLeft: TPanel
    Height = 568
    ExplicitHeight = 568
  end
  inherited pnlFormLineRight: TPanel
    Left = 985
    Height = 568
    ExplicitLeft = 985
    ExplicitHeight = 568
  end
  inherited pnlFormLineBottom: TPanel
    Top = 595
    Width = 986
    ExplicitTop = 595
    ExplicitWidth = 986
  end
  object pnlFormPrincipal: TPanel [4]
    Left = 1
    Top = 27
    Width = 984
    Height = 568
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    object pnlFormPrincipalTop: TPanel
      Left = 0
      Top = 0
      Width = 984
      Height = 70
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        984
        70)
      object lblPesquisarPor: TLabel
        Left = 6
        Top = 20
        Width = 77
        Height = 13
        Caption = 'Pesquisar por'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object pnlLineBottom: TPanel
        Left = 0
        Top = 69
        Width = 984
        Height = 1
        Align = alBottom
        BevelOuter = bvNone
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
      end
      object mskPesquisar: TMaskEdit
        Left = 6
        Top = 37
        Width = 379
        Height = 21
        TabOrder = 1
        Text = ''
        TextHint = 'Digite sua pesquisa'
        OnChange = mskPesquisarChange
      end
      object btnNovo: TJvImgBtn
        Left = 640
        Top = 27
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 1
        Images = imgButtons
        TabOrder = 2
        OnClick = btnNovoClick
        OnMouseEnter = btnNovoMouseEnter
        OnMouseLeave = btnNovoMouseLeave
      end
      object bntModificar: TJvImgBtn
        Left = 755
        Top = 27
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 3
        Images = imgButtons
        TabOrder = 3
        OnMouseEnter = bntModificarMouseEnter
        OnMouseLeave = bntModificarMouseLeave
      end
      object btnApagar: TJvImgBtn
        Left = 870
        Top = 27
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 9
        Images = imgButtons
        TabOrder = 4
        OnMouseEnter = btnApagarMouseEnter
        OnMouseLeave = btnApagarMouseLeave
      end
    end
    object pnlFormPrincipalBottom: TPanel
      Left = 0
      Top = 519
      Width = 984
      Height = 49
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        984
        49)
      object pnlLineTop: TPanel
        Left = 0
        Top = 0
        Width = 984
        Height = 1
        Align = alTop
        BevelOuter = bvNone
        Color = clBlack
        ParentBackground = False
        TabOrder = 0
      end
      object DBNavigator1: TDBNavigator
        Left = 6
        Top = 6
        Width = 224
        Height = 36
        DataSource = DtsListagem
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        TabOrder = 1
      end
      object btnFechar: TJvImgBtn
        Left = 870
        Top = 7
        Width = 100
        Height = 36
        Anchors = [akTop, akRight]
        ImageIndex = 11
        Images = imgButtons
        TabOrder = 2
        OnClick = btnFecharClick
        OnMouseEnter = btnFecharMouseEnter
        OnMouseLeave = btnFecharMouseLeave
      end
    end
    object grdListagem: TDBGrid
      Left = 0
      Top = 70
      Width = 984
      Height = 449
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = True
      DataSource = DtsListagem
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentCtl3D = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = grdListagemKeyDown
      OnTitleClick = grdListagemTitleClick
    end
  end
  object QryListagem: TZQuery
    Connection = dtmConexao.SQLConnection
    Params = <>
    Left = 417
    Top = 35
  end
  object DtsListagem: TDataSource
    DataSet = QryListagem
    Left = 481
    Top = 35
  end
end
