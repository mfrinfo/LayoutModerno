unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ComCtrls,
  Vcl.ExtCtrls, uDtmConexao;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipalLeft: TPanel;
    BitBtn1: TBitBtn;
    pnlPrincipalCenter: TPanel;
    pnlPrincipalCenterLeft: TPanel;
    pnlPrincipalCenterRight: TPanel;
    pnlPrincipalCenterTop: TPanel;
    pnlPrincipalCenterBottom: TPanel;
    pgcPrincipal: TPageControl;
    tbsMenu: TTabSheet;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  dtmConexao:TdtmConexao;

implementation

{$R *.dfm}

uses uSplash, uHerancaBase, uFuncoes, uBancoListagem;

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
begin
  CriarAba(TfrmBancoListagem, pgcPrincipal, -1);
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
  Sleep(3000);


  if Assigned(frmSplash) then
     frmSplash.Free;
end;

end.
