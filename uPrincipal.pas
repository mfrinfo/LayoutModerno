unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, uDtmConexao, System.ImageList, Vcl.ImgList, JvExStdCtrls,
  JvButton, JvCtrls, Vcl.Imaging.pngimage, Vcl.WinXCtrls;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipalLeft: TPanel;
    pnlPrincipalCenter: TPanel;
    pnlPrincipalCenterLeft: TPanel;
    pnlPrincipalCenterRight: TPanel;
    pnlPrincipalCenterTop: TPanel;
    pnlPrincipalCenterBottom: TPanel;
    pgcPrincipal: TPageControl;
    tbsMenu: TTabSheet;
    pnlPrincipalTop: TPanel;
    Image1: TImage;
    btnFechar: TJvImgBtn;
    imgButtons: TImageList;
    btnCriarMenu: TBitBtn;
    scbIcones: TScrollBox;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    edtLocalizarMenu: TSearchBox;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCriarMenuClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtLocalizarMenuInvokeSearch(Sender: TObject);
  private
    { Private declarations }
    pnlAcao, pnlDescAcao, pnlLeft, pnlRight, pnlTop:TPanel;
    lblDescAcao:TLabel;
    imgIcone:TImage;
    procedure ClickChamada(Sender: TObject);
    procedure ControleMouseEnterTimage(Sender: TObject);
    procedure ControleMouseLeaveTimage(Sender: TObject);
    procedure DestroyIconesMenuDinamico;
    procedure MontarMenu;
    procedure FiltrarMenuProcesso(aProcesso: String);
    procedure FiltrarMenuLikeTitulo(aLike: String);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  dtmConexao:TdtmConexao;

implementation

{$R *.dfm}

uses uSplash, uHerancaBase, uFuncoes, uBancoListagem;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
begin
  FiltrarMenuProcesso('CNF');
end;

procedure TfrmPrincipal.btnCriarMenuClick(Sender: TObject);
begin
  FiltrarMenuProcesso('FIN');
end;

procedure TfrmPrincipal.btnFecharClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FiltrarMenuProcesso(aProcesso:String);
begin
  dtmConexao.QryMenu.Close;
  dtmConexao.QryMenu.SQL.Clear;
  dtmConexao.QryMenu.SQL.Add(' SELECT menuId, titulo, nomeImagem, nomeFormulario, processo FROM Menu ');
  dtmConexao.QryMenu.SQL.Add('  WHERE processo=:processo ');
  dtmConexao.QryMenu.ParamByName('processo').AsString:=aProcesso;
  dtmConexao.QryMenu.Open;
  MontarMenu;
end;

procedure TfrmPrincipal.FiltrarMenuLikeTitulo(aLike:String);
begin
  dtmConexao.QryMenu.Close;
  dtmConexao.QryMenu.SQL.Clear;
  dtmConexao.QryMenu.SQL.Add(' SELECT menuId, titulo, nomeImagem, nomeFormulario, processo FROM Menu');
  dtmConexao.QryMenu.SQL.Add('  WHERE titulo like :titulo ');
  dtmConexao.QryMenu.ParamByName('titulo').AsString:='%'+aLike+'%';
  dtmConexao.QryMenu.Open;
  MontarMenu;
end;

procedure TfrmPrincipal.MontarMenu;
var iLeft, iTop:Integer;
    cColorPanelIcone: TColor;
begin
  iLeft:=6;
  iTop:=6;

  cColorPanelIcone := $00EBDDDA;

  DestroyIconesMenuDinamico;

  while not dtmConexao.QryMenu.Eof do begin
    pnlAcao:=TPanel.Create(scbIcones);
    pnlAcao.Parent:=scbIcones;
    pnlAcao.BevelOuter:=bvNone;
    pnlAcao.Height:=82;
    pnlAcao.Left:=iLeft;
    pnlAcao.Width:=130;
    pnlAcao.Name:='___pnl___'+dtmConexao.QryMenu.FieldByName('menuId').AsString;
    pnlAcao.Top:=iTop;
    pnlAcao.Caption:=EmptyStr;
    pnlAcao.Tag:=9999;
    pnlAcao.Color:=clWhite;
    pnlAcao.ParentBackground:=false;

    pnlDescAcao:=TPanel.Create(Application);
    pnlDescAcao.Parent:=pnlAcao;
    pnlDescAcao.Color:=cColorPanelIcone;
    pnlDescAcao.Height:=15;
    pnlDescAcao.Align:=alBottom;
    pnlDescAcao.BevelOuter:=bvNone;
    pnlDescAcao.ParentBackground:=false;

    pnlLeft:=TPanel.Create(Application);
    pnlLeft.Parent:=pnlAcao;
    pnlLeft.Align:=alLeft;
    pnlLeft.Width:=1;
    pnlLeft.Color:=cColorPanelIcone;
    pnlLeft.BevelOuter:=bvNone;
    pnlLeft.ParentBackground:=false;

    pnlRight:=TPanel.Create(Application);
    pnlRight.Parent:=pnlAcao;
    pnlRight.Align:=alRight;
    pnlRight.Width:=1;
    pnlRight.Color:=cColorPanelIcone;
    pnlRight.BevelOuter:=bvNone;
    pnlRight.ParentBackground:=false;

    pnlTop:=TPanel.Create(Application);
    pnlTop.Parent:=pnlAcao;
    pnlTop.Align:=alTop;
    pnlTop.Height:=1;
    pnlTop.Color:=cColorPanelIcone;
    pnlTop.BevelOuter:=bvNone;
    pnlTop.ParentBackground:=false;

    lblDescAcao:=TLabel.Create(Application);
    lblDescAcao.Parent:=pnlDescAcao;
    lblDescAcao.Align:=alClient;
    lblDescAcao.Alignment:=taCenter;
    lblDescAcao.Font.Style:=[fsUnderline, fsBold];
    lblDescAcao.Font.Name:='Tahoma';
    lblDescAcao.Font.Size:=8;
    lblDescAcao.Font.Color:=clBlack;
    lblDescAcao.Cursor:=crHandPoint;
    lblDescAcao.Caption:=dtmConexao.QryMenu.FieldByName('titulo').AsString;
    lblDescAcao.Hint:=dtmConexao.QryMenu.FieldByName('nomeFormulario').AsString;
    lblDescAcao.HelpKeyword:='1';
    lblDescAcao.ShowHint:=false;
    lblDescAcao.OnClick:=ClickChamada;

    imgIcone:=TImage.Create(Application);
    imgIcone.Parent:= pnlAcao;
    imgIcone.Align:=alClient;
    imgIcone.Transparent:=true;
    imgIcone.Center:=True;
    imgIcone.Picture.LoadFromFile('C:\udemy\LayoutModerno\images\'+dtmConexao.QryMenu.FieldByName('nomeImagem').AsString);
    imgIcone.Hint:=dtmConexao.QryMenu.FieldByName('nomeFormulario').AsString;
    imgIcone.HelpKeyword:='1';
    imgIcone.ShowHint:=false;
    imgIcone.OnClick:=ClickChamada;
    imgIcone.OnMouseEnter:=ControleMouseEnterTimage;
    imgIcone.OnMouseLeave:=ControleMouseLeaveTimage;

    iLeft:=iLeft+pnlAcao.Width+6;
    if iLeft>(self.Width-(pnlPrincipalLeft.Width+pnlAcao.Width)) then begin
       iLeft:=6;
       iTop:=iTop+pnlAcao.Height+6;
    end;

    dtmConexao.QryMenu.Next;
  end;

  pgcPrincipal.ActivePage := tbsMenu;
end;


procedure TfrmPrincipal.DestroyIconesMenuDinamico;
var I: Integer;
begin
  I := scbIcones.ComponentCount;
  while I > 0 do begin
    Dec(i);
    if TComponent(scbIcones.Components[I]).Tag = 9999 then
       TComponent(scbIcones.Components[I]).Destroy;
  end;
end;

procedure TfrmPrincipal.edtLocalizarMenuInvokeSearch(Sender: TObject);
begin
  FiltrarMenuLikeTitulo(TSearchBox(Sender).Text);
end;

procedure TfrmPrincipal.ControleMouseEnterTimage(Sender: TObject);
var
 ControleAtivo: TWinControl;
begin
   ControleAtivo:= TImage(sender).Parent;
   if ControleAtivo is TPanel then begin
      TPanel(ControleAtivo).color:=$006CC2F0;
      TPanel(ControleAtivo).ParentBackground:=false;
   end;
end;

procedure TfrmPrincipal.ControleMouseLeaveTimage(Sender: TObject);
var
 ControleAtivo: TWinControl;
begin
   ControleAtivo:= TImage(sender).Parent;
   if ControleAtivo is TPanel then begin
      TPanel(ControleAtivo).color:=clWhite;
      TPanel(ControleAtivo).ParentBackground:=false;
   end;
end;

procedure TfrmPrincipal.ClickChamada(Sender: TObject);
begin
  if (Sender is TLabel) then
     CriarAba(TFormClass(FindClass(TLabel(Sender).Hint)), pgcPrincipal, -1)
  else if (Sender is TImage) then
     CriarAba(TFormClass(FindClass(TImage(Sender).Hint)), pgcPrincipal, -1)

end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(dtmConexao) then
     FreeAndNil(dtmConexao);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  try
    dtmConexao:=TdtmConexao.Create(Self);
    dtmConexao.SQLConnection.Connected:=true;
  except
    ShowMessage('Erro ao Conectar o Banco de Dados');
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmSplash:=TfrmSplash.Create(Self);
  frmSplash.Show;
  frmSplash.Refresh;

  FiltrarMenuProcesso('FIN');

  Sleep(1000);

  if Assigned(frmSplash) then
     frmSplash.Free;
end;

end.
