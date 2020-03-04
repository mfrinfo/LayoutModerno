object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Menu Principal'
  ClientHeight = 546
  ClientWidth = 922
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipalLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 546
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 72
    ExplicitHeight = 41
    object BitBtn1: TBitBtn
      Left = 40
      Top = 88
      Width = 121
      Height = 25
      Caption = 'Teste Listagem'
      TabOrder = 0
      OnClick = BitBtn1Click
    end
  end
  object pnlPrincipalCenter: TPanel
    Left = 185
    Top = 0
    Width = 737
    Height = 546
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 191
    object pnlPrincipalCenterLeft: TPanel
      Left = 0
      Top = 10
      Width = 10
      Height = 526
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitLeft = -6
      ExplicitTop = 4
    end
    object pnlPrincipalCenterRight: TPanel
      Left = 727
      Top = 10
      Width = 10
      Height = 526
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 732
    end
    object pnlPrincipalCenterTop: TPanel
      Left = 0
      Top = 0
      Width = 737
      Height = 10
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitLeft = 717
      ExplicitWidth = 546
    end
    object pnlPrincipalCenterBottom: TPanel
      Left = 0
      Top = 536
      Width = 737
      Height = 10
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitTop = 8
    end
    object pgcPrincipal: TPageControl
      Left = 10
      Top = 10
      Width = 717
      Height = 526
      ActivePage = tbsMenu
      Align = alClient
      TabOrder = 4
      object tbsMenu: TTabSheet
        Caption = 'MENU'
      end
    end
  end
end
