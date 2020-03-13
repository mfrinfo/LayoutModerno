unit uBancoListagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uHerancaListagem, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, System.ImageList, Vcl.ImgList,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.ExtCtrls, uEnum;

type
  TfrmBancoListagem = class(TfrmHerancaListagem)
    QryListagemBancoId: TIntegerField;
    QryListagemCodBanco: TWideStringField;
    QryListagemDescBanco: TWideStringField;
    QryListagemWebSite: TWideStringField;
    procedure btnNovoClick(Sender: TObject);
    procedure bntModificarClick(Sender: TObject);
    procedure btnApagarClick(Sender: TObject);
  private
    procedure AbrirCadastro(estadoCadastro: TEstadoDoCadastro);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBancoListagem: TfrmBancoListagem;

implementation

{$R *.dfm}

uses uBancoCadastro;

{ TfrmBancoListagem }

procedure TfrmBancoListagem.AbrirCadastro(estadoCadastro:TEstadoDoCadastro);
begin
  try
    frmBancoCadastro := TfrmBancoCadastro.Create(Self);
    frmBancoCadastro.EstadoDoCadastro:=estadoCadastro;
    case estadoCadastro of
      ecNovo: begin
        frmBancoCadastro.qryCadastro.ParamByName('BancoId').AsInteger:=-1;
        frmBancoCadastro.qryCadastro.Open;
        frmBancoCadastro.qryCadastro.Append;
      end;
      ecModificar: begin
        frmBancoCadastro.qryCadastro.ParamByName('BancoId').AsInteger:=QryListagemBancoId.AsInteger;
        frmBancoCadastro.qryCadastro.Open;
        frmBancoCadastro.qryCadastro.Edit;
      end;
      ecApagar: begin
        frmBancoCadastro.qryCadastro.ParamByName('BancoId').AsInteger:=QryListagemBancoId.AsInteger;
        frmBancoCadastro.qryCadastro.Open;
        frmBancoCadastro.HabilitaDesabilitaTela(false);
      end;
    end;

    frmBancoCadastro.ShowModal;
  finally
    frmBancoCadastro.Release;
    Self.RefreshQuery(qryListagem);
  end;
end;

procedure TfrmBancoListagem.bntModificarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecModificar);
end;

procedure TfrmBancoListagem.btnApagarClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecApagar);
end;

procedure TfrmBancoListagem.btnNovoClick(Sender: TObject);
begin
  inherited;
  AbrirCadastro(ecNovo);
end;

initialization
   RegisterClass(TfrmBancoListagem);

end.
