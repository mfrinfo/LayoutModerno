unit uHerancaCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaBase, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, JvExStdCtrls,
  JvButton, JvCtrls;

type
  TfrmHerancaCadastro = class(TfrmHerancaBase)
    pnlPrincipal: TPanel;
    pnlPrincipalBottom: TPanel;
    btnCancelar: TJvImgBtn;
    bntGravar: TJvImgBtn;
    btnApagar: TJvImgBtn;
    procedure btnApagarMouseEnter(Sender: TObject);
    procedure btnApagarMouseLeave(Sender: TObject);
    procedure btnCancelarMouseEnter(Sender: TObject);
    procedure btnCancelarMouseLeave(Sender: TObject);
    procedure bntGravarMouseEnter(Sender: TObject);
    procedure bntGravarMouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHerancaCadastro: TfrmHerancaCadastro;

implementation

{$R *.dfm}

procedure TfrmHerancaCadastro.bntGravarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 4);
end;

procedure TfrmHerancaCadastro.bntGravarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 5);
end;

procedure TfrmHerancaCadastro.btnApagarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 8);
end;

procedure TfrmHerancaCadastro.btnApagarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 9);
end;

procedure TfrmHerancaCadastro.btnCancelarMouseEnter(Sender: TObject);
begin
  inherited;
  ButtonMouseEnter(Sender, 6);
end;

procedure TfrmHerancaCadastro.btnCancelarMouseLeave(Sender: TObject);
begin
  inherited;
  ButtonMouseLeave(Sender, 7);
end;

end.
