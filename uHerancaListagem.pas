unit uHerancaListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.Grids, Vcl.DBGrids,
  JvExStdCtrls, JvButton, JvCtrls, System.ImageList, Vcl.ImgList, Vcl.DBCtrls;

type
  TfrmHerancaListagem = class(TfrmHerancaBase)
    pnlFormPrincipal: TPanel;
    pnlFormPrincipalTop: TPanel;
    pnlFormPrincipalBottom: TPanel;
    grdListagem: TDBGrid;
    pnlLineBottom: TPanel;
    pnlLineTop: TPanel;
    mskPesquisar: TMaskEdit;
    lblPesquisarPor: TLabel;
    btnNovo: TJvImgBtn;
    bntModificar: TJvImgBtn;
    btnApagar: TJvImgBtn;
    DBNavigator1: TDBNavigator;
    btnFechar: TJvImgBtn;
    procedure btnNovoMouseEnter(Sender: TObject);
    procedure btnNovoMouseLeave(Sender: TObject);
    procedure bntModificarMouseEnter(Sender: TObject);
    procedure btnApagarMouseEnter(Sender: TObject);
    procedure btnFecharMouseEnter(Sender: TObject);
    procedure bntModificarMouseLeave(Sender: TObject);
    procedure btnApagarMouseLeave(Sender: TObject);
    procedure btnFecharMouseLeave(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHerancaListagem: TfrmHerancaListagem;

implementation

{$R *.dfm}

uses uHerancaCadastro, uFuncoes, uPrincipal;

procedure TfrmHerancaListagem.bntModificarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 2);
end;

procedure TfrmHerancaListagem.bntModificarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 3);
end;

procedure TfrmHerancaListagem.btnApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TfrmHerancaListagem.btnApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 9);
end;

procedure TfrmHerancaListagem.btnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmHerancaListagem.btnFecharMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 10);
end;

procedure TfrmHerancaListagem.btnFecharMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 11);
end;

procedure TfrmHerancaListagem.btnNovoClick(Sender: TObject);
begin
  inherited;
  frmHerancaCadastro := TfrmHerancaCadastro.Create(Self);
  frmHerancaCadastro.ShowModal;
  frmHerancaCadastro.Release;
end;

procedure TfrmHerancaListagem.btnNovoMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 0);
end;

procedure TfrmHerancaListagem.btnNovoMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 1);
end;

procedure TfrmHerancaListagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FecharAba(Self.Caption,frmPrincipal.pgcPrincipal);
end;

end.
